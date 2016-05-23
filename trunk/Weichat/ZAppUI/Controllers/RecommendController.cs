using e3net.BLL.Base;
using e3net.tools;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TZHSWEET.Common;
using WeiChatMessageHandle;
using ZAppUI.App_Code;

namespace ZAppUI.Controllers
{
    public class RecommendController : BaseController
    {
        //
        // GET: /Recommend/

        public ActionResult Index()
        {
            //JSSDK sdk = new JSSDK(WechatParamList.APP_ID, WechatParamList.APP_SECRET, true);
            //JsApiEnum jsApilist = (JsApiEnum)0x3ffffffff;

            //SignPackage config = sdk.GetSignPackage(jsApilist);
            //JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            //ViewBag.config = serializer.Serialize(config);

            //GetUData.OpenId = "ov0HljubVsu4mOIfZsTMry_s3CNM";

            ViewBag.num = getNumOfRecommend();

            generateQRImage();

            return View();
        }
        //生成二维码
        public void generateQRImage()
        {
            string currentPath = System.Web.HttpContext.Current.Server.MapPath(System.Web.HttpContext.Current.Request.ApplicationPath + "" + @"/Content/Qr_code_img");

            string content = generateRecommendUrl();
            Bitmap RQBmp = QRCodeHelper.Create(content, 410);
            RQBmp = QRCodeHelper.GetThumbnail(RQBmp, 400, 400);

            SaveImg(currentPath, RQBmp);
        }
        //生成推荐链接
        private string generateRecommendUrl()
        {
            string id = getRecommendId();
            if (id != null)
                id = DESProvider.Encrypt(id, ConstantList.ENCRYPT_KEY);

            return "http://" + Request.Url.Host + "/" + RouteData.Route.GetRouteData(this.HttpContext).Values["controller"] + "/decoderRecommendUrl?param=" + id + "&type=recommend";
        }
        //获取推荐人ID
        public string getRecommendId()
        {
            UserBiz userBiz = new UserBiz();
            DataSet result = userBiz.ExecuteSqlToDataSet("EXEC [TireTreasureDB].[dbo].[proc_GeRecommendIdByWeiXinId] '" + GetUData.OpenId + "'");

            return result.Tables[0].Rows[0]["Id"].ToString();
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
        //显示推荐人数
        private int getNumOfRecommend()
        {
            ReferencesBiz referencesBiz = new ReferencesBiz();
            DataSet result = referencesBiz.ExecuteSqlToDataSet("EXEC [TireTreasureDB].[dbo].[proc_NumberOfRecommend] '" + GetUData.OpenId + "'");
            int num = 0;
            return num = (int)result.Tables[0].Rows[0][0];
        }
        //推荐链接解码
        public ActionResult decoderRecommendUrl()
        {
            string recommendId = FilterTools.FilterSpecial(DESProvider.Decrypt(Request["param"], ConstantList.ENCRYPT_KEY));
            string type = FilterTools.FilterSpecial(Request["type"]);

            if (type.Equals("recommend"))
            {
                UserBiz userBiz = new UserBiz();
                DataSet result = userBiz.ExecuteSqlToDataSet("EXEC [TireTreasureDB].[dbo].[proc_GetUserIdByRecommendId] '" + recommendId + "'");
                if (result.Tables[0].Rows.Count > 0)
                {
                    if (GetUData == null)
                        GetUData = new Models.UserData();
                    GetUData.User_Id = (Guid)result.Tables[0].Rows[0]["UserId"];

                    string redirect_uri = "http://test.luntaibaobao.com/register";
                    string state = ConstantList.REGISTER_TYPE_INVITE;
                    string url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + WechatParamList.APP_ID + "&redirect_uri=" + redirect_uri + "&response_type=code&scope=snsapi_userinfo&state=" + state + "#wechat_redirect";
                    return Redirect(url);
                }
            }
            return View();
        }
    }
}
