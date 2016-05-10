﻿using BH.Community.tools.ToolsHelper;
using e3net.BLL;
using e3net.BLL.Base;
using e3net.Mode.Base;
using e3net.tools;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;
using WeiChatMessageHandle.OpenId;
using ZAppUI.Models;

namespace ZAppUI.Controllers
{
    public class RegisterController : BaseController
    {
        //
        // GET: /Access/
        //public UserBiz userBiz { set; get; }

        public ActionResult Index()
        {
            string code = Request["code"];
            if (code != null && code != "")
            {
                string[] resultArray = OauthLogin.getOpenId(code);
                GetUData.OpenId = resultArray[OauthLogin.OPEND_ID];
                GetUData.Nick_Name = resultArray[OauthLogin.NICK_NAME];
                GetUData.Head_Img_Url = resultArray[OauthLogin.HEAD_IMG_URL];
            }

            ViewBag.src = getUserImg();
            return View();
        }

        [HttpPost]
        public ActionResult Index(LoginModel model)
        {
            ViewBag.src = getUserImg(); ;
            if (model.Phone == null || model.Phone == "")
            {
                ViewData["IsShowAlert"] = true;
                ViewData["Alert"] = "请输入正确的手机号";

            }
            else if (!isNumber(model.Phone))
            {
                ViewData["IsShowAlert"] = true;
                ViewData["Alert"] = "请输入正确的手机号";
            }
            else if (isRegistered(model.Phone))
            {
                ViewData["IsShowAlert"] = true;
                ViewData["Alert"] = "手机已注册";
            }
            else if (model.FirstPassword == null || model.FirstPassword == "" || model.SecondPassword == null || model.SecondPassword == "")
            {
                ViewData["IsShowAlert"] = true;
                ViewData["Alert"] = "请输入密码";

            }
            else if (!model.FirstPassword.Equals(model.SecondPassword))
            {
                ViewData["IsShowAlert"] = true;
                ViewData["Alert"] = "密码不一致";

            }
            else
            {
                string openid = GetUData.OpenId;
                string nickName = GetUData.Nick_Name;
                string headImgUrl = GetUData.Head_Img_Url;

                DateTime now = DateTime.Now;
                Guid guid = Guid.NewGuid();
                addUser(model, now, guid, openid);
                addUserInfo(now, guid, nickName, headImgUrl, model.Phone);

                ViewData["IsShowAlert"] = true;
                ViewData["Alert"] = "注册成功";
                return RedirectToRoute("home");
            }
            return View();
        }

        //判断手机号
        private bool isNumber(string s)
        {
            string dianxin = @"^1[3578][01379]\d{8}$";
            Regex d = new Regex(dianxin);
            string liantong = @"^1[34578][01256]\d{8}$";
            Regex l = new Regex(liantong);
            string yidong = @"^(1[34578][0123456789]\d{8})$";
            Regex y = new Regex(yidong);
            return d.IsMatch(s) || l.IsMatch(s) || y.IsMatch(s);
        }
        //添加用户
        private void addUser(LoginModel model, DateTime now, Guid guid, string openId)
        {
            User newUser = new User();
            newUser.UserId = guid;
            //特殊字符过滤
            newUser.LoginName = FilterTools.FilterSpecial(model.Phone);
            newUser.Password = FilterTools.FilterSpecial(model.FirstPassword);
            newUser.WeiXinId = openId;

            newUser.CreateTime = now;
            newUser.UpdateTime = now;
            newUser.isDeleted = false;

            UserBiz userBiz = new UserBiz();
            userBiz.Add(newUser);
        }
        //添加用户信息
        private void addUserInfo(DateTime now, Guid guid, String nickName, String imgUrl, String phone)
        {
            AppUserInfo userInfo = new AppUserInfo();
            userInfo.AppUserInfoId = Guid.NewGuid();
            userInfo.UserId = guid;
            //特殊字符过滤
            userInfo.Phone = FilterTools.FilterSpecial(phone);
            userInfo.Nickname = FilterTools.FilterSpecial(nickName);
            userInfo.ImgeUrl = FilterTools.FilterSpecial(imgUrl);

            userInfo.AddTime = now;
            userInfo.UpdateTime = now;
            userInfo.isDeleted = false;

            AppUserInfoBiz userInfoBiz = new AppUserInfoBiz();
            userInfoBiz.Add(userInfo);
        }
        //检索手机号是否已注册
        private bool isRegistered(String loginName)
        {
            UserBiz userBiz = new UserBiz();

            DataSet result = userBiz.ExecuteSqlToDataSet("EXEC [TireTreasureDB].[dbo].[proc_GetUserLoginNameByLoginName] '" + loginName + "'");
            if (result.Tables.Count > 0 && result.Tables[0].Rows.Count > 0)
            {
                return true;
            }
            return false;
        }
        public string getUserImg()
        {
            string imgSrc = GetUData.Head_Img_Url;
            if (imgSrc != null)
                return imgSrc;
            else
            {
                AppUserInfoBiz userInfoBiz = new AppUserInfoBiz();
                string openId = GetUData.OpenId;

                DataSet result = userInfoBiz.ExecuteSqlToDataSet("EXEC [TireTreasureDB].[dbo].[proc_GetUserInfo] '" + openId + "'");
                if (result.Tables.Count > 0 && result.Tables[0].Rows.Count > 0)
                {
                    Object headImgUrl = result.Tables[0].Rows[0]["ImgeUrl"];
                    imgSrc = headImgUrl.ToString();
                }
            }
            return imgSrc;
        }
    }
}
