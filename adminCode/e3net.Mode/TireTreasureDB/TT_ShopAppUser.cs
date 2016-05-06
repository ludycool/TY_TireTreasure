using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Moon.Orm;

namespace e3net.Mode.TireTreasureDB
{

    [Table("[TT_ShopAppUser]", DbType.SqlServer)]
    [TablesPrimaryKey(PrimaryKeyType.CustomerGUID, typeof(Guid), "ShopUserId")]
    public partial class TT_ShopAppUser : EntityBase
    {

        /// <summary>
        /// 主键
        /// </summary>
        public Guid ShopUserId
        {
            get { return GetPropertyValue<Guid>("ShopUserId"); }
            set { SetPropertyValue("ShopUserId", value); }
        }

        /// <summary>
        /// 商店Id
        /// </summary>
        public Guid ShopId
        {
            get { return GetPropertyValue<Guid>("ShopId"); }
            set { SetPropertyValue("ShopId", value); }
        }

        /// <summary>
        /// 用户Id
        /// </summary>
        public Guid UserId
        {
            get { return GetPropertyValue<Guid>("UserId"); }
            set { SetPropertyValue("UserId", value); }
        }

        /// <summary>
        /// 用户微信openId(商家的微信)
        /// </summary>
        public String WeiXinId
        {
            get { return GetPropertyValue<String>("WeiXinId"); }
            set { SetPropertyValue("WeiXinId", value); }
        }

        /// <summary>
        /// 用户类型 预留
        /// </summary>
        public Byte UserType
        {
            get { return GetPropertyValue<Byte>("UserType"); }
            set { SetPropertyValue("UserType", value); }
        }

        /// <summary>
        /// 等级
        /// </summary>
        public Byte Levels
        {
            get { return GetPropertyValue<Byte>("Levels"); }
            set { SetPropertyValue("Levels", value); }
        }

        /// <summary>
        /// 积分
        /// </summary>
        public Int32? Scores
        {
            get { return GetPropertyValue<Int32?>("Scores"); }
            set { SetPropertyValue("Scores", value); }
        }

        /// <summary>
        /// 添加时间
        /// </summary>
        public DateTime? CreateTime
        {
            get { return GetPropertyValue<DateTime?>("CreateTime"); }
            set { SetPropertyValue("CreateTime", value); }
        }

        /// <summary>
        /// 修改时间
        /// </summary>
        public DateTime? UpdateTime
        {
            get { return GetPropertyValue<DateTime?>("UpdateTime"); }
            set { SetPropertyValue("UpdateTime", value); }
        }

        /// <summary>
        /// 状态（2已审核、开启1，未审核0，关闭-1）
        /// </summary>
        public Byte States
        {
            get { return GetPropertyValue<Byte>("States"); }
            set { SetPropertyValue("States", value); }
        }

        /// <summary>
        /// 是否删除
        /// </summary>
        public Boolean? isDeleted
        {
            get { return GetPropertyValue<Boolean?>("isDeleted"); }
            set { SetPropertyValue("isDeleted", value); }
        }
    }

    [Table("[TT_ShopAppUser]", DbType.SqlServer)]
    public  partial class TT_ShopAppUserSet : MQLBase
    {
        public static  MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.SqlServer,"[TT_ShopAppUser]",fields);
        }
        public static  MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.SqlServer,"[TT_ShopAppUser]");
        }
        public static MQLBase SelectAllBut(params FieldBase[] fields)
        {
            return MQLBase.SelectAllBut(typeof(TT_ShopAppUserSet),DbType.SqlServer,"[TT_ShopAppUser]",fields);
        }

        /// <summary>
        /// 主键
        /// </summary>
        public static readonly FieldBase ShopUserId = new FieldBase(DbType.SqlServer, "[TT_ShopAppUser]", FieldType.OnlyPrimaryKey, "[ShopUserId]");

        /// <summary>
        /// 商店Id
        /// </summary>
        public static readonly FieldBase ShopId = new FieldBase(DbType.SqlServer, "[TT_ShopAppUser]", FieldType.Common, "[ShopId]");

        /// <summary>
        /// 用户Id
        /// </summary>
        public static readonly FieldBase UserId = new FieldBase(DbType.SqlServer, "[TT_ShopAppUser]", FieldType.Common, "[UserId]");

        /// <summary>
        /// 用户微信openId(商家的微信)
        /// </summary>
        public static readonly FieldBase WeiXinId = new FieldBase(DbType.SqlServer, "[TT_ShopAppUser]", FieldType.Common, "[WeiXinId]");

        /// <summary>
        /// 用户类型 预留
        /// </summary>
        public static readonly FieldBase UserType = new FieldBase(DbType.SqlServer, "[TT_ShopAppUser]", FieldType.Common, "[UserType]");

        /// <summary>
        /// 等级
        /// </summary>
        public static readonly FieldBase Levels = new FieldBase(DbType.SqlServer, "[TT_ShopAppUser]", FieldType.Common, "[Levels]");

        /// <summary>
        /// 积分
        /// </summary>
        public static readonly FieldBase Scores = new FieldBase(DbType.SqlServer, "[TT_ShopAppUser]", FieldType.Common, "[Scores]");

        /// <summary>
        /// 添加时间
        /// </summary>
        public static readonly FieldBase CreateTime = new FieldBase(DbType.SqlServer, "[TT_ShopAppUser]", FieldType.Common, "[CreateTime]");

        /// <summary>
        /// 修改时间
        /// </summary>
        public static readonly FieldBase UpdateTime = new FieldBase(DbType.SqlServer, "[TT_ShopAppUser]", FieldType.Common, "[UpdateTime]");

        /// <summary>
        /// 状态（2已审核、开启1，未审核0，关闭-1）
        /// </summary>
        public static readonly FieldBase States = new FieldBase(DbType.SqlServer, "[TT_ShopAppUser]", FieldType.Common, "[States]");

        /// <summary>
        /// 是否删除
        /// </summary>
        public static readonly FieldBase isDeleted = new FieldBase(DbType.SqlServer, "[TT_ShopAppUser]", FieldType.Common, "[isDeleted]");
    }

}
