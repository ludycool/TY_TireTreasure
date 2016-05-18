
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using e3net.Mode.TireTreasureDB;
namespace  e3net.IDAL.TireTreasureDB
{
    public interface ITT_FilesTransactDao : IBaseDao<TT_FilesTransact>
    {
        /// <summary>
        /// 拼接url获取json
        /// </summary>
        /// <param name="mql"></param>
        /// <returns></returns>
        string GetJson(List<TT_FilesTransact> list);
    }
}
