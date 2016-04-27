using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using e3net.Mode.TireTreasureBaseDB;
using e3net.Mode.V_mode;

namespace e3net.IDAL.TireTreasureBaseDB
{
    public interface ISys_CityAreaDao : IBaseDao<Sys_CityArea>
    {
        string GetTree(List<v_Sys_CityArea> list);

    }
}
