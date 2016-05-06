
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
using e3net.Mode.V_mode;



namespace ESUI.Controllers
{
    //[Export]
    public class Sys_CityAreaController : JsonNetController
    {

      
       // [Dependency]
       // public Sys_CityAreaBiz OPBiz { get; set; }
        [Dependency]
        public ISys_CityAreaDao OPBiz { get; set; }
        public ActionResult Index()
        {
            ViewBag.RuteUrl = RuteUrl();
            ViewBag.toolbar = toolbar();
            return View();
        }

        [HttpPost]
        public string GetJson()
        {

            var sql = v_Sys_CityAreaSet.SelectAll();
            List<v_Sys_CityArea> listAll = OPBiz.GetOwnList<v_Sys_CityArea>(sql);
            string jsonstring = OPBiz.GetTree(listAll);
            return jsonstring;
        }


        public JsonResult EditInfo(Sys_CityArea EidModle)
        {
            HttpReSultMode ReSultMode = new HttpReSultMode();
            bool IsAdd = false;
            if (EidModle.ParentId == EidModle.CityAreaId)//父级不能等于自已
            {

                EidModle.ParentId = 0;
            }
             if (EidModle.CityAreaId ==0)//id为空，是添加
            {
                IsAdd = true;
                EidModle.CreateTime = DateTime.Now;
                EidModle.UpdateTime = DateTime.Now;
				EidModle.isValid = true;
				EidModle.isDeleted = false;
            }
            if (IsAdd)
            {
                try
                {
                    OPBiz.Add(EidModle);
                    ReSultMode.Code = 11;
                    ReSultMode.Data = EidModle.CityAreaId.ToString();
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
                EidModle.WhereExpression = Sys_CityAreaSet.CityAreaId.Equal(EidModle.CityAreaId);
				string idfilec = "CityAreaId";
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
            var mql2 = Sys_CityAreaSet.SelectAll().Where(Sys_CityAreaSet.CityAreaId.Equal(ID));
            Sys_CityArea Rmodel = OPBiz.GetEntity(mql2);
            //  groupsBiz.Add(rol);
            return Json(Rmodel, JsonRequestBehavior.AllowGet);
        }


        public JsonResult Del(string IDSet)
        {
            var mql2 = Sys_CityAreaSet.CityAreaId.In(IDSet);
            int f = OPBiz.Remove<Sys_CityAreaSet>(mql2);
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

