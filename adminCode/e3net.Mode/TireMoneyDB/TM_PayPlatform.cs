using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Moon.Orm;

namespace e3net.Mode.TireMoneyDB
{

    [Table("[TM_PayPlatform]", DbType.SqlServer)]
    [TablesPrimaryKey(PrimaryKeyType.CustomerGUID, typeof(Int32), "PPId")]
    public partial class TM_PayPlatform : EntityBase
    {

        /// <summary>
        /// 主键
        /// </summary>
        public Int32 PPId
        {
            get { return GetPropertyValue<Int32>("PPId"); }
            set { SetPropertyValue("PPId", value); }
        }

        /// <summary>
        /// 名称
        /// </summary>
        public String TName
        {
            get { return GetPropertyValue<String>("TName"); }
            set { SetPropertyValue("TName", value); }
        }

        /// <summary>
        /// 接口Url
        /// </summary>
        public String ApiUrl
        {
            get { return GetPropertyValue<String>("ApiUrl"); }
            set { SetPropertyValue("ApiUrl", value); }
        }

        /// <summary>
        /// 图标
        /// </summary>
        public String IConUrl
        {
            get { return GetPropertyValue<String>("IConUrl"); }
            set { SetPropertyValue("IConUrl", value); }
        }

        /// <summary>
        /// 排序
        /// </summary>
        public Int32? Orders
        {
            get { return GetPropertyValue<Int32?>("Orders"); }
            set { SetPropertyValue("Orders", value); }
        }

        /// <summary>
        /// 代号
        /// </summary>
        public String SCode
        {
            get { return GetPropertyValue<String>("SCode"); }
            set { SetPropertyValue("SCode", value); }
        }

        /// <summary>
        /// 公钥
        /// </summary>
        public String Pkey
        {
            get { return GetPropertyValue<String>("Pkey"); }
            set { SetPropertyValue("Pkey", value); }
        }

        /// <summary>
        /// 详情
        /// </summary>
        public String Details
        {
            get { return GetPropertyValue<String>("Details"); }
            set { SetPropertyValue("Details", value); }
        }

        /// <summary>
        /// 类型(转账、购物)
        /// </summary>
        public Int32? Types
        {
            get { return GetPropertyValue<Int32?>("Types"); }
            set { SetPropertyValue("Types", value); }
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
        /// 是否有效
        /// </summary>
        public Boolean? isValid
        {
            get { return GetPropertyValue<Boolean?>("isValid"); }
            set { SetPropertyValue("isValid", value); }
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

    [Table("[TM_PayPlatform]", DbType.SqlServer)]
    public  partial class TM_PayPlatformSet : MQLBase
    {
        public static  MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.SqlServer,"[TM_PayPlatform]",fields);
        }
        public static  MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.SqlServer,"[TM_PayPlatform]");
        }
        public static MQLBase SelectAllBut(params FieldBase[] fields)
        {
            return MQLBase.SelectAllBut(typeof(TM_PayPlatformSet),DbType.SqlServer,"[TM_PayPlatform]",fields);
        }

        /// <summary>
        /// 主键
        /// </summary>
        public static readonly FieldBase PPId = new FieldBase(DbType.SqlServer, "[TM_PayPlatform]", FieldType.OnlyPrimaryKey, "[PPId]");

        /// <summary>
        /// 名称
        /// </summary>
        public static readonly FieldBase TName = new FieldBase(DbType.SqlServer, "[TM_PayPlatform]", FieldType.Common, "[TName]");

        /// <summary>
        /// 接口Url
        /// </summary>
        public static readonly FieldBase ApiUrl = new FieldBase(DbType.SqlServer, "[TM_PayPlatform]", FieldType.Common, "[ApiUrl]");

        /// <summary>
        /// 图标
        /// </summary>
        public static readonly FieldBase IConUrl = new FieldBase(DbType.SqlServer, "[TM_PayPlatform]", FieldType.Common, "[IConUrl]");

        /// <summary>
        /// 排序
        /// </summary>
        public static readonly FieldBase Orders = new FieldBase(DbType.SqlServer, "[TM_PayPlatform]", FieldType.Common, "[Orders]");

        /// <summary>
        /// 代号
        /// </summary>
        public static readonly FieldBase SCode = new FieldBase(DbType.SqlServer, "[TM_PayPlatform]", FieldType.Common, "[SCode]");

        /// <summary>
        /// 公钥
        /// </summary>
        public static readonly FieldBase Pkey = new FieldBase(DbType.SqlServer, "[TM_PayPlatform]", FieldType.Common, "[Pkey]");

        /// <summary>
        /// 详情
        /// </summary>
        public static readonly FieldBase Details = new FieldBase(DbType.SqlServer, "[TM_PayPlatform]", FieldType.Common, "[Details]");

        /// <summary>
        /// 类型(转账、购物)
        /// </summary>
        public static readonly FieldBase Types = new FieldBase(DbType.SqlServer, "[TM_PayPlatform]", FieldType.Common, "[Types]");

        /// <summary>
        /// 添加时间
        /// </summary>
        public static readonly FieldBase CreateTime = new FieldBase(DbType.SqlServer, "[TM_PayPlatform]", FieldType.Common, "[CreateTime]");

        /// <summary>
        /// 修改时间
        /// </summary>
        public static readonly FieldBase UpdateTime = new FieldBase(DbType.SqlServer, "[TM_PayPlatform]", FieldType.Common, "[UpdateTime]");

        /// <summary>
        /// 是否有效
        /// </summary>
        public static readonly FieldBase isValid = new FieldBase(DbType.SqlServer, "[TM_PayPlatform]", FieldType.Common, "[isValid]");

        /// <summary>
        /// 是否删除
        /// </summary>
        public static readonly FieldBase isDeleted = new FieldBase(DbType.SqlServer, "[TM_PayPlatform]", FieldType.Common, "[isDeleted]");
    }

}
