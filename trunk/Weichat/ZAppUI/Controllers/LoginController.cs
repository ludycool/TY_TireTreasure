using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ZAppUI.Controllers
{
    public class LoginController : Controller
    {
        //
        // GET: /Login/

        public ActionResult Index()
        {
            return View();
        }
        private string APP_ID = "wx5c2b91a9bbef68b4";
        public ActionResult getCode()
        {
            string redirect_uri = "http://5705395e.nat123.net/register";
            string state = "test";
            string url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + APP_ID + "&redirect_uri=" + redirect_uri + "&response_type=code&scope=snsapi_base&state=" + state + "#wechat_redirect";
            return Redirect(url);
        }
    }
}
