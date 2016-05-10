using e3net.BLL.Base;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using e3net.BLL.Money;
using WeiChatMessageHandle;
using System.Web.Security;
using WeChatJsSdk.SdkCore;
using System.Web.Script.Serialization;
using BH.PalmHosp.tools.ToolsHelper;
using TZHSWEET.Common;
using e3net.Mode.Base;
using e3net.tools;
namespace ZAppUI.Controllers
{
    public class UserController : BaseController
    {
        //
        // GET: /User/
        public ActionResult Index()
        {
            getNickName();
            getBalance();  
            return View();
        }
       
        //显示用户昵称头像
        private void getNickName()
        {
            AppUserInfoBiz userInfoBiz = new AppUserInfoBiz();
            string openId = GetUData.OpenId;

            DataSet result = userInfoBiz.ExecuteSqlToDataSet("EXEC	[TireTreasureDB].[dbo].[proc_GetUserInfo] '" + openId + "'");
            if (result.Tables.Count > 0 && result.Tables[0].Rows.Count > 0)
            {
                Object nickName = result.Tables[0].Rows[0]["Nickname"];
                Object headImgUrl = result.Tables[0].Rows[0]["ImgeUrl"];

                ViewBag.nickName = nickName.ToString();
                ViewBag.headImgUrl = headImgUrl.ToString();

            }
        }
        //显示用户余额
        private void getBalance()
        {
            string openId = GetUData.OpenId;

            BalanceBiz balanceBiz = new BalanceBiz();
            DataSet isHaveBalance = balanceBiz.ExecuteSqlToDataSet("EXEC [TireMoneyDB].[dbo].[proc_CheckBalanceInfo] '" + openId + "'");
            if (!(isHaveBalance.Tables.Count > 0) && !(isHaveBalance.Tables[0].Rows.Count > 0))
            {
                createUserBalanceInfo(openId);
               
            }
                DataSet result = balanceBiz.ExecuteSqlToDataSet("EXEC [TireMoneyDB].[dbo].[proc_CheckBalanceInfo] '" + openId + "'");
                Object balance = result.Tables[0].Rows[0]["AMneys"];
                ViewBag.balance = balance.ToString();
        }
        private void createUserBalanceInfo(string openId)
        {
            BalanceBiz balanceBiz = new BalanceBiz();
            Guid baId = Guid.NewGuid();
            DateTime now = DateTime.Now;
            balanceBiz.ExecuteSqlToDataSet("EXEC [TireMoneyDB].[dbo].[proc_AddUserBalanceInfo] '" + openId + "','" + now + "','" + now + "'");
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



        public ActionResult recommend()
        {
            //JSSDK sdk = new JSSDK(WechatParamList.APP_ID, WechatParamList.APP_SECRET, true);
            //JsApiEnum jsApilist = (JsApiEnum)0x3ffffffff;

            //SignPackage config = sdk.GetSignPackage(jsApilist);
            //JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            //ViewBag.config = serializer.Serialize(config);

            shareUrl();

            return View();
        }
        
        public string getUserId()
        {
            string loginName = null;

            UserBiz userBiz = new UserBiz();
            DataSet result = userBiz.ExecuteSqlToDataSet("EXEC [TireTreasureDB].[dbo].[proc_GetUserIdByWeiXinID] '" + GetUData.OpenId + "'");
            if ((result.Tables.Count > 0) && (result.Tables[0].Rows.Count > 0))
            {
                Object phone = result.Tables[0].Rows[0]["UserId"];
                loginName = phone.ToString();
            }
            return loginName;          
        }

        string Key = "12345678";

        public void shareUrl()
        {           
            string userId=XXTEAHelper.Encrypt(getUserId(),Key);
            string url = "/user/encoderUrl?param=" + userId + "&type=recommend";
            ViewBag.url = url;          
        }
        public void encoderUrl()
        {
            string userId =FilterTools.FilterSpecial( XXTEAHelper.Decrypt(Request["param"], Key));
            string type = FilterTools.FilterSpecial(Request["type"]);

            if (type.Equals("recommend"))
            {
                UserBiz userBiz = new UserBiz();
                DataSet result = userBiz.ExecuteSqlToDataSet("EXEC [TireTreasureDB].[dbo].[proc_GetUserIdByWeiXinID] '" + userId + "'");
                if ((result.Tables.Count > 0) && (result.Tables[0].Rows.Count > 0))
                {

                    //ReferencesBiz referencesBiz = new ReferencesBiz();
                    //References references = new References();
                    //references.UserId = userId;
                    string redirect_uri = "http://test.luntaibaobao.com/register";
                    //    string state = "test";
                    //    string url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + APP_ID + "&redirect_uri=" + redirect_uri + "&response_type=code&scope=snsapi_base&state=" + state + "#wechat_redirect";
                    //    return Redirect(url);
                }
                return "";
            }
            else
            {
                //TODO
            }
        }
    }
}
