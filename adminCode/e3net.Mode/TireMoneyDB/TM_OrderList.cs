using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Moon.Orm;

namespace e3net.Mode.TireMoneyDB
{

    [Table("[TM_OrderList]", DbType.SqlServer)]
    [TablesPrimaryKey(PrimaryKeyType.CustomerGUID, typeof(Guid), "OiId")]
    public partial class TM_OrderList : EntityBase
    {

        /// <summary>
        /// 主键
        /// </summary>
        public Guid OiId
        {
            get { return GetPropertyValue<Guid>("OiId"); }
            set { SetPropertyValue("OiId", value); }
        }

        /// <summary>
        /// 用户Id(付款方)
        /// </summary>
        public Guid UOId
        {
            get { return GetPropertyValue<Guid>("UOId"); }
            set { SetPropertyValue("UOId", value); }
        }

        /// <summary>
        /// 店铺Id(或者卖方用户Id)
        /// </summary>
        public Guid? SOId
        {
            get { return GetPropertyValue<Guid?>("SOId"); }
            set { SetPropertyValue("SOId", value); }
        }

        /// <summary>
        /// 订单编号
        /// </summary>
        public String NCode
        {
            get { return GetPropertyValue<String>("NCode"); }
            set { SetPropertyValue("NCode", value); }
        }

        /// <summary>
        /// 交易金额
        /// </summary>
        public Decimal? OMuney
        {
            get { return GetPropertyValue<Decimal?>("OMuney"); }
            set { SetPropertyValue("OMuney", value); }
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
        /// 提供消费类型（10个人 20 店铺）
        /// </summary>
        public Byte SaleType
        {
            get { return GetPropertyValue<Byte>("SaleType"); }
            set { SetPropertyValue("SaleType", value); }
        }

        /// <summary>
        /// 状态(-1关闭 0 未付款 10已付款 20待发货 30待收货 50交易成功)
        /// </summary>
        public Byte States
        {
            get { return GetPropertyValue<Byte>("States"); }
            set { SetPropertyValue("States", value); }
        }

        /// <summary>
        /// 付款方式(10账户、20支付宝、30微信、40银联)
        /// </summary>
        public Byte PayType
        {
            get { return GetPropertyValue<Byte>("PayType"); }
            set { SetPropertyValue("PayType", value); }
        }

        /// <summary>
        /// 下单时间
        /// </summary>
        public DateTime? CreateTime
        {
            get { return GetPropertyValue<DateTime?>("CreateTime"); }
            set { SetPropertyValue("CreateTime", value); }
        }

        /// <summary>
        /// 付款时间
        /// </summary>
        public DateTime? PayTime
        {
            get { return GetPropertyValue<DateTime?>("PayTime"); }
            set { SetPropertyValue("PayTime", value); }
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

    [Table("[TM_OrderList]", DbType.SqlServer)]
    public  partial class TM_OrderListSet : MQLBase
    {
        public static  MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.SqlServer,"[TM_OrderList]",fields);
        }
        public static  MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.SqlServer,"[TM_OrderList]");
        }
        public static MQLBase SelectAllBut(params FieldBase[] fields)
        {
            return MQLBase.SelectAllBut(typeof(TM_OrderListSet),DbType.SqlServer,"[TM_OrderList]",fields);
        }

        /// <summary>
        /// 主键
        /// </summary>
        public static readonly FieldBase OiId = new FieldBase(DbType.SqlServer, "[TM_OrderList]", FieldType.OnlyPrimaryKey, "[OiId]");

        /// <summary>
        /// 用户Id(付款方)
        /// </summary>
        public static readonly FieldBase UOId = new FieldBase(DbType.SqlServer, "[TM_OrderList]", FieldType.Common, "[UOId]");

        /// <summary>
        /// 店铺Id(或者卖方用户Id)
        /// </summary>
        public static readonly FieldBase SOId = new FieldBase(DbType.SqlServer, "[TM_OrderList]", FieldType.Common, "[SOId]");

        /// <summary>
        /// 订单编号
        /// </summary>
        public static readonly FieldBase NCode = new FieldBase(DbType.SqlServer, "[TM_OrderList]", FieldType.Common, "[NCode]");

        /// <summary>
        /// 交易金额
        /// </summary>
        public static readonly FieldBase OMuney = new FieldBase(DbType.SqlServer, "[TM_OrderList]", FieldType.Common, "[OMuney]");

        /// <summary>
        /// 备注说明
        /// </summary>
        public static readonly FieldBase Remarks = new FieldBase(DbType.SqlServer, "[TM_OrderList]", FieldType.Common, "[Remarks]");

        /// <summary>
        /// 提供消费类型（10个人 20 店铺）
        /// </summary>
        public static readonly FieldBase SaleType = new FieldBase(DbType.SqlServer, "[TM_OrderList]", FieldType.Common, "[SaleType]");

        /// <summary>
        /// 状态(-1关闭 0 未付款 10已付款 20待发货 30待收货 50交易成功)
        /// </summary>
        public static readonly FieldBase States = new FieldBase(DbType.SqlServer, "[TM_OrderList]", FieldType.Common, "[States]");

        /// <summary>
        /// 付款方式(10账户、20支付宝、30微信、40银联)
        /// </summary>
        public static readonly FieldBase PayType = new FieldBase(DbType.SqlServer, "[TM_OrderList]", FieldType.Common, "[PayType]");

        /// <summary>
        /// 下单时间
        /// </summary>
        public static readonly FieldBase CreateTime = new FieldBase(DbType.SqlServer, "[TM_OrderList]", FieldType.Common, "[CreateTime]");

        /// <summary>
        /// 付款时间
        /// </summary>
        public static readonly FieldBase PayTime = new FieldBase(DbType.SqlServer, "[TM_OrderList]", FieldType.Common, "[PayTime]");

        /// <summary>
        /// 是否删除
        /// </summary>
        public static readonly FieldBase isDeleted = new FieldBase(DbType.SqlServer, "[TM_OrderList]", FieldType.Common, "[isDeleted]");
    }

}
