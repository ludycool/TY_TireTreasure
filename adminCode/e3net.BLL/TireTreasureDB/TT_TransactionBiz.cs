
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
    public class TT_TransactionBiz : BaseDao<TT_Transaction>, ITT_TransactionDao
    {

        public TT_TransactionBiz()
        {
            SetDb(false, "TreasureCN");
        }

    }
}

