

using e3net.common.SysMode;

using System;
using System.Collections.Generic;
//using System.ComponentModel.Composition;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using Microsoft.Practices.Unity;
using e3net.Mode;
using e3net.BLL;
using e3net.Mode.V_mode;
using BH.Community.tools.ToolsHelper;
using TZHSWEET.Common;
using Newtonsoft.Json.Linq;

namespace ZAppUI.Controllers
{

    //[Export]
    public class HomeController : BaseController
    {

        //[Dependency]
        //public RMS_MenusBiz uBiz { get; set; }
        //[Dependency]
        //public RMS_UserBiz userBiz { get; set; }
        String code;
        public ActionResult Index()
        {
            GetUData = new Models.UserData();

            ViewBag.Message = "修改此模板以快速启动你的 ASP.NET MVC 应用程序。";
            //  ViewBag.ManuString= GetManu();
            ViewBag.testString = "<div title=\"功能管理\" iconcls=\"icon-edit\" style=\"padding: 10px;\"><p><a href=\"javascript:void(0)\" src=\"/RoleManagement/Index\" class=\"MenuLink\">角色管理</a></p> </div>";

            //if (Request["code"] != null && string.IsNullOrEmpty(Request["code"]))
            //{
                GetUData.OpenId = Request["code"];
                ViewData["code"] = Request["code"];
            //code = Request["code"];
            //ViewBag.code = code;
            //}
            //else
            //{
            //    getCode();
            //}
            return View();
        }


        public ActionResult About()
        {
            ViewBag.Message = "你的应用程序说明页。";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "你的联系方式页。";

            return View();
        }


        public ActionResult login()
        {
              
            return View();
        }
       
        public ActionResult reg()
        {
            string code = GetUData.OpenId;
            string str = getAccessToken(code);
            ViewBag.str = code;
            return View();
        }
        
       
        private string APP_ID = "wx5c2b91a9bbef68b4";
        private string APP_SECRET = "e895093b0a7227eac53199d8bcf4e031";

        private HttpUtil request = new HttpUtil();
        private JObject obj;

        public ActionResult getCode()
        {
            string redirect_uri = "http://5705395e.nat123.net/home/reg";
            string state = "test";
            string url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + APP_ID + "&redirect_uri=" + redirect_uri + "&response_type=code&scope=snsapi_base&state=" + state + "#wechat_redirect";
            return Redirect(url);
        }
        public UserInfoBiz DDBiz
        {
            set;
            get;
        }
        private string getAccessToken(string code)
        {
            string str = null;
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
                str = nickName;


                //UserInfo userInfo = new UserInfo();
                //userInfo.AppUserInfoId = Guid.NewGuid();
                //userInfo.UserId= Guid.NewGuid();
                //userInfo.OpenId=openid;
                //userInfo.NickName=nickName;
                //userInfo.HeadImg = headImgUrl;
                //userInfo.AddTime = DateTime.Now;

                //DDBiz.Add(userInfo);
            }
            return str;

        }

        private string getUserInfo(string token, string openid)
        {
            string url = "https://api.weixin.qq.com/sns/userinfo?access_token=" + token + "&openid=" + openid + "&lang=zh_CN";
            string result = request.GetRequest(url);
            return result;
        }
    }
}
