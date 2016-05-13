

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

        //判断是否注册
        public ActionResult isRegister()
        {

            string openId = GetUData.OpenId;
            UserBiz userBiz = new UserBiz();

            DataSet result = userBiz.ExecuteSqlToDataSet("EXEC [TireTreasureDB].[dbo].[proc_GetUserLoginNameByWeiXinID] '" + openId + "'");
            if (result.Tables.Count > 0 && result.Tables[0].Rows.Count > 0)
            {
                return RedirectToAction("Index", "User");
            }
            string redirect_uri = "http://test.luntaibaobao.com/register";
            string state = ConstantList.NORMAL_REGISTER;
            string url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + WechatParamList.APP_ID + "&redirect_uri=" + redirect_uri + "&response_type=code&scope=snsapi_userinfo&state=" + state + "#wechat_redirect";
            return Redirect(url);
            //return RedirectToAction("Index", "Register");
        }

        
    }
}
