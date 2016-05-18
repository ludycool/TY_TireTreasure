
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using e3net.common;
using e3net.DAL;
using e3net.IDAL.TireTreasureDB;
using e3net.Mode.TireTreasureDB;
namespace e3net.BLL.TireTreasureDB
{
    public class TT_FilesTransactBiz : BaseDao<TT_FilesTransact>, ITT_FilesTransactDao
    {

        public TT_FilesTransactBiz()
        {
            SetDb(false, "TreasureCN");
        }
        /// <summary>
        /// 拼接url获取json
        /// </summary>
        /// <param name="mql"></param>
        /// <returns></returns>
        public string GetJson(List<TT_FilesTransact> list)
        {


            string menus = " [\n";
            if (list != null && list.Count > 0)
            {
                for (int i = 0; i < list.Count; i++)
                {

                    menus += "{  \"ShowName\":\"" + list[i].ShowName + "\",";
                    menus += string.Format("  \"Url\":\"{0}\"", list[i].Route + list[i].RelativePath);
                    menus += "},";

                }
                menus = menus.Substring(0, menus.Length - 1);
            }
            menus = menus + "]";
            return menus;
        }
    }
}

