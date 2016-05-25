using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Moon.Orm;

namespace e3net.Mode.TireMoneyDB
{

    [Table("[TM_OrderItem]", DbType.SqlServer)]
    [TablesPrimaryKey(PrimaryKeyType.CustomerGUID, typeof(Guid), "ItemId")]
    public partial class TM_OrderItem : EntityBase
    {

        /// <summary>
        /// 主键
        /// </summary>
        public Guid ItemId
        {
            get { return GetPropertyValue<Guid>("ItemId"); }
            set { SetPropertyValue("ItemId", value); }
        }

        /// <summary>
        /// 订单Id
        /// </summary>
        public Guid OrderId
        {
            get { return GetPropertyValue<Guid>("OrderId"); }
            set { SetPropertyValue("OrderId", value); }
        }

        /// <summary>
        /// 商品Id
        /// </summary>
        public Guid ToId
        {
            get { return GetPropertyValue<Guid>("ToId"); }
            set { SetPropertyValue("ToId", value); }
        }

        /// <summary>
        /// 物品金额
        /// </summary>
        public Decimal? IMuney
        {
            get { return GetPropertyValue<Decimal?>("IMuney"); }
            set { SetPropertyValue("IMuney", value); }
        }

        /// <summary>
        /// 购买数量
        /// </summary>
        public Byte ICount
        {
            get { return GetPropertyValue<Byte>("ICount"); }
            set { SetPropertyValue("ICount", value); }
        }

        /// <summary>
        /// 状态(11关闭 12已退款 0 未付款 10已付款 20待发货 30待收货 50交易成功)
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

    [Table("[TM_OrderItem]", DbType.SqlServer)]
    public  partial class TM_OrderItemSet : MQLBase
    {
        public static  MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.SqlServer,"[TM_OrderItem]",fields);
        }
        public static  MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.SqlServer,"[TM_OrderItem]");
        }
        public static MQLBase SelectAllBut(params FieldBase[] fields)
        {
            return MQLBase.SelectAllBut(typeof(TM_OrderItemSet),DbType.SqlServer,"[TM_OrderItem]",fields);
        }

        /// <summary>
        /// 主键
        /// </summary>
        public static readonly FieldBase ItemId = new FieldBase(DbType.SqlServer, "[TM_OrderItem]", FieldType.OnlyPrimaryKey, "[ItemId]");

        /// <summary>
        /// 订单Id
        /// </summary>
        public static readonly FieldBase OrderId = new FieldBase(DbType.SqlServer, "[TM_OrderItem]", FieldType.Common, "[OrderId]");

        /// <summary>
        /// 商品Id
        /// </summary>
        public static readonly FieldBase ToId = new FieldBase(DbType.SqlServer, "[TM_OrderItem]", FieldType.Common, "[ToId]");

        /// <summary>
        /// 物品金额
        /// </summary>
        public static readonly FieldBase IMuney = new FieldBase(DbType.SqlServer, "[TM_OrderItem]", FieldType.Common, "[IMuney]");

        /// <summary>
        /// 购买数量
        /// </summary>
        public static readonly FieldBase ICount = new FieldBase(DbType.SqlServer, "[TM_OrderItem]", FieldType.Common, "[ICount]");

        /// <summary>
        /// 状态(11关闭 12已退款 0 未付款 10已付款 20待发货 30待收货 50交易成功)
        /// </summary>
        public static readonly FieldBase States = new FieldBase(DbType.SqlServer, "[TM_OrderItem]", FieldType.Common, "[States]");

        /// <summary>
        /// 是否删除
        /// </summary>
        public static readonly FieldBase isDeleted = new FieldBase(DbType.SqlServer, "[TM_OrderItem]", FieldType.Common, "[isDeleted]");
    }

}
