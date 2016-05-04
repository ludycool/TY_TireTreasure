using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Moon.Orm;

namespace e3net.Mode.Base
{

    [Table("[TT_User]", DbType.Sqlite)]
    public partial class TT_UserSet : MQLBase
    {
        public static MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.Sqlite, "[TT_User]", fields);
        }
        public static MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.Sqlite, "[TT_User]");
        }
        public static MQLBase SelectAllBut(params FieldBase[] fields)
        {
            return MQLBase.SelectAllBut(typeof(TT_UserSet), DbType.Sqlite, "[TT_User]", fields);
        }

        /// <summary>
        /// 主键
        /// </summary>
        public static readonly FieldBase UserId = new FieldBase(DbType.Sqlite, "[TT_User]", FieldType.OnlyPrimaryKey, "[UserId]");

        /// <summary>
        /// 登录名
        /// </summary>
        public static readonly FieldBase LoginName = new FieldBase(DbType.Sqlite, "[TT_User]", FieldType.Common, "[LoginName]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase WeiXinId = new FieldBase(DbType.Sqlite, "[TT_User]", FieldType.Common, "[WeiXinId]");

        /// <summary>
        /// 密码
        /// </summary>
        public static readonly FieldBase Password = new FieldBase(DbType.Sqlite, "[TT_User]", FieldType.Common, "[Password]");

        /// <summary>
        /// 姓名
        /// </summary>
        public static readonly FieldBase TrueName = new FieldBase(DbType.Sqlite, "[TT_User]", FieldType.Common, "[TrueName]");

        /// <summary>
        /// 部门主键
        /// </summary>
        public static readonly FieldBase UserType = new FieldBase(DbType.Sqlite, "[TT_User]", FieldType.Common, "[UserType]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase Levels = new FieldBase(DbType.Sqlite, "[TT_User]", FieldType.Common, "[Levels]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase Scores = new FieldBase(DbType.Sqlite, "[TT_User]", FieldType.Common, "[Scores]");

        /// <summary>
        /// 状态（2已审核、开启1，未审核0，关闭-1）
        /// </summary>
        public static readonly FieldBase States = new FieldBase(DbType.Sqlite, "[TT_User]", FieldType.Common, "[States]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase tags = new FieldBase(DbType.Sqlite, "[TT_User]", FieldType.Common, "[tags]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase CurrentIP = new FieldBase(DbType.Sqlite, "[TT_User]", FieldType.Common, "[CurrentIP]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase CurrentPort = new FieldBase(DbType.Sqlite, "[TT_User]", FieldType.Common, "[CurrentPort]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase LastLoginAddr = new FieldBase(DbType.Sqlite, "[TT_User]", FieldType.Common, "[LastLoginAddr]");

        /// <summary>
        /// 状态（2已审核、开启1，未审核0，关闭-1）
        /// </summary>
        public static readonly FieldBase IsOnline = new FieldBase(DbType.Sqlite, "[TT_User]", FieldType.Common, "[IsOnline]");

        /// <summary>
        /// 添加时间
        /// </summary>
        public static readonly FieldBase CreateTime = new FieldBase(DbType.Sqlite, "[TT_User]", FieldType.Common, "[CreateTime]");

        /// <summary>
        /// 修改时间
        /// </summary>
        public static readonly FieldBase UpdateTime = new FieldBase(DbType.Sqlite, "[TT_User]", FieldType.Common, "[UpdateTime]");

        /// <summary>
        /// 是否删除
        /// </summary>
        public static readonly FieldBase isDeleted = new FieldBase(DbType.Sqlite, "[TT_User]", FieldType.Common, "[isDeleted]");
    }


    [Table("[TT_User]", DbType.Sqlite)]
    [TablesPrimaryKey(PrimaryKeyType.CustomerGUID, typeof(Guid), "UserId")]
    public partial class User : EntityBase
    {

        /// <summary>
        /// 主键
        /// </summary>
        public Guid UserId
        {
            get { return GetPropertyValue<Guid>("UserId"); }
            set { SetPropertyValue("UserId", value); }
        }

        /// <summary>
        /// 登录名
        /// </summary>
        public String LoginName
        {
            get { return GetPropertyValue<String>("LoginName"); }
            set { SetPropertyValue("LoginName", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public String WeiXinId
        {
            get { return GetPropertyValue<String>("WeiXinId"); }
            set { SetPropertyValue("WeiXinId", value); }
        }

        /// <summary>
        /// 密码
        /// </summary>
        public String Password
        {
            get { return GetPropertyValue<String>("Password"); }
            set { SetPropertyValue("Password", value); }
        }

        /// <summary>
        /// 姓名
        /// </summary>
        public String TrueName
        {
            get { return GetPropertyValue<String>("TrueName"); }
            set { SetPropertyValue("TrueName", value); }
        }

        /// <summary>
        /// 部门主键
        /// </summary>
        public Byte UserType
        {
            get { return GetPropertyValue<Byte>("UserType"); }
            set { SetPropertyValue("UserType", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public Byte Levels
        {
            get { return GetPropertyValue<Byte>("Levels"); }
            set { SetPropertyValue("Levels", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public Int32? Scores
        {
            get { return GetPropertyValue<Int32?>("Scores"); }
            set { SetPropertyValue("Scores", value); }
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
        /// 
        /// </summary>
        public String tags
        {
            get { return GetPropertyValue<String>("tags"); }
            set { SetPropertyValue("tags", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public String CurrentIP
        {
            get { return GetPropertyValue<String>("CurrentIP"); }
            set { SetPropertyValue("CurrentIP", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public String CurrentPort
        {
            get { return GetPropertyValue<String>("CurrentPort"); }
            set { SetPropertyValue("CurrentPort", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public String LastLoginAddr
        {
            get { return GetPropertyValue<String>("LastLoginAddr"); }
            set { SetPropertyValue("LastLoginAddr", value); }
        }

        /// <summary>
        /// 状态（2已审核、开启1，未审核0，关闭-1）
        /// </summary>
        public Boolean? IsOnline
        {
            get { return GetPropertyValue<Boolean?>("IsOnline"); }
            set { SetPropertyValue("IsOnline", value); }
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
        /// 是否删除
        /// </summary>
        public Boolean? isDeleted
        {
            get { return GetPropertyValue<Boolean?>("isDeleted"); }
            set { SetPropertyValue("isDeleted", value); }
        }
    }


}

