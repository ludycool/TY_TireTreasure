using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Moon.Orm;

namespace e3net.Mode.TireMoneyDB
{

    [Table("[TM_WaterBill]", DbType.SqlServer)]
    [TablesPrimaryKey(PrimaryKeyType.CustomerGUID, typeof(Guid), "BiId")]
    public partial class TM_WaterBill : EntityBase
    {

        /// <summary>
        /// 主键
        /// </summary>
        public Guid BiId
        {
            get { return GetPropertyValue<Guid>("BiId"); }
            set { SetPropertyValue("BiId", value); }
        }

        /// <summary>
        /// 用户Id
        /// </summary>
        public Guid UBId
        {
            get { return GetPropertyValue<Guid>("UBId"); }
            set { SetPropertyValue("UBId", value); }
        }

        /// <summary>
        /// 单号Id(转账单、付款订单、收款单、提现单)
        /// </summary>
        public Guid FId
        {
            get { return GetPropertyValue<Guid>("FId"); }
            set { SetPropertyValue("FId", value); }
        }

        /// <summary>
        /// 流水号
        /// </summary>
        public String NCode
        {
            get { return GetPropertyValue<String>("NCode"); }
            set { SetPropertyValue("NCode", value); }
        }

        /// <summary>
        /// 交易金额
        /// </summary>
        public Decimal? WMney
        {
            get { return GetPropertyValue<Decimal?>("WMney"); }
            set { SetPropertyValue("WMney", value); }
        }

        /// <summary>
        /// 明细说明
        /// </summary>
        public String Details
        {
            get { return GetPropertyValue<String>("Details"); }
            set { SetPropertyValue("Details", value); }
        }

        /// <summary>
        /// 备注说明
        /// </summary>
        public String Remarks
        {
            get { return GetPropertyValue<String>("Remarks"); }
            set { SetPropertyValue("Remarks", value); }
        }

        /// <summary>
        /// 平台（什么银行，支付宝、等）
        /// </summary>
        public String Platform
        {
            get { return GetPropertyValue<String>("Platform"); }
            set { SetPropertyValue("Platform", value); }
        }

        /// <summary>
        /// 类型(转账10、付款20、收款30、提现40、退款50)
        /// </summary>
        public Int32? BType
        {
            get { return GetPropertyValue<Int32?>("BType"); }
            set { SetPropertyValue("BType", value); }
        }

        /// <summary>
        /// 年
        /// </summary>
        public Int16? Years
        {
            get { return GetPropertyValue<Int16?>("Years"); }
            set { SetPropertyValue("Years", value); }
        }

        /// <summary>
        /// 月
        /// </summary>
        public Byte Months
        {
            get { return GetPropertyValue<Byte>("Months"); }
            set { SetPropertyValue("Months", value); }
        }

        /// <summary>
        /// 月日（xx-xx）
        /// </summary>
        public String Days
        {
            get { return GetPropertyValue<String>("Days"); }
            set { SetPropertyValue("Days", value); }
        }

        /// <summary>
        /// 周几
        /// </summary>
        public String Weeks
        {
            get { return GetPropertyValue<String>("Weeks"); }
            set { SetPropertyValue("Weeks", value); }
        }

        /// <summary>
        /// 图标地址
        /// </summary>
        public String ICons
        {
            get { return GetPropertyValue<String>("ICons"); }
            set { SetPropertyValue("ICons", value); }
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
        /// 是否删除
        /// </summary>
        public Boolean? isDeleted
        {
            get { return GetPropertyValue<Boolean?>("isDeleted"); }
            set { SetPropertyValue("isDeleted", value); }
        }
    }

    [Table("[TM_WaterBill]", DbType.SqlServer)]
    public  partial class TM_WaterBillSet : MQLBase
    {
        public static  MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.SqlServer,"[TM_WaterBill]",fields);
        }
        public static  MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.SqlServer,"[TM_WaterBill]");
        }
        public static MQLBase SelectAllBut(params FieldBase[] fields)
        {
            return MQLBase.SelectAllBut(typeof(TM_WaterBillSet),DbType.SqlServer,"[TM_WaterBill]",fields);
        }

        /// <summary>
        /// 主键
        /// </summary>
        public static readonly FieldBase BiId = new FieldBase(DbType.SqlServer, "[TM_WaterBill]", FieldType.OnlyPrimaryKey, "[BiId]");

        /// <summary>
        /// 用户Id
        /// </summary>
        public static readonly FieldBase UBId = new FieldBase(DbType.SqlServer, "[TM_WaterBill]", FieldType.Common, "[UBId]");

        /// <summary>
        /// 单号Id(转账单、付款订单、收款单、提现单)
        /// </summary>
        public static readonly FieldBase FId = new FieldBase(DbType.SqlServer, "[TM_WaterBill]", FieldType.Common, "[FId]");

        /// <summary>
        /// 流水号
        /// </summary>
        public static readonly FieldBase NCode = new FieldBase(DbType.SqlServer, "[TM_WaterBill]", FieldType.Common, "[NCode]");

        /// <summary>
        /// 交易金额
        /// </summary>
        public static readonly FieldBase WMney = new FieldBase(DbType.SqlServer, "[TM_WaterBill]", FieldType.Common, "[WMney]");

        /// <summary>
        /// 明细说明
        /// </summary>
        public static readonly FieldBase Details = new FieldBase(DbType.SqlServer, "[TM_WaterBill]", FieldType.Common, "[Details]");

        /// <summary>
        /// 备注说明
        /// </summary>
        public static readonly FieldBase Remarks = new FieldBase(DbType.SqlServer, "[TM_WaterBill]", FieldType.Common, "[Remarks]");

        /// <summary>
        /// 平台（什么银行，支付宝、等）
        /// </summary>
        public static readonly FieldBase Platform = new FieldBase(DbType.SqlServer, "[TM_WaterBill]", FieldType.Common, "[Platform]");

        /// <summary>
        /// 类型(转账10、付款20、收款30、提现40、退款50)
        /// </summary>
        public static readonly FieldBase BType = new FieldBase(DbType.SqlServer, "[TM_WaterBill]", FieldType.Common, "[BType]");

        /// <summary>
        /// 年
        /// </summary>
        public static readonly FieldBase Years = new FieldBase(DbType.SqlServer, "[TM_WaterBill]", FieldType.Common, "[Years]");

        /// <summary>
        /// 月
        /// </summary>
        public static readonly FieldBase Months = new FieldBase(DbType.SqlServer, "[TM_WaterBill]", FieldType.Common, "[Months]");

        /// <summary>
        /// 月日（xx-xx）
        /// </summary>
        public static readonly FieldBase Days = new FieldBase(DbType.SqlServer, "[TM_WaterBill]", FieldType.Common, "[Days]");

        /// <summary>
        /// 周几
        /// </summary>
        public static readonly FieldBase Weeks = new FieldBase(DbType.SqlServer, "[TM_WaterBill]", FieldType.Common, "[Weeks]");

        /// <summary>
        /// 图标地址
        /// </summary>
        public static readonly FieldBase ICons = new FieldBase(DbType.SqlServer, "[TM_WaterBill]", FieldType.Common, "[ICons]");

        /// <summary>
        /// 添加时间
        /// </summary>
        public static readonly FieldBase CreateTime = new FieldBase(DbType.SqlServer, "[TM_WaterBill]", FieldType.Common, "[CreateTime]");

        /// <summary>
        /// 是否删除
        /// </summary>
        public static readonly FieldBase isDeleted = new FieldBase(DbType.SqlServer, "[TM_WaterBill]", FieldType.Common, "[isDeleted]");
    }

}
