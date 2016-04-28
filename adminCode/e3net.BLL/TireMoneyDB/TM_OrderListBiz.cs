
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using e3net.common;
using e3net.DAL;
using e3net.IDAL.TireMoneyDB;
using e3net.Mode.TireMoneyDB;
namespace e3net.BLL.TireMoneyDB
{
    public class TM_OrderListBiz : BaseDao<TM_OrderList>, ITM_OrderListDao
    {

        public TM_OrderListBiz()
        {
            SetDb(false, "MoneyCN");
        }

    }
}

