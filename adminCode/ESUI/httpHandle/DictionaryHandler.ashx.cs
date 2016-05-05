using e3net.BLL;
using e3net.BLL.Base;
using e3net.Mode.FileManagementDB;
using e3net.Mode.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TZHSWEET.Common;

namespace ESUI.httpHandle
{
    /// <summary>
    /// DictionaryHandler 的摘要说明
    /// </summary>
    public class DictionaryHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {
        public Sys_DictionaryBiz OPBiz = new Sys_DictionaryBiz();
        public void ProcessRequest(HttpContext context)
        {
            string action = context.Request["action"];
            context.Response.ContentType = "text/plain";
            //  context.Response.Write("Hello World");
            switch (action)
            {

                    ///获取所有的类型
                case "GetSys_DicTypeDataGrid":

                    context.Response.Write(GetSys_DicTypeDataGrid());
                    context.Response.End();
                    break;
                ///获取所有的类型
                case "GetSys_DicTypeJson":

                    context.Response.Write(GetSys_DicTypeJson());
                    context.Response.End();
                    break;


                case "GetSonDictionary":

                    string DicNo = context.Request["DicNo"];
                    context.Response.Write(GetSonDictionary(DicNo));
                    context.Response.End();

                    break;
                case "GetSonDictionaryNo"://除掉本身只要子集

                    string DicNoNO = context.Request["DicNo"];
                    context.Response.Write(GetSonDictionaryNo(DicNoNO));
                    context.Response.End();

                    break;
                case "GetSysItem"://获取自定义词典

                    string ItemType = context.Request["ItemType"];
                    context.Response.Write(GetSysItem(ItemType));
                    context.Response.End();

                    break;
                case "GetSys_CityArea"://获取城市

                    context.Response.Write(GetSys_CityArea(context));
                    context.Response.End();

                    break;
                case "GetDepartment"://获取部门
                    context.Response.Write(GetDepartment());
                    context.Response.End();

                    break;
            }
        }


        public string GetSys_DicTypeDataGrid()
        {
            Sys_DicTypeBiz DDBiz = new Sys_DicTypeBiz();
            var sql = Sys_DicTypeSet.SelectAll().Where(Sys_DicTypeSet.isDeleted.Equal(0).And(Sys_DicTypeSet.isValid.Equal(1)));
            List<Sys_DicType> listAll = DDBiz.GetOwnList<Sys_DicType>(sql);
            Dictionary<string, object> dic = new Dictionary<string, object>();
            // var mql = RMS_RoleSet.ControlId.NotEqual("");
            dic.Add("rows", listAll);
            dic.Add("total", listAll.Count);

            return JsonHelper.ToJson(dic, true);
        }
        public string GetSys_DicTypeJson()
        {
            Sys_DicTypeBiz DDBiz = new Sys_DicTypeBiz();
            var sql = Sys_DicTypeSet.SelectAll().Where(Sys_DicTypeSet.isDeleted.Equal(0).And(Sys_DicTypeSet.isValid.Equal(1)));
            List<Sys_DicType> listAll = DDBiz.GetOwnList<Sys_DicType>(sql);
            return JsonHelper.ToJson(listAll, true);

        }


        public string GetDepartment( )
        {
            List<TF_Units> AllList = new List<TF_Units>();
            var sql = TF_UnitsSet.SelectAll();
            AllList = OPBiz.GetOwnList<TF_Units>(sql);

            return JsonHelper.ToJson(AllList, true);

        }

        public string GetSys_CityArea(HttpContext context)
        {
            List<Sys_CityArea> AllList = new List<Sys_CityArea>();
            var sql = Sys_CityAreaSet.SelectAll();
            AllList = OPBiz.GetOwnList<Sys_CityArea>(sql);
           
            return JsonHelper.ToJson(AllList, true);

        }
     
        public string GetSysItem(string ItemType)
        {
            var sql = SysItemSet.SelectAll().Where(SysItemSet.ItemType.Equal(ItemType)).OrderByASC(SysItemSet.OrderID);
            List<SysItem> AllList = OPBiz.GetOwnList<SysItem>(sql);
            return JsonHelper.ToJson(AllList, true);

        }
        public string GetSonDictionary(string DicNo)
        {
            string jsonstring = "[]";
            var sql = Sys_DictionarySet.SelectAll().Where(Sys_DictionarySet.DicNo.StartWith(DicNo));
            List<Sys_Dictionary> listAll = OPBiz.GetOwnList<Sys_Dictionary>(sql);
            jsonstring = OPBiz.GetCombotree(listAll);


            return jsonstring;
        }
        public string GetSonDictionaryNo(string DicNo)
        {
            string jsonstring = "[]";
            var sql = Sys_DictionarySet.SelectAll().Where(Sys_DictionarySet.DicNo.StartWith(DicNo));
            List<Sys_Dictionary> listAll = OPBiz.GetOwnList<Sys_Dictionary>(sql);
            if (listAll != null && listAll.Count > 0)
            {
                for (int i = 0; i < listAll.Count; i++)
                {
                    if (listAll[i].DicNo.Equals(DicNo))//去除父级
                    {
                        listAll.Remove(listAll[i]);
                        break;
                    }
                }
                jsonstring = OPBiz.GetCombotree(listAll);
            }

            return jsonstring;
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}