﻿
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
    public class TT_CommentTBiz : BaseDao<TT_CommentT>, ITT_CommentTDao
    {

        public TT_CommentTBiz()
        {
            SetDb(false, "TreasureCN");
        }

    }
}

