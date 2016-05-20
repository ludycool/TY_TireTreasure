using e3net.BLL;
using e3net.Mode.V_mode;
using e3net.tools;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using System.Web.UI;
using Newtonsoft.Json;
using ZAppUI.Models;
using System.Data;
using e3net.BLL.Base;
using ZAppUI.App_Code;
using WeiChatMessageHandle;

namespace ZAppUI.Controllers
{
    /// <summary>
    /// 基础类
    /// </summary>
    public class BaseController : Controller
    {
    
        #region  公共方法
        /// <summary>
        /// 获取地址
        /// </summary>
        /// <returns></returns>
        public string RuteUrl()
        {

            return " var BaseUrl = '/" + RouteData.Values["controller"].ToString() + "/';";

        }
        public UserData GetUData {

            get { return Session["UserData"] as UserData;}
            set{Session["UserData"] =value;}
        }

        #region 获取客户端IP地址
        #endregion
        #region 获取UserID
        

        
        #endregion
        #endregion

        public bool isRegister()
        {          
            if (util.isOpenIdExist(GetUData.OpenId))
            {
                return true;
            }
           return false;
        }  

    }



    public class JsonNetResult : JsonResult
    {
        public JsonSerializerSettings SerializerSettings { get; set; }
        public Formatting Formatting { get; set; }
        public JsonNetResult()
        {
            SerializerSettings = new JsonSerializerSettings();
        }
        public override void ExecuteResult(ControllerContext context)
        {
            if (context == null)
                throw new ArgumentNullException("context");
            HttpResponseBase response = context.HttpContext.Response;
            response.ContentType =
                !string.IsNullOrEmpty(ContentType) ? ContentType : "application/json";
            if (ContentEncoding != null)
                response.ContentEncoding = ContentEncoding;
            if (Data != null)
            {
                JsonTextWriter writer = new JsonTextWriter(response.Output)
                {
                    Formatting = Formatting,
                    DateFormatString = "yyyy-MM-dd HH:mm:ss"//时间格式
                };
                JsonSerializer serializer = JsonSerializer.Create(SerializerSettings);
                serializer.Serialize(writer, Data); writer.Flush();
            }
        }
    }

    public class JsonNetController : BaseController
    {
        protected override JsonResult Json(object data, string contentType,
                  Encoding contentEncoding, JsonRequestBehavior behavior)
        {
            if (behavior == JsonRequestBehavior.DenyGet
                && string.Equals(this.Request.HttpMethod, "GET",
                                 StringComparison.OrdinalIgnoreCase))
                //Call JsonResult to throw the same exception as JsonResult
                return new JsonResult();
            return new JsonNetResult()
            {
                Data = data,
                ContentType = contentType,
                ContentEncoding = contentEncoding
            };
        }
    }

}
