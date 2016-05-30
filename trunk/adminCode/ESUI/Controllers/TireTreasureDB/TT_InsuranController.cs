
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.Practices.Unity;
using Newtonsoft.Json;
using System.Data;
using System.Text;
using e3net.Mode.HttpView;
using e3net.common.SysMode;
using e3net.Mode.TireTreasureDB;
using e3net.IDAL.TireTreasureDB;
using e3net.BLL.TireTreasureDB;



namespace ESUI.Controllers
{
    //[Export]
    public class TT_InsuranController : JsonNetController
    {

      
       // [Dependency]
       // public TT_InsuranBiz OPBiz { get; set; }
        [Dependency]
        public ITT_InsuranDao OPBiz { get; set; }
        public ActionResult Index()
        {
            ViewBag.RuteUrl = RuteUrl();
            ViewBag.toolbar = toolbar(2);
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
            pc.sys_Key = "InsuranCompanyId";
            pc.sys_PageIndex = pageIndex;
            pc.sys_PageSize = pageSize;
            pc.sys_Table = "v_TT_Insurance";
            pc.sys_Where = Where;
            pc.sys_Order = " " + sortField + " " + sortOrder;
            DataSet ds = OPBiz.GetPagingDataP(pc);
            Dictionary<string, object> dic = new Dictionary<string, object>();
            dic.Add("rows", ds.Tables[0]);
            dic.Add("total", pc.RCount);
            return Json(dic, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult GetInsuranItermSeel()
        {
            // SelectWhere.selectwherestring(Request["sqlSet"]);
            int pageIndex = Request["page"] == null ? 1 : int.Parse(Request["page"]);
            int pageSize = Request["rows"] == null ? 10 : int.Parse(Request["rows"]);
            //string Where = Request["sqlSet"] == null ? "1=1" : SelectWhere.selectwherestring(Request["sqlSet"]);
            string Where = Request["sqlSet"] == null ? "1=1" : GetSql(Request["sqlSet"]);
            Where += " and (isDeleted=0)";
            PageClass pc = new PageClass();
            pc.sys_Fields = "ItermSeelId,TName,Rates,SCode,Formula,ClaimAmount,Describe";
            pc.sys_Key = "ItermSeelId";
            pc.sys_PageIndex = pageIndex;
            pc.sys_PageSize = pageSize;
            pc.sys_Table = "TT_InsuranItermSeel";
            pc.sys_Where = Where;
            pc.sys_Order = " " + pc.sys_Key + " desc";
            DataSet ds = OPBiz.GetPagingDataP(pc);
            Dictionary<string, object> dic = new Dictionary<string, object>();
            dic.Add("rows", ds.Tables[0]);
            dic.Add("total", pc.RCount);
            //StringBuilder sb = new StringBuilder();
            //foreach (DataRow item in ds.Tables[0].Rows)
            //{
            //    sb.AppendFormat("<input type=\"hidden\" name=\"ItermSeelId\" value=\"{0}\"> <label style=\"width:120px;\">{1}</label> <label style=\"width:120px;\">{2}</label> <label style=\"width:200px;\">{3}</label> <input type=\"text\" value=\"\" class=\"easyui-validatebox\" onkeyup=\"clearNoNum(this)\" data-options=\"valueField:'ItemValue',textField:'ItemName',required:true\"> <input type=\"checkbox\" name=\"ce\"> <br> ", item[0], item[1], item[2], item[3]);
            //}
            return Json(dic, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Add()
        {
            ViewBag.RuteUrl = RuteUrl();
            return View();
        }
        public JsonResult EditInfo(TT_Insuran EidModle)
        {
            HttpReSultMode ReSultMode = new HttpReSultMode();
            bool IsAdd = false;
          
             if (!(EidModle.InsuranId != null && !EidModle.InsuranId.ToString().Equals("00000000-0000-0000-0000-000000000000")))//id为空，是添加
            {
                IsAdd = true;
			    EidModle.InsuranId = Guid.NewGuid();
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
                    ReSultMode.Data = EidModle.InsuranId.ToString();
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
                EidModle.WhereExpression = TT_InsuranSet.InsuranId.Equal(EidModle.InsuranId);
				string idfilec = "InsuranId";
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
            var mql2 = TT_InsuranSet.SelectAll().Where(TT_InsuranSet.InsuranId.Equal(ID));
            TT_Insuran Rmodel = OPBiz.GetEntity(mql2);
            //  groupsBiz.Add(rol);
            return Json(Rmodel, JsonRequestBehavior.AllowGet);
        }
        public JsonResult InsuranceApply(string UOId, string SOId)
        {
            HttpReSultMode ReSultMode = new HttpReSultMode();
            var PayType=Request["PayType"];
            var OMuney=Request["OMuney"];
            var Remarks=Request["Remarks"];
            var SaleType=Request["SaleType"];
            //var UOId = Request["UOId"];
            //var SOId = Request["SOId"];
            var parameters = new System.Data.SqlClient.SqlParameter[]{
            new System.Data.SqlClient.SqlParameter("@Number","BX"+OPBiz.GetTime().ToString("yyyyMMddHHmmssfff")),
            new System.Data.SqlClient.SqlParameter("@Types","1"),
            new System.Data.SqlClient.SqlParameter("@UOId",UOId),
            new System.Data.SqlClient.SqlParameter("@SOId",SOId),
            new System.Data.SqlClient.SqlParameter("@Money",OMuney),
            new System.Data.SqlClient.SqlParameter("@SaleType",SaleType),
            new System.Data.SqlClient.SqlParameter("@Remarks",Remarks),
            new System.Data.SqlClient.SqlParameter("@PayType",PayType)
            };
            var res = OPBiz.ExecuteProWithNonQuery("proc_InsuranceHandle", parameters);
            if (res > 0)
                {
                    ReSultMode.Code = 11;
                    ReSultMode.Data = "";
                    ReSultMode.Msg = "办理成功";
                }
            return Json(ReSultMode,JsonRequestBehavior.AllowGet);
        }
        public JsonResult Del(string IDSet)
        {
           // var mql2 = TT_InsuranSet.InsuranId.In(IDSet);
           // int f = OPBiz.Remove<TT_InsuranSet>(mql2);
             int f = OPBiz.DelForSetDelete("InsuranId", IDSet);
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

