using e3net.DAL;
using e3net.IDAL.TireMoneyDB;
using e3net.Mode.TireMoneyDB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace e3net.BLL.TireMoneyDB
{
    public class TM_OrderNoBiz : BaseDao<TM_OrderNo>, ITM_OrderNoDao
    {
        public TM_OrderNoBiz()
        {
            SetDb(false, "MoneyCN");
        }
    }
}
