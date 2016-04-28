
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
    public class Sys_FilesBiz : BaseDao<Sys_Files>, ISys_FilesDao
    {

        public Sys_FilesBiz()
        {
            SetDb(false, "BaseCN");
        }

    }
}

