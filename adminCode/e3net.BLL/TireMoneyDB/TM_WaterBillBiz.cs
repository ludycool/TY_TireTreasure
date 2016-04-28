
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
    public class TM_WaterBillBiz : BaseDao<TM_WaterBill>, ITM_WaterBillDao
    {

        public TM_WaterBillBiz()
        {
            SetDb(false, "MoneyCN");
        }

    }
}

