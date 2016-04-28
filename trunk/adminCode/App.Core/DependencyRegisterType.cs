﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//using App.BLL;
//using App.DAL;
//using App.IBLL;
//using App.IDAL;
using e3net.BLL;
using e3net.BLL.RMS;
using e3net.IDAL;
using e3net.IDAL.RMS;
using Microsoft.Practices.Unity;
using e3net.IDAL.Base;
using e3net.BLL.Base;
using e3net.IDAL.TireMoneyDB;
using e3net.BLL.TireMoneyDB;

namespace App.Core
{
    public class DependencyRegisterType
    {
        //系统注入
        public static void Container_Sys(ref UnityContainer container)
        {
            //container.RegisterType<ISysSampleBLL, SysSampleBLL>();//样例
            #region 权限
            container.RegisterType<IRMS_UserRoleDao, RMS_UserRoleBiz>();
            container.RegisterType<IRMS_ButtonsDao, RMS_ButtonsBiz>();
            container.RegisterType<IRMS_UserDao, RMS_UserBiz>();
            container.RegisterType<IRMS_UserRoleDao, RMS_UserRoleBiz>();
            container.RegisterType<IRMS_RoleDao, RMS_RoleBiz>();

            container.RegisterType<IRMS_RoleManusDao, RMS_RoleManusBiz>();
            container.RegisterType<IRMS_RoleManuButtonsDao, RMS_RoleManuButtonsBiz>();


            container.RegisterType<IRMS_MenuButtonsDao, RMS_MenuButtonsBiz>();


            container.RegisterType<IRMS_MenusDao, RMS_MenusBiz>();

            
          
          container.RegisterType<ISys_DictionaryDao, Sys_DictionaryBiz>();

             container.RegisterType<IRMS_DepartmentDao, RMS_DepartmentBiz>();

 
            #endregion
             #region TireMoneyDB

             container.RegisterType<ITM_BalceDao, TM_BalceBiz>();
             container.RegisterType<ITM_BanardDao, TM_BanardBiz>();
             container.RegisterType<ITM_OrderListDao, TM_OrderListBiz>();
             container.RegisterType<ITM_PayPlatformDao, TM_PayPlatformBiz>();
             container.RegisterType<ITM_TranAccDao, TM_TranAccBiz>();
             container.RegisterType<ITM_WaterBillDao, TM_WaterBillBiz>();
             #endregion

        }
    }
}