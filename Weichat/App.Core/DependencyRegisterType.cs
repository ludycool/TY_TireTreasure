using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//using App.BLL;
//using App.DAL;
//using App.IBLL;
//using App.IDAL;
using e3net.BLL;
using e3net.BLL.DynamicTable;

using e3net.IDAL;
using e3net.IDAL.DynamicTable;

using Microsoft.Practices.Unity;

namespace App.Core
{
    public class DependencyRegisterType
    {
        //系统注入
        public static void Container_Sys(ref UnityContainer container)
        {
            //container.RegisterType<ISysSampleBLL, SysSampleBLL>();//样例
            #region 权限


            
          
          container.RegisterType<ISys_DictionaryDao, Sys_DictionaryBiz>();



             container.RegisterType<IBaschartypeDao, BaschartypeBiz>();
             container.RegisterType<IBascharvalueDao, BascharvalueBiz>();
            #endregion
              

        }
    }
}