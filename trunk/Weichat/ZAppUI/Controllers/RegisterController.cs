using BH.Community.tools.ToolsHelper;
using e3net.BLL;
using e3net.BLL.Base;
using e3net.Mode.Base;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;
using ZAppUI.Models;

namespace ZAppUI.Controllers
{
    public class RegisterController : BaseController
    {
        //
        // GET: /Access/
        //public UserBiz userBiz { set; get; }
        string[] result;
        public ActionResult Index()
        {
            result = getAccessToken(GetUData.OpenId);
            ViewBag.src = result[2];
            return View();
        }

        [HttpPost]
        public ActionResult Index(LoginModel model)
        {
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
                string openid = result[0];
                string nickName = result[1];
                string headImgUrl = result[2];

                DateTime now = DateTime.Now;
                Guid guid = Guid.NewGuid();
                addUser(model, now, guid, openid);
                addUserInfo(now, guid, nickName, headImgUrl, model.Phone);

                ViewData["IsShowAlert"] = true;
                ViewData["Alert"] = "注册成功";
            }
            return View();
        }
        private string APP_ID = "wx5c2b91a9bbef68b4";
        private string APP_SECRET = "e895093b0a7227eac53199d8bcf4e031";

        private HttpUtil request = new HttpUtil();
        private JObject obj;



        private string[] getAccessToken(string code)
        {
            string[] strArray = new String[3];
            if (code != null)
            {
                string url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=" + APP_ID + "&secret=" + APP_SECRET + "&code=" + code + "&grant_type=authorization_code";
                string result = request.GetRequest(url);

                obj = JObject.Parse(result);
                string token = obj["access_token"].ToString();
                string openid = obj["openid"].ToString();
                string refreshToken = obj["refresh_token"].ToString();
                //str = "access_token:" + token + "\n" + "openid:"+openid;

                string userResult = getUserInfo(token, openid);
                obj = JObject.Parse(userResult);
                string nickName = obj["nickname"].ToString();
                string headImgUrl = obj["headimgurl"].ToString();

                strArray[0] = openid;
                strArray[1] = nickName;
                strArray[2] = headImgUrl;
            }
            return strArray;
        }

        private string getUserInfo(string token, string openid)
        {
            string url = "https://api.weixin.qq.com/sns/userinfo?access_token=" + token + "&openid=" + openid + "&lang=zh_CN";
            string result = request.GetRequest(url);
            return result;
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

            newUser.LoginName = model.Phone;
            newUser.Password = model.FirstPassword;
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

            userInfo.Phone = phone;
            userInfo.Nickname = nickName;
            userInfo.ImgeUrl = imgUrl;

            userInfo.AddTime = now;
            userInfo.UpdateTime = now;
            userInfo.isDeleted = false;

            AppUserInfoBiz userInfoBiz = new AppUserInfoBiz();
            userInfoBiz.Add(userInfo);
        }
        //检索手机号是否注册
        private bool isRegistered(String phone)
        {
            AppUserInfoBiz userInfoBiz = new AppUserInfoBiz();

            DataSet result = userInfoBiz.ExecuteSqlToDataSet("SELECT [LoginName] FROM [TireTreasureDB].[dbo].[TT_User] where LoginName='" + phone + "'");

            DataTable userTable = result.Tables[0];
            try
            {
                if (userTable.Rows[0]["LoginName"] != null)
                {
                    return true;
                }
            }
            catch (IndexOutOfRangeException exception)
            {

            }
            return false;
        }
    }
}
