using e3net.BLL.Base;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WeiChatMessageHandle;
using System.Web.Security;
using WeChatJsSdk.SdkCore;
using System.Web.Script.Serialization;
using BH.PalmHosp.tools.ToolsHelper;
using TZHSWEET.Common;
using e3net.Mode.Base;
using e3net.tools;
using System.Drawing;
using System.IO;
using ZAppUI.App_Code;
using CommonFunction;
using e3net.BLL.TireMoneyDB;

namespace ZAppUI.Controllers
{
    public class UserController : BaseController
    {
        //
        // GET: /User/
        public ActionResult Index()
        {
            //判断是否已经注册
            if (!isRegister())
            {             
                string controller = RouteData.Values["controller"].ToString();
                return Redirect(redirctUrl(controller));
            }

            showUserInfo();
            showBalance();
            return View();
        }

        //显示用户昵称头像
        private void showUserInfo()
        {
            AppUserInfoBiz userInfoBiz = new AppUserInfoBiz();
            string openId = GetUData.OpenId;
            DataSet result = userInfoBiz.ExecuteSqlToDataSet("EXEC	[TireTreasureDB].[dbo].[proc_GetUserInfoByWeiXinId] '" + openId + "'");
            if (result.Tables.Count > 0 && result.Tables[0].Rows.Count > 0)
            {
                ViewBag.nickName = result.Tables[0].Rows[0]["Nickname"].ToString();
                ViewBag.headImgUrl = result.Tables[0].Rows[0]["ImgeUrl"].ToString();
            }
        }
        //显示用户余额
        private void showBalance()
        {
            addUserBalanceInfo();

            TM_BalceBiz balanceBiz = new TM_BalceBiz();
            DataSet result = balanceBiz.ExecuteSqlToDataSet("EXEC [TireMoneyDB].[dbo].[proc_CheckBalanceInfo] '" + GetUData.OpenId + "'");
            ViewBag.balance = result.Tables[0].Rows[0]["AMneys"];

        }
        //添加用户余额到表
        private void addUserBalanceInfo()
        {
            string openId = GetUData.OpenId;
            TM_BalceBiz balanceBiz = new TM_BalceBiz();
            DataSet result = balanceBiz.ExecuteSqlToDataSet("EXEC [TireMoneyDB].[dbo].[proc_CheckBalanceInfo] '" + openId + "'");
            if (result.Tables[0].Rows.Count == 0)
            {
                Guid baId = Guid.NewGuid();
                DateTime now = DateTime.Now;
                balanceBiz.ExecuteSqlToDataSet("EXEC [TireMoneyDB].[dbo].[proc_AddUserBalanceInfo] '" + openId + "','" + now + "','" + now + "'");
            }
        }


        //private string getUrl()
        //{
        //    return "http://" + Request.Url.Host + Request.Path;          
        //}

        //string timestamp = GetJsParam.generateTimeStamp().ToString();
        //string noncestr = GetJsParam.generateNoncestr();    

        //public string generateSignature(string timestamp, string noncestr)
        //{
        //    string jsapi_ticket = GetJsParam.getJsApiTicket();
        //    //string jsapi_ticket = "bxLdikRXVbTPdHSM05e5ux0lWAqibUJZA_EYsbIYfhEZKc8OyZW1m4eLYglBLgCKC0JGvz964nia_9GtnPEMVw";
        //    string url = getUrl();
        //    ViewBag.url = url;
        //    string beforeSignature = "jsapi_ticket=" + jsapi_ticket + "&noncestr=" + noncestr + "&timestamp=" + timestamp + "&url=" + url + "";

        //    string generatedSignature = FormsAuthentication.HashPasswordForStoringInConfigFile(beforeSignature, "SHA1");
        //    return generatedSignature.ToLower();
        //}
        //public void signPackge()
        //{

        //    JSSDK sdk = new JSSDK(WechatParamList.APP_ID, WechatParamList.APP_SECRET, true);
        //    JsApiEnum jsApilist = (JsApiEnum)0x3ffffffff;

        //    SignPackage config = sdk.GetSignPackage(jsApilist);
        //    JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
        //    ViewBag.config = serializer.Serialize(config);

        //    //ViewBag.appid = WechatParamList.APP_ID;
        //    //ViewBag.timestamp = timestamp;
        //    //ViewBag.nonceStr = noncestr;
        //    //ViewBag.signature = generateSignature(timestamp, noncestr);
        //}

    }
}
