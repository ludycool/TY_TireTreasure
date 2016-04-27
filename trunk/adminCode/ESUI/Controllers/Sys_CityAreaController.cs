using e3net.BLL;
using e3net.Mode;
using System;
using System.Collections.Generic;
//using System.ComponentModel.Composition;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.Practices.Unity;
using e3net.BLL.TireTreasureBaseDB;
using e3net.Mode.TireTreasureBaseDB;
using e3net.Mode.V_mode;

namespace ESUI.Controllers
{
    //[Export]
    public class Sys_CityAreaController : BaseController
    {
        //
        // GET: /Dictionary/

        //[Import(typeof(ISys_CityAreaDao))]
     //   public ISys_CityAreaDao DDBiz { get; set; }
       // public Sys_CityAreaBiz DDBiz = new Sys_CityAreaBiz();
        [Dependency]
        public Sys_CityAreaBiz DDBiz { get; set; }
        public ActionResult Index()
        {
            ViewBag.RuteUrl = RuteUrl();
            ViewBag.toolbar = toolbar();
            return View();
        }
        public JsonResult EditInfo(Sys_CityArea Mode)
        {
            Random rnd = new Random();
            bool IsAdd = false;
            if (Mode.CityAreaId == 0)//CityAreaId为0，是添加
            {
                IsAdd = true;
            }
            if (IsAdd)
            {
                DDBiz.Add(Mode);

                return Json("ok", JsonRequestBehavior.AllowGet);
            }
            else
            {
                Mode.WhereExpression = Sys_CityAreaSet.CityAreaId.Equal(Mode.CityAreaId);
                //  spmodel.GroupCityAreaId = GroupCityAreaId;
                Mode.ChangedMap.Remove("CityAreaId");//移除主键值
                if (DDBiz.Update(Mode) > 0)
                {
                    return Json("ok", JsonRequestBehavior.AllowGet);
                }
                else
                {
                    return Json("Nok", JsonRequestBehavior.AllowGet);
                }

            }

        }
        public JsonResult GetInfo(string CityAreaId)
        {
            var mql = Sys_CityAreaSet.SelectAll().Where(Sys_CityAreaSet.CityAreaId.Equal(CityAreaId));
            Sys_CityArea Rmodel = DDBiz.GetEntity(mql);
            //  groupsBiz.Add(rol);
            return Json(Rmodel, JsonRequestBehavior.AllowGet);
        }
        public string GetJson()
        {

            var sql = v_Sys_CityAreaSet.SelectAll();
            List<v_Sys_CityArea> listAll = DDBiz.GetOwnList<v_Sys_CityArea>(sql);
            string jsonstring = DDBiz.GetTree(listAll);
            return jsonstring;
        }

        public JsonResult DeleteInfo(string CityAreaId)
        {

            var mql2 = Sys_CityAreaSet.CityAreaId.Equal(CityAreaId);
            int f = DDBiz.Remove<Sys_CityAreaSet>(mql2);
            return Json("OK", JsonRequestBehavior.AllowGet);

        }
    }
}
