

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
using ZAppUI.Models;
using e3net.BLL.Base;
using System.Data;
using WeiChatMessageHandle.OpenId;
using WeiChatMessageHandle;
using ZAppUI.App_Code;
namespace ZAppUI.Controllers
{

    //[Export]
    public class HomeController : BaseController
    {

        //[Dependency]
        //public RMS_MenusBiz uBiz { get; set; }
        //[Dependency]
        //public RMS_UserBiz userBiz { get; set; }
        public ActionResult Index()
        {       
            string code = Request["code"];
            if (GetUData == null)
            {
                GetUData = new Models.UserData();
            }
            GetUData.OpenId = "ov0HljubVsu4mOIfZsTMry_s3CNM";
            if (code != null && code != "")
            {
                GetUData.OpenId = OauthLogin.getOpenId(code);     
            }
            return View();
        }
        
    }
}
