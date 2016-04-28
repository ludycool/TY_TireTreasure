using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using e3net.tools;
using BH.Community.tools.ToolsHelper;
using TZHSWEET.Common;
using Newtonsoft.Json.Linq;
namespace ZAppUI.Controllers
{
    public class OAuthController : Controller
    {
        //
        // GET: /OAuth/
        public ActionResult Index()
        {
            string code = Request["code"];
            ViewBag.code=code;
            //ViewBag.code = getCode();
            return View();
        }
        //private string GRANT_TYPE = "authorization_code";
        private string getCode()
        {
            string APP_ID = "wx5c2b91a9bbef68b4";
             HttpUtil request = new HttpUtil();
            string redirect_uri = "http://5705395e.nat123.net/oauth";
            string state = "test";
            string url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + APP_ID + "&redirect_uri=" + redirect_uri + "&response_type=code&scope=snsapi_base&state=" + state + "#wechat_redirect";
             return request.GetRequest(url);
            //string result = request.GetRequest(url);
            //obj = JObject.Parse(result);
            //string code = obj["code"].ToString();
            //return code;
        }
       
    }
}
