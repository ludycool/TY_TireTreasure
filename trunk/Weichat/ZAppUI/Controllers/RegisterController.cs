using BH.Community.tools.ToolsHelper;
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
using TZHSWEET.Common;
using WeiChatMessageHandle.OpenId;
using ZAppUI.App_Code;
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
            string state = Request["state"];

            if (code != null && code != "")
                setGetUDataParams(code, state);

            if (Util.isOpenIdExist(GetUData.OpenId))
                return RedirectToAction("Index", "User");

            ViewBag.src = GetUData.Head_Img_Url;
            return View();
        }
        private void setGetUDataParams(string code, string state)
        {
            if (GetUData == null)
                GetUData = new Models.UserData();
            Dictionary<string, string> result = OauthLogin.getUserInfo(code);
            GetUData.OpenId = result[OauthLogin.OPEN_ID];
            GetUData.Nick_Name = result[OauthLogin.NICK_NAME];
            GetUData.Head_Img_Url = result[OauthLogin.HEAD_IMG_URL];
            GetUData.Controller = state;
        }
        [HttpPost]
        public ActionResult Index(LoginModel model)
        {
            ViewBag.src = GetUData.Head_Img_Url;

            if (model.Phone == null || model.Phone == "")
            {
                ViewData["IsShowAlert"] = true;
                ViewData["Alert"] = "请输入正确的手机号";
            }
            else if (!Util.isNumber(model.Phone))
            {
                ViewData["IsShowAlert"] = true;
                ViewData["Alert"] = "请输入正确的手机号";
            }
            else if (isPhoneNumberExist(model.Phone))
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
                DateTime now = DateTime.Now;
                Guid guid = Guid.NewGuid();

                addUser(model, now, guid);
                //TODO BUG  添加用户信息时有可能为null
                addUserInfo(now, guid, model);

                if (!GetUData.User_Id.ToString().Equals(Guid.Empty))
                {
                    addUserReferences(GetUData.User_Id, guid);
                }
                ViewData["IsShowAlert"] = true;
                ViewData["Alert"] = "注册成功";
                ViewBag.url = GetUData.Controller;
            }
            return View();
        }
        //检索手机号是否已注册
        private bool isPhoneNumberExist(String loginName)
        {
            UserBiz userBiz = new UserBiz();

            DataSet result = userBiz.ExecuteSqlToDataSet("EXEC [TireTreasureDB].[dbo].[proc_GetUserLoginNameByLoginName] '" + loginName + "'");
            if (result.Tables.Count > 0 && result.Tables[0].Rows.Count > 0)
            {
                return true;
            }
            return false;
        }
        //添加用户到表
        private void addUser(LoginModel model, DateTime now, Guid guid)
        {
            User newUser = new User();
            newUser.UserId = guid;
            //特殊字符过滤
            newUser.LoginName = FilterTools.FilterSpecial(model.Phone);
            newUser.Password = DESProvider.Encrypt(FilterTools.FilterSpecial(model.FirstPassword), ConstantList.PASSWORD_ENCRYPT);
            newUser.WeiXinId = GetUData.OpenId;
            newUser.TrueName = "";
            newUser.CreateTime = now;
            newUser.UpdateTime = now;
            newUser.isDeleted = false;

            UserBiz userBiz = new UserBiz();
            userBiz.Add(newUser);
        }
        //添加用户信息到表
        private void addUserInfo(DateTime now, Guid guid, LoginModel model)
        {
            AppUserInfo userInfo = new AppUserInfo();
            userInfo.AppUserInfoId = Guid.NewGuid();
            userInfo.UserId = guid;
            //特殊字符过滤
            userInfo.Phone = FilterTools.FilterSpecial(model.Phone);
            userInfo.Nickname = FilterTools.FilterSpecial(GetUData.Nick_Name);
            userInfo.ImgeUrl = GetUData.Head_Img_Url;

            userInfo.ReferencesId = GetUData.User_Id;

            userInfo.AddTime = now;
            userInfo.UpdateTime = now;
            userInfo.isDeleted = false;

            AppUserInfoBiz userInfoBiz = new AppUserInfoBiz();
            userInfoBiz.Add(userInfo);
        }
 
        ////获取用户头像
        //private string getUserImg()
        //{
        //    string imgUrl = GetUData.Head_Img_Url;
        //    if (imgUrl != null)
        //    {
        //        return imgUrl;
        //    }
        //    else
        //    {
        //        AppUserInfoBiz userInfoBiz = new AppUserInfoBiz();

        //        DataSet result = userInfoBiz.ExecuteSqlToDataSet("EXEC [TireTreasureDB].[dbo].[proc_GetUserInfoByWeiXinId] '" + GetUData.OpenId + "'");
        //        if (result.Tables[0].Rows.Count > 0)
        //        {
        //            imgUrl = result.Tables[0].Rows[0]["ImgeUrl"].ToString();
        //        }
        //    }
        //    return imgUrl;
        //}

        //添加用户到推荐表
        private void addUserReferences(Guid userId, Guid toUserId)
        {
            ReferencesBiz referencesBiz = new ReferencesBiz();

            DataSet result = referencesBiz.ExecuteSqlToDataSet("EXEC [TireTreasureDB].[dbo].[proc_GetIdByUserId] '" + userId + "'");
            string recommendId = result.Tables[0].Rows[0]["Id"].ToString();

            References references = new References();
            references.UserId = userId;
            references.ToUserId = toUserId;
            references.InvitationCode = FilterTools.FilterSpecial(recommendId);
            references.States = ConstantList.INVITE_SUCCESS;
            references.CategoryId = ConstantList.NORMAL_USER;
            references.AddTime = DateTime.Now;
            references.isDeleted = false;

            referencesBiz.Add(references);
        }

    }
}
