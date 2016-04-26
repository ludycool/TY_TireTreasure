

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
using e3net.Mode.V_mode;

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


            ViewBag.Message = "修改此模板以快速启动你的 ASP.NET MVC 应用程序。";
            //  ViewBag.ManuString= GetManu();
            ViewBag.testString = "<div title=\"功能管理\" iconcls=\"icon-edit\" style=\"padding: 10px;\"><p><a href=\"javascript:void(0)\" src=\"/RoleManagement/Index\" class=\"MenuLink\">角色管理</a></p> </div>";

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
      
   

    }
}
