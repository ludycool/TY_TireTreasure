
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
    public class TT_UserBiz : BaseDao<TT_User>, ITT_UserDao
    {

        public TT_UserBiz()
        {
            SetDb(false, "TreasureCN");
        }

    }
}

