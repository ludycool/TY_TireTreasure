
using e3net.common;
using e3net.DAL;
using e3net.IDAL;
using e3net.IDAL.TireTreasureBaseDB;
using e3net.Mode;
using e3net.Mode.TireTreasureBaseDB;
using e3net.Mode.V_mode;
using System;
using System.Collections.Generic;
//using System.ComponentModel.Composition;
using System.Linq;
using System.Text;

namespace e3net.BLL.TireTreasureBaseDB
{
  //  [Export(typeof(ISys_CityAreaDao))]
    public class Sys_CityAreaBiz : BaseDao<Sys_CityArea>, ISys_CityAreaDao
    {


        /// <summary>
        /// 词典树型数据生成json！！
        /// </summary>
        /// <returns></returns>
        public string GetTree(List<v_Sys_CityArea> list)
        {
            string menus = " [\n";

            List<v_Sys_CityArea> listFather = list.FindAll(p => p.ParentId == 0);//父级
            for (int i = 0; i < listFather.Count; i++)
            {

                menus += "{  \"Id\":\"" + listFather[i].CityAreaId + "\",";
                menus += string.Format("  \"Name\":\"{0}\",", listFather[i].TName);
                menus += string.Format("  \"ParentId\":\"{0}\",", listFather[i].ParentId);
                menus += string.Format("  \"OrderNo\":\"{0}\",", listFather[i].OrderNo);
                menus += string.Format("  \"Remarks\":\"{0}\",", listFather[i].Remarks);
                menus += string.Format("  \"Icon\":\"{0}\",", listFather[i].Icon);
                menus += string.Format("  \"TCode\":\"{0}\",", listFather[i].TCode);
                menus += string.Format("  \"AreaTypes\":\"{0}\",", listFather[i].AreaTypes);
                menus += string.Format("  \"AreaTypesName\":\"{0}\",", listFather[i].AreaTypesName);
                menus += GetSonTree(list, listFather[i]);//添加children
                    menus += "},";
            }
            menus = menus.Substring(0, menus.Length - 1);
            menus = menus + "]";

            return menus;
        }
        private string GetSonTree(List<v_Sys_CityArea> listAll, v_Sys_CityArea SonItem)
        {
            string menus = "\"children\":[";
            List<v_Sys_CityArea> list = listAll.FindAll(p => p.ParentId.Equals(SonItem.CityAreaId));
            if (list != null && list.Count > 0)
            {
                for (int i = 0; i < list.Count; i++)
                {

                    menus += "{  \"Id\":\"" + list[i].CityAreaId + "\",";
                    menus += string.Format("  \"Name\":\"{0}\",", list[i].TName);
                    menus += string.Format("  \"ParentId\":\"{0}\",", list[i].ParentId);
                    menus += string.Format("  \"OrderNo\":\"{0}\",", list[i].OrderNo);
                    menus += string.Format("  \"Remarks\":\"{0}\",", list[i].Remarks);
                    menus += string.Format("  \"Icon\":\"{0}\",", list[i].Icon);
                    menus += string.Format("  \"TCode\":\"{0}\",", list[i].TCode);
                    menus += string.Format("  \"AreaTypes\":\"{0}\",", list[i].AreaTypes);
                    menus += string.Format("  \"AreaTypesName\":\"{0}\",", list[i].AreaTypesName);
                    menus += GetSonTree(listAll, list[i]);//添加children
                    menus += "},";

                }
                menus = menus.Substring(0, menus.Length - 1);
            }
            menus = menus + "]";
            return menus;
        }
        /// <summary>
        /// 词典树型数据生成json！！
        /// </summary>
        /// <param name="Id">角色的Id</param>
        /// <returns></returns>
        public string GetCombotree(List<Sys_CityArea> list)
        {
            string menus = " [\n";
            List<Sys_CityArea> listFather = list.FindAll(p => p.ParentId == 0);//父级
            for (int i = 0; i < listFather.Count; i++)
            {
                menus += "{  \"Id\":\"" + listFather[i].TCode + "\",";
                menus += string.Format("  \"Name\":\"{0}\",", listFather[i].TName);
                menus += string.Format("  \"iconCls\":\"{0}\",", listFather[i].Icon);
                menus += GetSonGetCombotree(list, listFather[i]);//添加children
                    menus += "},";
               
            }
            menus = menus.Substring(0, menus.Length - 1);
            menus = menus + "]";

            return menus;
        }
        private string GetSonGetCombotree(List<Sys_CityArea> listAll, Sys_CityArea SonItem)
        {
            string menus = "\"children\":[";
            List<Sys_CityArea> list = listAll.FindAll(p => p.ParentId.Equals(SonItem.CityAreaId));
            if (list != null && list.Count > 0)
            {
                for (int i = 0; i < list.Count; i++)
                {

                    menus += "{  \"Id\":\"" + list[i].TCode + "\",";
                    menus += string.Format("  \"Name\":\"{0}\",", list[i].TName);
                    menus += string.Format("  \"iconCls\":\"{0}\",", list[i].Icon);
                    menus += GetSonGetCombotree(listAll, list[i]);//添加children
                    menus += "},";

                }
                menus = menus.Substring(0, menus.Length - 1);
            }
            menus = menus + "]";
            return menus;
        }

    }
}
