
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using e3net.common;
using e3net.DAL;
using e3net.IDAL.Base;
using e3net.Mode.Base;
namespace e3net.BLL.Base
{
    public class Sys_DicTypeBiz : BaseDao<Sys_DicType>, ISys_DicTypeDao
    {

        public Sys_DicTypeBiz()
        {
            SetDb(false, "BaseCN");
        }

    }
}

