using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Moon.Orm;

namespace e3net.Mode.TireTreasureDB
{

    [Table("[TT_InsuranItermSeel]", DbType.SqlServer)]
    [TablesPrimaryKey(PrimaryKeyType.AutoIncrease, typeof(Int32), "ItermSeelId")]
    public partial class TT_InsuranItermSeel : EntityBase
    {

        /// <summary>
        /// 主键
        /// </summary>
        public Int32 ItermSeelId
        {
            get { return GetPropertyValue<Int32>("ItermSeelId"); }
            set { SetPropertyValue("ItermSeelId", value); }
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
        /// 费率
        /// </summary>
        public Double? Rates
        {
            get { return GetPropertyValue<Double?>("Rates"); }
            set { SetPropertyValue("Rates", value); }
        }

        /// <summary>
        /// 公式
        /// </summary>
        public String Formula
        {
            get { return GetPropertyValue<String>("Formula"); }
            set { SetPropertyValue("Formula", value); }
        }

        /// <summary>
        /// 赔附额度(多个' | '分开)
        /// </summary>
        public String ClaimAmount
        {
            get { return GetPropertyValue<String>("ClaimAmount"); }
            set { SetPropertyValue("ClaimAmount", value); }
        }

        /// <summary>
        /// 简介
        /// </summary>
        public String Describe
        {
            get { return GetPropertyValue<String>("Describe"); }
            set { SetPropertyValue("Describe", value); }
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

    [Table("[TT_InsuranItermSeel]", DbType.SqlServer)]
    public  partial class TT_InsuranItermSeelSet : MQLBase
    {
        public static  MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.SqlServer,"[TT_InsuranItermSeel]",fields);
        }
        public static  MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.SqlServer,"[TT_InsuranItermSeel]");
        }
        public static MQLBase SelectAllBut(params FieldBase[] fields)
        {
            return MQLBase.SelectAllBut(typeof(TT_InsuranItermSeelSet),DbType.SqlServer,"[TT_InsuranItermSeel]",fields);
        }

        /// <summary>
        /// 主键
        /// </summary>
        public static readonly FieldBase ItermSeelId = new FieldBase(DbType.SqlServer, "[TT_InsuranItermSeel]", FieldType.OnlyPrimaryKey, "[ItermSeelId]");

        /// <summary>
        /// 名称
        /// </summary>
        public static readonly FieldBase TName = new FieldBase(DbType.SqlServer, "[TT_InsuranItermSeel]", FieldType.Common, "[TName]");

        /// <summary>
        /// 排序
        /// </summary>
        public static readonly FieldBase Orders = new FieldBase(DbType.SqlServer, "[TT_InsuranItermSeel]", FieldType.Common, "[Orders]");

        /// <summary>
        /// 代号
        /// </summary>
        public static readonly FieldBase SCode = new FieldBase(DbType.SqlServer, "[TT_InsuranItermSeel]", FieldType.Common, "[SCode]");

        /// <summary>
        /// 费率
        /// </summary>
        public static readonly FieldBase Rates = new FieldBase(DbType.SqlServer, "[TT_InsuranItermSeel]", FieldType.Common, "[Rates]");

        /// <summary>
        /// 公式
        /// </summary>
        public static readonly FieldBase Formula = new FieldBase(DbType.SqlServer, "[TT_InsuranItermSeel]", FieldType.Common, "[Formula]");

        /// <summary>
        /// 赔附额度(多个' | '分开)
        /// </summary>
        public static readonly FieldBase ClaimAmount = new FieldBase(DbType.SqlServer, "[TT_InsuranItermSeel]", FieldType.Common, "[ClaimAmount]");

        /// <summary>
        /// 简介
        /// </summary>
        public static readonly FieldBase Describe = new FieldBase(DbType.SqlServer, "[TT_InsuranItermSeel]", FieldType.Common, "[Describe]");

        /// <summary>
        /// 详情
        /// </summary>
        public static readonly FieldBase Details = new FieldBase(DbType.SqlServer, "[TT_InsuranItermSeel]", FieldType.Common, "[Details]");

        /// <summary>
        /// 添加时间
        /// </summary>
        public static readonly FieldBase CreateTime = new FieldBase(DbType.SqlServer, "[TT_InsuranItermSeel]", FieldType.Common, "[CreateTime]");

        /// <summary>
        /// 修改时间
        /// </summary>
        public static readonly FieldBase UpdateTime = new FieldBase(DbType.SqlServer, "[TT_InsuranItermSeel]", FieldType.Common, "[UpdateTime]");

        /// <summary>
        /// 是否有效
        /// </summary>
        public static readonly FieldBase isValid = new FieldBase(DbType.SqlServer, "[TT_InsuranItermSeel]", FieldType.Common, "[isValid]");

        /// <summary>
        /// 是否删除
        /// </summary>
        public static readonly FieldBase isDeleted = new FieldBase(DbType.SqlServer, "[TT_InsuranItermSeel]", FieldType.Common, "[isDeleted]");
    }

}
