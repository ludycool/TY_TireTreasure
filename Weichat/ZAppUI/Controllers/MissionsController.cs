using e3net.IDAL.TireTreasureDB;
using Microsoft.Practices.Unity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using WeChatJsSdk.SdkCore;
using WeiChatMessageHandle;

namespace ZAppUI.Controllers
{
    public class MissionsController : JsonNetController
    {
        //
        // GET: /Missions/
                [Dependency]
        public ITT_MissionsDao OPBiz { get; set; }
        public ActionResult Index()
        {

            JSSDK sdk = new JSSDK(WechatParamList.APP_ID, WechatParamList.APP_SECRET, true);
            JsApiEnum jsApilist = (JsApiEnum)0x3ffffffff;

            SignPackage config = sdk.GetSignPackage(jsApilist);
            JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            ViewBag.config = serializer.Serialize(config);
            return View();
        }
        //[HttpPost]
        //public JsonResult Public(string Title, string Details, string Longitude, string Latitude, string Address, string MoneyReward, string SpendTime,)
        //{ 
        
        
        //}
    }
}
