
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.Practices.Unity;
using Newtonsoft.Json;
using System.Data;

using e3net.Mode.HttpView;
using e3net.common.SysMode;
using e3net.Mode.Base;
using e3net.IDAL.Base;
using e3net.BLL.Base;



namespace ESUI.Controllers
{
    //[Export]
    public class Sys_DictionaryController : JsonNetController
    {

      
       // [Dependency]
       // public Sys_DictionaryBiz OPBiz { get; set; }
        [Dependency]
        public ISys_DictionaryDao OPBiz { get; set; }
        public ActionResult Index()
        {
            ViewBag.RuteUrl = RuteUrl();
            ViewBag.toolbar = toolbar();
            return View();
        }

        public string GetJson(string DicType)
        {

            var sql = Sys_DictionarySet.SelectAll().Where(Sys_DictionarySet.DicTypeId.Equal(DicType));
            List<Sys_Dictionary> listAll = OPBiz.GetOwnList<Sys_Dictionary>(sql);
            string jsonstring = OPBiz.GetTree(listAll);
            return jsonstring;
        }

        public JsonResult EditInfo(Sys_Dictionary EidModle)
        {
            HttpReSultMode ReSultMode = new HttpReSultMode();
            bool IsAdd = false;
          
             if (EidModle.DicId == 0)//id为空，是添加
            {
                IsAdd = true;
                EidModle.CreateTime = DateTime.Now;
				EidModle.isValid = true;
				EidModle.isDeleted = false;
            }
            if (IsAdd)
            {
                try
                {
                    OPBiz.Add(EidModle);
                    ReSultMode.Code = 11;
                    ReSultMode.Data = EidModle.DicId.ToString();
                    ReSultMode.Msg = "添加成功";
                }
                catch (Exception e) {

                    ReSultMode.Code = -11;
                    ReSultMode.Data = e.ToString();
                    ReSultMode.Msg = "添加失败";
                }
            }
            else
            {
                EidModle.WhereExpression = Sys_DictionarySet.DicId.Equal(EidModle.DicId);
				string idfilec = "DicId";
                EidModle.ChangedMap.Remove(idfilec.ToLower());//移除主键值
                if (OPBiz.Update(EidModle) > 0)
                {
                    ReSultMode.Code = 11;
                    ReSultMode.Data = "";
                    ReSultMode.Msg = "修改成功";
                }
                else
                {
                    ReSultMode.Code = -13;
                    ReSultMode.Data = "";
                    ReSultMode.Msg = "修改失败";
                }
            }

            return Json(ReSultMode, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetInfo(string ID)
        {
            var mql2 = Sys_DictionarySet.SelectAll().Where(Sys_DictionarySet.DicId.Equal(ID));
            Sys_Dictionary Rmodel = OPBiz.GetEntity(mql2);
            //  groupsBiz.Add(rol);
            return Json(Rmodel, JsonRequestBehavior.AllowGet);
        }


        public JsonResult Del(string IDSet)
        {
            var mql2 = Sys_DictionarySet.DicId.In(IDSet);
            int f = OPBiz.Remove<Sys_DictionarySet>(mql2);
            HttpReSultMode ReSultMode = new HttpReSultMode();
            if (f > 0)
            {
                ReSultMode.Code = 11;
                ReSultMode.Data = f.ToString();
                ReSultMode.Msg = "成功删除" + f + "条数据！";
                return Json(ReSultMode, JsonRequestBehavior.AllowGet);
            }
            else
            {
                ReSultMode.Code = -13;
                ReSultMode.Data = "0";
                ReSultMode.Msg = "删除失败！";
                return Json(ReSultMode, JsonRequestBehavior.AllowGet);
            }
        }

    }
}

