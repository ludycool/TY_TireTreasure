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
            getNickName();
            getBalance();
            return View();
        }

        //显示用户昵称头像
        private void getNickName()
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
        private void getBalance()
        {
            string openId = GetUData.OpenId;

            TM_BalceBiz balanceBiz = new TM_BalceBiz();
            DataSet getBalanceInfo = balanceBiz.ExecuteSqlToDataSet("EXEC [TireMoneyDB].[dbo].[proc_CheckBalanceInfo] '" + openId + "'");
            
            
            if (getBalanceInfo.Tables[0].Rows.Count == 0)
            {
                addUserBalanceInfo(openId);
            }
            DataSet result = balanceBiz.ExecuteSqlToDataSet("EXEC [TireMoneyDB].[dbo].[proc_CheckBalanceInfo] '" + openId + "'");
            ViewBag.balance = result.Tables[0].Rows[0]["AMneys"];
            
            
        }
        //添加用户余额到表
        private void addUserBalanceInfo(string openId)
        {
            TM_BalceBiz balanceBiz = new TM_BalceBiz();
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


        ////推荐页面
        //public ActionResult recommend()
        //{
        //    //JSSDK sdk = new JSSDK(WechatParamList.APP_ID, WechatParamList.APP_SECRET, true);
        //    //JsApiEnum jsApilist = (JsApiEnum)0x3ffffffff;

        //    //SignPackage config = sdk.GetSignPackage(jsApilist);
        //    //JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
        //    //ViewBag.config = serializer.Serialize(config);

        //    //GetUData.OpenId = "ov0HljubVsu4mOIfZsTMry_s3CNM";

        //    ViewBag.num = getNumOfRecommend();

        //    generateQRImage();
        //    return View();
        //}


        //public void SaveImg(string strPath, Bitmap img)
        //{
        //    //保存图片到目录
        //    if (Directory.Exists(strPath))
        //    {
        //        //文件名称
        //        string QR_code = "QR_code.png";
        //        img.Save(strPath + "/" + QR_code, System.Drawing.Imaging.ImageFormat.Png);
        //    }
        //    else
        //    {
        //        //当前目录不存在，则创建
        //        Directory.CreateDirectory(strPath);
        //    }
        //}
        ////生成二维码
        //public void generateQRImage()
        //{
        //    string currentPath = System.Web.HttpContext.Current.Server.MapPath(System.Web.HttpContext.Current.Request.ApplicationPath + "" + @"/Content/Qr_code_img");

        //    string content=generateRecommendUrl();
        //    Bitmap RQBmp = QRCodeHelper.Create(content, 410);
        //    RQBmp = QRCodeHelper.GetThumbnail(RQBmp, 400, 400);

        //    SaveImg(currentPath, RQBmp);
        //}

        ////生成推荐链接
        //public string generateRecommendUrl()
        //{
        //    string id = getUserId();
        //    if (id != null)
        //        id = DESProvider.Encrypt(id, ConstantList.ENCRYPT_KEY);

        //    return "http://" + Request.Url.Host + "/" + RouteData.Route.GetRouteData(this.HttpContext).Values["controller"] + "/encoderRecommendUrl?param=" + id + "&type=recommend";
        //}

        ////获取推荐人ID
        //public string getUserId()
        //{
        //    UserBiz userBiz = new UserBiz();
        //    DataSet result = userBiz.ExecuteSqlToDataSet("EXEC [TireTreasureDB].[dbo].[proc_GeRecommendIdByWeiXinId] '" + GetUData.OpenId + "'");

        //    return result.Tables[0].Rows[0]["Id"].ToString();
        //}


        ////推荐链接解码
        //public ActionResult encoderRecommendUrl()
        //{
        //    string recommendId = FilterTools.FilterSpecial(DESProvider.Decrypt(Request["param"], ConstantList.ENCRYPT_KEY));
        //    string type = FilterTools.FilterSpecial(Request["type"]);

        //    if (type.Equals("recommend"))
        //    {
        //        UserBiz userBiz = new UserBiz();
        //        DataSet result = userBiz.ExecuteSqlToDataSet("EXEC [TireTreasureDB].[dbo].[proc_GetUserIdByRecommendId] '" + recommendId + "'");
        //        if (result.Tables[0].Rows.Count > 0)
        //        {
        //            if (GetUData == null)
        //                GetUData = new Models.UserData();
        //            GetUData.User_Id = (Guid)result.Tables[0].Rows[0]["UserId"];                   

        //            string redirect_uri = "http://test.luntaibaobao.com/register";
        //            string state = ConstantList.REGISTER_TYPE_INVITE;
        //            string url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + WechatParamList.APP_ID + "&redirect_uri=" + redirect_uri + "&response_type=code&scope=snsapi_userinfo&state=" + state + "#wechat_redirect";
        //            return Redirect(url);
        //        }
        //    }
        //    return View();
        //}
               
    }
}
