

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
namespace ZAppUI.Controllers
{

    //[Export]
    public class HomeController : BaseController
    {

        //[Dependency]
        //public RMS_MenusBiz uBiz { get; set; }
        //[Dependency]
        //public RMS_UserBiz userBiz { get; set; }
        String code;
        public ActionResult Index()
        {
            GetUData = new Models.UserData();

            ViewBag.Message = "修改此模板以快速启动你的 ASP.NET MVC 应用程序。";
            //  ViewBag.ManuString= GetManu();
            ViewBag.testString = "<div title=\"功能管理\" iconcls=\"icon-edit\" style=\"padding: 10px;\"><p><a href=\"javascript:void(0)\" src=\"/RoleManagement/Index\" class=\"MenuLink\">角色管理</a></p> </div>";

            //if (Request["code"] != null && string.IsNullOrEmpty(Request["code"]))
            //{
                GetUData.OpenId = Request["code"];
                ViewData["code"] = Request["code"];
            //code = Request["code"];
            //ViewBag.code = code;
            //}
            //else
            //{
            //    getCode();
            //}
            return View();
        }

        

        public ActionResult About()
        {
            ViewBag.Message = "你的应用程序说明页。";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "你的联系方式页。";

            return View();
        }
        //判断是否注册
        public ActionResult isRegister()
        {
            string openId = GetUData.OpenId;
            UserBiz userBiz = new UserBiz();

            DataSet result = userBiz.ExecuteSqlToDataSet("SELECT [WeiXinId] FROM [TireTreasureDB].[dbo].[TT_User] where WeiXinId='" + openId + "'");
            //DataSet result = userBiz.ExecuteSqlToDataSet("EXEC [TireTreasureDB].[dbo].[proc_SearchUser] '" + openId + "'");
            DataTable bt = result.Tables[0];
            try
            {
                if (bt.Rows[0]["WeiXinId"] != null)
                {
                    return RedirectToAction("Index", "User");
                }
            }
            catch (IndexOutOfRangeException exception)
            { 
               
            }         
            return RedirectToAction("Index","Register");
        }
        
    }
}
