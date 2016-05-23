using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ZAppUI.Controllers
{
    public class DepositController : BaseController
    {
        //
        // GET: /Deposit/

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult unionPay()
        {
            return View();
        }
        [HttpPost]
        public ActionResult unionPay(string money)
         {
            
            return View();
         }
    }
}
