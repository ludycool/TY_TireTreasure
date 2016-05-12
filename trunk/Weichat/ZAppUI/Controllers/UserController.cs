﻿using e3net.BLL.Base;
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
using System.Drawing;
using System.IO;

namespace ZAppUI.Controllers
{
    public class UserController : BaseController
    {
        //
        // GET: /User/
        public ActionResult Index()
        {
            //if (GetUData == null)
            //{
            //    GetUData = new Models.UserData();
            //}
            //GetUData.OpenId = "ov0HljubVsu4mOIfZsTMry_s3CNM";

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
                ViewBag.nickName = result.Tables[0].Rows[0]["Nickname"].ToString();
                ViewBag.headImgUrl = result.Tables[0].Rows[0]["ImgeUrl"].ToString();
            }
        }
        //显示用户余额
        private void getBalance()
        {
            string openId = GetUData.OpenId;
            
            BalanceBiz balanceBiz = new BalanceBiz();
            DataSet getBalanceInfo = balanceBiz.ExecuteSqlToDataSet("EXEC [TireMoneyDB].[dbo].[proc_CheckBalanceInfo] '" + openId + "'");
            if (!(getBalanceInfo.Tables.Count > 0) && !(getBalanceInfo.Tables[0].Rows.Count > 0))
            {
                addUserBalanceInfo(openId);
            }
            DataSet result = balanceBiz.ExecuteSqlToDataSet("EXEC [TireMoneyDB].[dbo].[proc_CheckBalanceInfo] '" + openId + "'");
            ViewBag.balance = result.Tables[0].Rows[0]["AMneys"].ToString();
        }
        //添加用户余额到表
        private void addUserBalanceInfo(string openId)
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


        //推荐页面
        public ActionResult recommend()
        {
            //JSSDK sdk = new JSSDK(WechatParamList.APP_ID, WechatParamList.APP_SECRET, true);
            //JsApiEnum jsApilist = (JsApiEnum)0x3ffffffff;

            //SignPackage config = sdk.GetSignPackage(jsApilist);
            //JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            //ViewBag.config = serializer.Serialize(config);

            //GetUData.OpenId = "ov0HljubVsu4mOIfZsTMry_s3CNM";

            getNumOfRecommend();

            generateQRImage();
            return View();
        }

        
        public void SaveImg(string strPath, Bitmap img)
        {
            //保存图片到目录
            if (Directory.Exists(strPath))
            {
                //文件名称
                string QR_code = "QR_code.png";
                img.Save(strPath + "/" + QR_code, System.Drawing.Imaging.ImageFormat.Png);
            }
            else
            {
                //当前目录不存在，则创建
                Directory.CreateDirectory(strPath);
            }
        }
        //生成二维码
        public void generateQRImage()
        {
            string currentPath = System.Web.HttpContext.Current.Server.MapPath(System.Web.HttpContext.Current.Request.ApplicationPath + "" + @"/Content/Qr_code_img");
           
            Bitmap RQBmp = QRCodeHelper.Create(generateRecommendUrl(), 410);
            RQBmp = QRCodeHelper.GetThumbnail(RQBmp, 400, 400);

            SaveImg(currentPath, RQBmp);
        }
        string Key = "1234567812345678";
        //生成推荐链接
        public string generateRecommendUrl()
        {
            string id=getUserId();
            //id = "1";
            id = AESHelper.Encrypt(id, Key);
            //string url = "/user/encoderUrl?param=" + id + "&type=recommend";
            return "http://" + Request.Url.Host + Request.Path+"/encoderUrl?param=" + id + "&type=recommend";
            //return url;
        }
        
        //获取推荐人ID
        public string getUserId()
        {
            string id = null;

            UserBiz userBiz = new UserBiz();
            DataSet result = userBiz.ExecuteSqlToDataSet("EXEC [TireTreasureDB].[dbo].[proc_GeRecommendIdByWeiXinId] '" + GetUData.OpenId + "'");
            if ((result.Tables.Count > 0) && (result.Tables[0].Rows.Count > 0))
            {
                id = result.Tables[0].Rows[0]["Id"].ToString();
            }
            return id;
        }
        private const int INVITING = 0;

        //推荐链接解码
        public ActionResult encoderRecommendUrl()
        {
            string recommendId = FilterTools.FilterSpecial(AESHelper.Decrypt(Request["param"], Key));
            string type = FilterTools.FilterSpecial(Request["type"]);

            if (type.Equals("recommend"))
            {
                UserBiz userBiz = new UserBiz();
                DataSet result = userBiz.ExecuteSqlToDataSet("EXEC [TireTreasureDB].[dbo].[proc_GetUserIdByRecommendId] '" + recommendId + "'");
                if ((result.Tables.Count > 0) && (result.Tables[0].Rows.Count > 0))
                {
                    addUserReferences(recommendId, (Guid)result.Tables[0].Rows[0]["UserId"]);

                    string redirect_uri = "http://test.luntaibaobao.com/register";
                    string state = "test";
                    string url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + WechatParamList.APP_ID + "&redirect_uri=" + redirect_uri + "&response_type=code&scope=snsapi_userinfo&state=" + state + "#wechat_redirect";
                    return Redirect(url);
                }
            }
            return View();
        }
        //添加用户到推荐表
        private void addUserReferences(string shareId, Guid userId)
        {
            References references = new References();
            references.UserId = userId;
            references.InvitationCode = FilterTools.FilterSpecial(shareId);
            references.States = INVITING;
            references.AddTime = DateTime.Now;
            references.isDeleted = false;

            ReferencesBiz referencesBiz = new ReferencesBiz();
            referencesBiz.Add(references);
            
            GetUData.User_Id = references.UserId;
        }
        //显示推荐人数
        private void getNumOfRecommend()
        {
            ReferencesBiz referencesBiz = new ReferencesBiz();
            DataSet result = referencesBiz.ExecuteSqlToDataSet("EXEC [TireTreasureDB].[dbo].[proc_NumberOfRecommend] '" + GetUData.OpenId + "'");
            int num = 0;
            num =(int)result.Tables[0].Rows[0][0];            
            ViewBag.num = num;
        }
    }
}