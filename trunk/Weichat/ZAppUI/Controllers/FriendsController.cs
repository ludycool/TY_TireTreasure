using e3net.BLL.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ZAppUI.Controllers
{
    public class FriendsController : BaseController
    {
        //
        // GET: /Friends/

        public ActionResult Index()
        {
            //string controller=RouteData.Values["controller"].ToString();
            //string action=RouteData.Values["action"].ToString();
            //isRegister(controller,action);

            FriendsBiz friendsBiz=new FriendsBiz();
            friendsBiz.ExecuteSqlToDataSet("");
            return View();
        }

    }
}
