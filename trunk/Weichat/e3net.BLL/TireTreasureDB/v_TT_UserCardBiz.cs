
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
    public class v_TT_UserCardBiz : BaseDao<v_TT_UserCard>, Iv_TT_UserCardDao
    {

        public v_TT_UserCardBiz()
        {
            SetDb(false, "TreasureCN");
        }

    }
}

