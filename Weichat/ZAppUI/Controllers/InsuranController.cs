using e3net.IDAL.TireTreasureDB;
using Microsoft.Practices.Unity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ZAppUI.Controllers
{
    public class InsuranController : JsonNetController
    {
        //
        // GET: /Insuran/
        [Dependency]
        public ITT_InsuranDao OPBiz { get; set; }
        public ActionResult Index()
        {
            return View();
        }

    }
}
