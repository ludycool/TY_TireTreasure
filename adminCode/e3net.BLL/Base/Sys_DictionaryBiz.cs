
using e3net.common;
using e3net.DAL;
using e3net.IDAL.Base;
using e3net.Mode;
using e3net.Mode.Base;
using System;
using System.Collections.Generic;
//using System.ComponentModel.Composition;
using System.Linq;
using System.Text;

namespace e3net.BLL.Base
{
    //  [Export(typeof(ISys_DictionaryDao))]
    public class Sys_DictionaryBiz : BaseDao<Sys_Dictionary>, ISys_DictionaryDao
    {

        /// <summary>
        /// 根据值取下 一级所有的数据 
        /// </summary>
        /// <param name="ValueName"></param>
        /// <returns></returns>
        public List<Sys_Dictionary> GetSonbyParentId(string ParentId)
        {
            var sql = Sys_DictionarySet.SelectAll().Where(Sys_DictionarySet.ParentId.Equal(ParentId));
            List<Sys_Dictionary> listAll = GetOwnList<Sys_Dictionary>(sql);
            return listAll;
        }

        /// <summary>
        /// 根据值 取所有的子集数据 
        /// </summary>
        /// <param name="ValueName"></param>
        /// <returns></returns>
        public List<Sys_Dictionary> GetAllSonbyValueName(string DicNo)
        {
            var sql = Sys_DictionarySet.SelectAll().Where(Sys_DictionarySet.DicNo.StartWith(DicNo));
            List<Sys_Dictionary> listAll = GetOwnList<Sys_Dictionary>(sql);
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

            }
            return listAll;
        }
        /// <summary>
        /// 词典树型数据生成json！！
        /// </summary>
        /// <param name="Id">角色的Id</param>
        /// <returns></returns>
        public string GetTree(List<Sys_Dictionary> list)
        {
            string menus = " [\n";
            for (int i = 0; i < list.Count; i++)
            {
                if (list.Find(p => p.DicId == list[i].ParentId) == null)//此项没有父级
                {

                    menus += "{  \"Id\":\"" + list[i].DicId + "\",";
                    menus += string.Format("  \"DicTypeId\":\"{0}\",", list[i].DicTypeId);
                    menus += string.Format("  \"Name\":\"{0}\",", list[i].DicName);
                    menus += string.Format("  \"DicNo\":\"{0}\",", list[i].DicNo);
                    menus += string.Format("  \"ParentId\":\"{0}\",", list[i].ParentId);
                    menus += string.Format("  \"OrderId\":\"{0}\",", list[i].OrderId);
                    menus += string.Format("  \"Remarks\":\"{0}\",", list[i].Remarks);
                    menus += string.Format("  \"CreateTime\":\"{0}\",", list[i].CreateTime);
                    menus += string.Format("  \"iconCls\":\"{0}\",", list[i].Icon);
                    menus += GetSonTree(list, list[i]);//添加children
                    menus += "},";
                }
            }
            menus = menus.Substring(0, menus.Length - 1);
            menus = menus + "]";

            return menus;
        }
        private string GetSonTree(List<Sys_Dictionary> listAll, Sys_Dictionary SonItem)
        {
            string menus = "\"children\":[";
            List<Sys_Dictionary> list = listAll.FindAll(p => p.ParentId.Equals(SonItem.DicId));
            if (list != null && list.Count > 0)
            {
                for (int i = 0; i < list.Count; i++)
                {

                    menus += "{  \"Id\":\"" + list[i].DicId + "\",";
                    menus += string.Format("  \"Name\":\"{0}\",", list[i].DicName);
                    menus += string.Format("  \"DicTypeId\":\"{0}\",", list[i].DicTypeId);
                    menus += string.Format("  \"DicNo\":\"{0}\",", list[i].DicNo);
                    menus += string.Format("  \"ParentId\":\"{0}\",", list[i].ParentId);
                    menus += string.Format("  \"OrderId\":\"{0}\",", list[i].OrderId);
                    menus += string.Format("  \"Remarks\":\"{0}\",", list[i].Remarks);
                    menus += string.Format("  \"CreateTime\":\"{0}\",", list[i].CreateTime);
                    menus += string.Format("  \"iconCls\":\"{0}\",", list[i].Icon);
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
        public string GetCombotree(List<Sys_Dictionary> list)
        {
            string menus = " [\n";
            for (int i = 0; i < list.Count; i++)
            {
                if (list.Find(p => p.DicId == list[i].ParentId) == null)//此项没有父级
                {

                    menus += "{  \"Id\":\"" + list[i].DicNo + "\",";
                    menus += string.Format("  \"Name\":\"{0}\",", list[i].DicName);
                    menus += string.Format("  \"iconCls\":\"{0}\",", list[i].Icon);
                    menus += GetSonGetCombotree(list, list[i]);//添加children
                    menus += "},";
                }
            }
            menus = menus.Substring(0, menus.Length - 1);
            menus = menus + "]";

            return menus;
        }
        private string GetSonGetCombotree(List<Sys_Dictionary> listAll, Sys_Dictionary SonItem)
        {
            string menus = "\"children\":[";
            List<Sys_Dictionary> list = listAll.FindAll(p => p.ParentId.Equals(SonItem.DicId));
            if (list != null && list.Count > 0)
            {
                for (int i = 0; i < list.Count; i++)
                {

                    menus += "{  \"Id\":\"" + list[i].DicNo + "\",";
                    menus += string.Format("  \"Name\":\"{0}\",", list[i].DicName);
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
