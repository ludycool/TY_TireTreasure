
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
using e3net.Mode.TireMoneyDB;
using e3net.IDAL.TireMoneyDB;
using e3net.BLL.TireMoneyDB;



namespace ESUI.Controllers
{
    //[Export]
    public class TM_WaterBillController : JsonNetController
    {

      
       // [Dependency]
       // public TM_WaterBillBiz OPBiz { get; set; }
        [Dependency]
        public ITM_WaterBillDao OPBiz { get; set; }
        public ActionResult Index()
        {
            ViewBag.RuteUrl = RuteUrl();
            ViewBag.toolbar = toolbar();
            return View();
        }

        [HttpPost]
        public JsonResult Search()
        {
            // SelectWhere.selectwherestring(Request["sqlSet"]);
            int pageIndex = Request["page"] == null ? 1 : int.Parse(Request["page"]);
            int pageSize = Request["rows"] == null ? 10 : int.Parse(Request["rows"]);
            //string Where = Request["sqlSet"] == null ? "1=1" : SelectWhere.selectwherestring(Request["sqlSet"]);
            string Where = Request["sqlSet"] == null ? "1=1" : GetSql(Request["sqlSet"]);
			     Where += " and (isDeleted=0)";
            ////字段排序
            String sortField = Request["sort"];
            String sortOrder = Request["order"];
            PageClass pc = new PageClass();
            pc.sys_Fields = "*";
            pc.sys_Key = "BiId";
            pc.sys_PageIndex = pageIndex;
            pc.sys_PageSize = pageSize;
            pc.sys_Table = "TM_WaterBill";
            pc.sys_Where = Where;
            pc.sys_Order = " " + sortField + " " + sortOrder;
            DataSet ds = OPBiz.GetPagingDataP(pc);
            Dictionary<string, object> dic = new Dictionary<string, object>();
            dic.Add("rows", ds.Tables[0]);
            dic.Add("total", pc.RCount);
            return Json(dic, JsonRequestBehavior.AllowGet);
        }

        public JsonResult EditInfo(TM_WaterBill EidModle)
        {
            HttpReSultMode ReSultMode = new HttpReSultMode();
            bool IsAdd = false;
          
             if (!(EidModle.BiId != null && !EidModle.BiId.ToString().Equals("00000000-0000-0000-0000-000000000000")))//id为空，是添加
            {
                IsAdd = true;
                EidModle.CreateTime = DateTime.Now;

				EidModle.isDeleted = false;
            }
            if (IsAdd)
            {
                try
                {
                    OPBiz.Add(EidModle);
                    ReSultMode.Code = 11;
                    ReSultMode.Data = EidModle.BiId.ToString();
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
                EidModle.WhereExpression = TM_WaterBillSet.BiId.Equal(EidModle.BiId);
				string idfilec = "BiId";
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
            var mql2 = TM_WaterBillSet.SelectAll().Where(TM_WaterBillSet.BiId.Equal(ID));
            TM_WaterBill Rmodel = OPBiz.GetEntity(mql2);
            //  groupsBiz.Add(rol);
            return Json(Rmodel, JsonRequestBehavior.AllowGet);
        }


        public JsonResult Del(string IDSet)
        {
            var mql2 = TM_WaterBillSet.BiId.In(IDSet);
            int f = OPBiz.Remove<TM_WaterBillSet>(mql2);
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

