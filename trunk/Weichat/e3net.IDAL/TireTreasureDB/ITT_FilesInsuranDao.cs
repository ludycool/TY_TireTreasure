
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using e3net.Mode.TireTreasureDB;
using e3net.common.SysMode;
namespace  e3net.IDAL.TireTreasureDB
{
    public interface ITT_FilesInsuranDao : IBaseDao<TT_FilesInsuran>
    {
        /// <summary>
        /// 拼接url获取json
        /// </summary>
        /// <param name="mql"></param>
        /// <returns></returns>
        string GetJson(List<TT_FilesInsuran> list);
        /// <summary>
        /// 拼接url 单纯要名称 和url
        /// </summary>
        /// <param name="mql"></param>
        /// <returns></returns>
        List<FileJson> GetFList(List<TT_FilesInsuran> list);
    }
}
