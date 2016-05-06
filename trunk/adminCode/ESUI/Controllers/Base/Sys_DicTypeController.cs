
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
    public class Sys_DicTypeController : JsonNetController
    {

      
       // [Dependency]
       // public Sys_DicTypeBiz OPBiz { get; set; }
        [Dependency]
        public ISys_DicTypeDao OPBiz { get; set; }
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
            pc.sys_Key = "DicTypeId";
            pc.sys_PageIndex = pageIndex;
            pc.sys_PageSize = pageSize;
            pc.sys_Table = "Sys_DicType";
            pc.sys_Where = Where;
            pc.sys_Order = " " + sortField + " " + sortOrder;
            DataSet ds = OPBiz.GetPagingDataP(pc);
            Dictionary<string, object> dic = new Dictionary<string, object>();
            dic.Add("rows", ds.Tables[0]);
            dic.Add("total", pc.RCount);
            return Json(dic, JsonRequestBehavior.AllowGet);
        }

        public JsonResult EditInfo(Sys_DicType EidModle)
        {
            HttpReSultMode ReSultMode = new HttpReSultMode();

            var mql2 = Sys_DicTypeSet.SelectAll().Where(Sys_DicTypeSet.DicTypeNum.Equal(EidModle.DicTypeNum));
            Sys_DicType Rmodel = OPBiz.GetEntity(mql2);
            if (Rmodel != null && Rmodel.DicTypeId != EidModle.DicTypeId)
            {
                ReSultMode.Code = -13;
                ReSultMode.Data = "";
                ReSultMode.Msg = "已经存在相同的编号";
                return Json(ReSultMode, JsonRequestBehavior.AllowGet);
            }

            bool IsAdd = false;
          
             if (EidModle.DicTypeId == 0)//id为空，是添加
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
                    ReSultMode.Data = EidModle.DicTypeId.ToString();
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
                EidModle.WhereExpression = Sys_DicTypeSet.DicTypeId.Equal(EidModle.DicTypeId);
				string idfilec = "DicTypeId";
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
            var mql2 = Sys_DicTypeSet.SelectAll().Where(Sys_DicTypeSet.DicTypeId.Equal(ID));
            Sys_DicType Rmodel = OPBiz.GetEntity(mql2);
            //  groupsBiz.Add(rol);
            return Json(Rmodel, JsonRequestBehavior.AllowGet);
        }


        public JsonResult Del(string IDSet)
        {
            //var mql2 = Sys_DicTypeSet.DicTypeId.In(IDSet);
            //int f = OPBiz.Remove<Sys_DicTypeSet>(mql2);

            int f = OPBiz.DelForSetDelete("DicTypeId", IDSet);
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

