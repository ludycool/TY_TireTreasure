
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
    public class TM_BalceBiz : BaseDao<TM_Balce>, ITM_BalceDao
    {

        public TM_BalceBiz()
        {
            SetDb(false, "MoneyCN");
        }

    }
}

