
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using e3net.common;
using e3net.DAL;
using e3net.IDAL.TireTreasureDB;
using e3net.Mode.TireTreasureDB;
using e3net.common.SysMode;
using TZHSWEET.Common;
namespace e3net.BLL.TireTreasureDB
{
    public class TT_FilesInsuranBiz : BaseDao<TT_FilesInsuran>, ITT_FilesInsuranDao
    {

        public TT_FilesInsuranBiz()
        {
            SetDb(false, "TreasureCN");
        }
        /// <summary>
        /// 拼接url获取json
        /// </summary>
        /// <param name="mql"></param>
        /// <returns></returns>
        public string GetJson(List<TT_FilesInsuran> list)
        {

            List<FileJson> json = new List<FileJson>();
            if (list != null && list.Count > 0)
            {
                for (int i = 0; i < list.Count; i++)
                {

                    FileJson item = new FileJson();
                    item.ShowName = list[i].ShowName;
                    item.Url = list[i].Route + list[i].RelativePath;
                    json.Add(item);
                }
            }

            return JsonHelper.ToJson(json);
        }
    }
}

