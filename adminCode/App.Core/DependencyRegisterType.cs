using System;
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
using e3net.IDAL.TireTreasureDB;
using e3net.BLL.TireTreasureDB;

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

             #region Base
             container.RegisterType<ISys_CityAreaDao, Sys_CityAreaBiz>();
             container.RegisterType<ISys_DictionaryDao, Sys_DictionaryBiz>();
             container.RegisterType<ISys_DicTypeDao, Sys_DicTypeBiz>();
             container.RegisterType<ISys_FilesDao, Sys_FilesBiz>();
             container.RegisterType<ISysItemDao, SysItemBiz>();
             container.RegisterType<ISystemLogsDao, SystemLogsBiz>();
          
             #endregion

             #region TireTreasureDB
             container.RegisterType<ITT_AppUserInfoDao, TT_AppUserInfoBiz>();
             container.RegisterType<ITT_CommentTDao, TT_CommentTBiz>();
             container.RegisterType<ITT_FilesInsuranDao, TT_FilesInsuranBiz>();
             container.RegisterType<ITT_FilesTransactDao, TT_FilesTransactBiz>();
             container.RegisterType<ITT_FriendsDao, TT_FriendsBiz>();
             container.RegisterType<ITT_FundInfoDao, TT_FundInfoBiz>();
             container.RegisterType<ITT_FundPerSonDao, TT_FundPerSonBiz>();
             container.RegisterType<ITT_InsuranDao, TT_InsuranBiz>();
             container.RegisterType<ITT_InsuranCompanyDao, TT_InsuranCompanyBiz>();
             container.RegisterType<ITT_LevelsDao, TT_LevelsBiz>();
             container.RegisterType<ITT_MessagesDao, TT_MessagesBiz>();
             container.RegisterType<ITT_MissionsDao, TT_MissionsBiz>();
             container.RegisterType<ITT_MissionsApplyDao, TT_MissionsApplyBiz>();
             container.RegisterType<ITT_ReferencesDao, TT_ReferencesBiz>();
             container.RegisterType<ITT_RequestFriendsDao, TT_RequestFriendsBiz>();
             container.RegisterType<ITT_ReservationDao, TT_ReservationBiz>();
             container.RegisterType<ITT_ShopDao, TT_ShopBiz>();
             container.RegisterType<ITT_ShopAppUserDao, TT_ShopAppUserBiz>();
             container.RegisterType<ITT_TransactionDao, TT_TransactionBiz>();
             container.RegisterType<ITT_TransactSnapshotDao, TT_TransactSnapshotBiz>();
             container.RegisterType<ITT_UserDao, TT_UserBiz>();
             #endregion
        }
    }
}