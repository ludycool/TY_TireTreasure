
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using e3net.Mode.TireTreasureDB;
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
    }
}
