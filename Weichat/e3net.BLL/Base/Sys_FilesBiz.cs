
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using e3net.common;
using e3net.DAL;
using e3net.IDAL.Base;
using e3net.Mode.Base;
using TZHSWEET.Common;
using e3net.common.SysMode;
namespace e3net.BLL.Base
{
    public class Sys_FilesBiz : BaseDao<Sys_Files>, ISys_FilesDao
    {

        public Sys_FilesBiz()
        {
            SetDb(false, "BaseCN");
        }


        /// <summary>
        /// 拼接url获取json
        /// </summary>
        /// <param name="mql"></param>
        /// <returns></returns>
        public string GetJson(List<Sys_Files> list)
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

