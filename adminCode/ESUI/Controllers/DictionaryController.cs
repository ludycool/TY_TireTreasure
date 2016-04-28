
using e3net.Mode;
using System;
using System.Collections.Generic;
//using System.ComponentModel.Composition;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.Practices.Unity;
using e3net.Mode.Base;
using e3net.BLL.Base;

namespace ESUI.Controllers
{
    //[Export]
    public class DictionaryController : BaseController
    {
        //
        // GET: /Dictionary/

        //[Import(typeof(ISys_DictionaryDao))]
     //   public ISys_DictionaryDao DDBiz { get; set; }
       // public Sys_DictionaryBiz DDBiz = new Sys_DictionaryBiz();
        [Dependency]
        public Sys_DictionaryBiz DDBiz { get; set; }
        public ActionResult Index()
        {
            ViewBag.RuteUrl = RuteUrl();
            ViewBag.toolbar = toolbar();
            return View();
        }
        public JsonResult EditInfo(Sys_Dictionary Mode)
        {
            Random rnd = new Random();
            bool IsAdd = false;
            if (!(Mode.DicId != null && !Mode.DicId.ToString().Equals(0)))//DicId为空，是添加
            {
                IsAdd = true;
            }
            if (IsAdd)
            {
                Mode.CreateTime = DateTime.Now;
  
                DDBiz.Add(Mode);

                return Json("ok", JsonRequestBehavior.AllowGet);
            }
            else
            {
                Mode.WhereExpression = Sys_DictionarySet.DicId.Equal(Mode.DicId);
                //  spmodel.GroupDicId = GroupDicId;
                Mode.CreateTime = DateTime.Now;
        
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
        public JsonResult GetInfo(string DicId)
        {
            var mql = Sys_DictionarySet.SelectAll().Where(Sys_DictionarySet.DicId.Equal(DicId));
            Sys_Dictionary Rmodel = DDBiz.GetEntity(mql);
            //  groupsBiz.Add(rol);
            return Json(Rmodel, JsonRequestBehavior.AllowGet);
        }
        public string GetJson()
        {

            var sql = Sys_DictionarySet.SelectAll();
            List<Sys_Dictionary> listAll = DDBiz.GetOwnList<Sys_Dictionary>(sql);
            string jsonstring = DDBiz.GetTree(listAll);
            return jsonstring;
        }

        public JsonResult DeleteInfo(string DicId)
        {

            var mql2 = Sys_DictionarySet.DicId.Equal(DicId);
            int f = DDBiz.Remove<Sys_DictionarySet>(mql2);
            return Json("OK", JsonRequestBehavior.AllowGet);

        }
    }
}
