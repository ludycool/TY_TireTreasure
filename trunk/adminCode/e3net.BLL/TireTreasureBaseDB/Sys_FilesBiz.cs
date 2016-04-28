
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using e3net.common;
using e3net.DAL;
using e3net.IDAL.TireTreasureBaseDB;
using e3net.Mode.TireTreasureBaseDB;
namespace e3net.BLL.TireTreasureBaseDB
{
    public class Sys_FilesBiz : BaseDao<Sys_Files>, ISys_FilesDao
    {

        public Sys_FilesBiz()
        {
            SetDb(false, "BaseCN");
        }

    }
}

