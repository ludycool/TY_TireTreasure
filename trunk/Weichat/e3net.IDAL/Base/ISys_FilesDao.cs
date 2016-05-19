
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using e3net.Mode.Base;
using e3net.common.SysMode;
namespace e3net.IDAL.Base
{
    public interface ISys_FilesDao : IBaseDao<Sys_Files>
    {


        /// <summary>
        /// 拼接url获取json
        /// </summary>
        /// <param name="mql"></param>
        /// <returns></returns>
        string GetJson(List<Sys_Files> list );

        /// <summary>
        /// 拼接url 单纯要名称 和url
        /// </summary>
        /// <param name="mql"></param>
        /// <returns></returns>
        List<FileJson> GetFList(List<Sys_Files> list);

    }
}
