
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
    public class SysItemBiz : BaseDao<SysItem>, ISysItemDao
    {

        public SysItemBiz()
        {
            SetDb(false, "BaseCN");
        }
        /// <summary>
        ///支持多数据库 数据库连接 
        /// </summary>
        /// <param name="ConetDB"></param>
        public SysItemBiz(string ConnectionName)
        {
            SetDb(false, ConnectionName);
        }
    }
}

