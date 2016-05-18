using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//using App.BLL;
//using App.DAL;
//using App.IBLL;
//using App.IDAL;
using e3net.BLL;
using e3net.IDAL;
using Microsoft.Practices.Unity;
using e3net.IDAL.Base;
using e3net.BLL.Base;
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

            #endregion
             #region 用户信息
             container.RegisterType<I_AppUserInfoDao, AppUserInfoBiz>();
             container.RegisterType<I_UserDao, UserBiz>();
             #endregion
        }
    }
}