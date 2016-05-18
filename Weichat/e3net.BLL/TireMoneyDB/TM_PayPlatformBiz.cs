
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
    public class TM_PayPlatformBiz : BaseDao<TM_PayPlatform>, ITM_PayPlatformDao
    {

        public TM_PayPlatformBiz()
        {
            SetDb(false, "MoneyCN");
        }

    }
}

