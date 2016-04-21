﻿using e3net.BLL;
using e3net.Mode.RMS;
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

namespace ESUI.Controllers
{
    /// <summary>
    /// 基础类
    /// </summary>
    public class BaseController : Controller
    {
        public AdminUserInfo UserData
        {
            set { Session["UserData"] = value; }
            get { return Session["UserData"] as AdminUserInfo; }
        }
        #region  公共方法
        /// <summary>
        /// 获取地址
        /// </summary>
        /// <returns></returns>
        public string RuteUrl()
        {

            return " var BaseUrl = '/" + RouteData.Values["controller"].ToString() + "/';";

        }
        /// <summary>
        /// 操作按键列表
        /// </summary>
        /// <returns></returns>
        public string toolbar()
        {

            string controller = RouteData.Values["controller"].ToString();
            string tool = " var toolbars =[";
            string search = "";
            Manu ManuItem = UserData.ListManus.Find(p => p.manuInfo.URL.Equals(controller));
            if (ManuItem != null)//
            {
                int listbtnCout = ManuItem.ListButtons.Count;
                for (int i = 0; i < listbtnCout; i++)
                {

                    tool += "{";
                    tool += string.Format("id: '{0}',", ManuItem.ListButtons[i].ValueName);
                    tool += string.Format("text: '{0}',", ManuItem.ListButtons[i].ButtonName);
                    tool += string.Format("iconCls: '{0}',", ManuItem.ListButtons[i].Icon);
                    tool += "handler: function () { " + ManuItem.ListButtons[i].FunctionName + "(); }}";
                    tool += ",'-',";
                }
                if (listbtnCout > 0)
                {
                    tool = tool.Substring(0, tool.Length - 5);
                }
            }
            tool += "];";
            return tool + search;
        }

        public static string GetSql(string sqlSet)
        {
            string[] data = sqlSet.Split('█');
            string sql = " 1=1 ";
            if (!string.IsNullOrEmpty(sqlSet))
            {
                for (int i = 0; i < data.Length; i++)
                {
                    int index = data[i].IndexOf(":");
                    var nameData = data[i].Substring(0, index);

                    string[] name = nameData.Split('_');
                    string value = FilterTools.FilterSpecial(data[i].Substring(index + 1));
                    sql += " and " + GetOP(name[0], name[1], value);

                }
            }
            return sql;
        }


        static string GetOP(string name, string op, string values)
        {


            #region  多字段 模糊查询  如： OwnerName|OwnerCode|BuildingCode|HouseCode_like
            string[] names = name.Split('|');
            if (names.Length > 1)
            {
                string sql = "(";
                for (int i = 0; i < names.Length; i++)
                {
                    if (op.Equals("like"))
                    {
                        sql += names[i] + " like N'%" + values + "%' ";

                        if (i != names.Length - 1)
                        {
                            sql += " or ";
                        }
                    }
                }
                sql += ")";
                return sql;
            }
            #endregion


            switch (op)
            {
                case "like"://all

                    return name + " like N'%" + values + "%' ";
                case "like1":// 前固定

                    return name + " like N'" + values + "%' ";
                case "like2"://后固定

                    return name + " like N'%" + values + "' ";

                case "eq":

                    return name + " = '" + values + "' ";


                case "lt":

                    return name + " < '" + values + "' ";


                case "le":

                    return name + " <= '" + values + "' ";

                case "gt":

                    return name + " > '" + values + "' ";


                case "ge":

                    return name + " >= '" + values + "' ";


                case "ne":

                    return name + " != '" + values + "' ";
                default:
                    return "";

            }

        }


        public static string GetNewSql(string sqlSet)
        {
            string sql = " 1=1 ";

            if (!string.IsNullOrEmpty(sqlSet))
            {
                
            
            var f = JsonConvert.DeserializeObject<List<Searchclass>>(sqlSet);
            foreach (Searchclass searchclass in f)
            {
                sql += searchclass.BinaryOperation + " " + searchclass.FieldName +" "+ searchclass.CompareType +" "+
                       searchclass.KeyValue;
            }
            }
            return sql;
        }
        #region 获取客户端IP地址



        #endregion
        #endregion
        /// <summary>
        /// 这个方法很变态，小心死循环
        /// </summary>
        /// <param name="context"></param>
        protected override void OnActionExecuting(ActionExecutingContext context)
        {

            bool IsNull = false;
            IsHaveAtion = false;
            string controller = RouteData.Values["controller"].ToString();
            string action = RouteData.Values["action"].ToString();
            if (UserData == null)
            {
                string[] IgnoreP = { "login", "clientuserview", "dictionaryview", "machineryoperationview", "productsview", "ueditor" };//不用登录的页面一定要写在这里，不然会死循环
                if (!IgnoreP.Contains(controller.ToLower()))
                {
                    IsNull = true;
                }
            }
            else
            {
                // string controller =context.ActionDescriptor.ControllerDescriptor.ControllerName

                string[] IgnoreP = { "home", "login" };//不用权限控制的页面一定要写在这里，不然会死循环
                Manu ManuItem = UserData.ListManus.Find(p => p.manuInfo.URL.Equals(controller));
                if (!IgnoreP.Contains(controller.ToLower()) && ManuItem == null)//菜单控制
                {
                    IsNull = true;
                }
                else if (ManuItem != null && ManuItem.ManuAllButton.Find(p => p.FunctionName.Equals(action)) != null)//
                {
                    V_RoleManuButtons IsAtion = ManuItem.ListButtons.Find(p => p.FunctionName.Equals(action));
                    if (IsAtion == null)
                    {
                        IsNull = true;//这个很变态,少了就不能取消操作
                        IsHaveAtion = true;
                    }
                }

            }
            if (IsNull)//非法操作一律返回登录
            {
                context.Result = RedirectToAction("Index", "Login");
            }
            else
            {
                base.OnActionExecuting(context);
            }
        }
        /// <summary>
        /// 标注Ation是否取消
        /// </summary>
        public bool IsHaveAtion
        {
            get;
            set;
        }
        /// <summary>
        /// 这个方法很变态
        /// </summary>
        /// <param name="context"></param>
        protected override void OnResultExecuting(ResultExecutingContext context)
        {
            if (IsHaveAtion)//非法操作取消
            {
                context.Cancel = true;
            }
            else
            {
                base.OnResultExecuting(context);
            }
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
