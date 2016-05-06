using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Moon.Orm;

namespace e3net.Mode.TireTreasureDB
{

    [Table("[TT_Reservation]", DbType.SqlServer)]
    [TablesPrimaryKey(PrimaryKeyType.CustomerGUID, typeof(Guid), "ReservationId")]
    public partial class TT_Reservation : EntityBase
    {

        /// <summary>
        /// 主键
        /// </summary>
        public Guid ReservationId
        {
            get { return GetPropertyValue<Guid>("ReservationId"); }
            set { SetPropertyValue("ReservationId", value); }
        }

        /// <summary>
        /// 物品(服务Id)
        /// </summary>
        public Guid TransactionId
        {
            get { return GetPropertyValue<Guid>("TransactionId"); }
            set { SetPropertyValue("TransactionId", value); }
        }

        /// <summary>
        /// 店面Id
        /// </summary>
        public Guid? ShopId
        {
            get { return GetPropertyValue<Guid?>("ShopId"); }
            set { SetPropertyValue("ShopId", value); }
        }

        /// <summary>
        /// 预约说明
        /// </summary>
        public String Explain
        {
            get { return GetPropertyValue<String>("Explain"); }
            set { SetPropertyValue("Explain", value); }
        }

        /// <summary>
        /// 订单Id
        /// </summary>
        public Guid? OrderId
        {
            get { return GetPropertyValue<Guid?>("OrderId"); }
            set { SetPropertyValue("OrderId", value); }
        }

        /// <summary>
        /// 预约已交付金额（预留）
        /// </summary>
        public Decimal? RMney
        {
            get { return GetPropertyValue<Decimal?>("RMney"); }
            set { SetPropertyValue("RMney", value); }
        }

        /// <summary>
        /// 类型（会员预约、消费预约）
        /// </summary>
        public Byte Types
        {
            get { return GetPropertyValue<Byte>("Types"); }
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
        /// 预约时间
        /// </summary>
        public DateTime? ReserTime
        {
            get { return GetPropertyValue<DateTime?>("ReserTime"); }
            set { SetPropertyValue("ReserTime", value); }
        }

        /// <summary>
        /// 状态（已完成1，预约中0，关闭-1）
        /// </summary>
        public Int32? States
        {
            get { return GetPropertyValue<Int32?>("States"); }
            set { SetPropertyValue("States", value); }
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

    [Table("[TT_Reservation]", DbType.SqlServer)]
    public  partial class TT_ReservationSet : MQLBase
    {
        public static  MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.SqlServer,"[TT_Reservation]",fields);
        }
        public static  MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.SqlServer,"[TT_Reservation]");
        }
        public static MQLBase SelectAllBut(params FieldBase[] fields)
        {
            return MQLBase.SelectAllBut(typeof(TT_ReservationSet),DbType.SqlServer,"[TT_Reservation]",fields);
        }

        /// <summary>
        /// 主键
        /// </summary>
        public static readonly FieldBase ReservationId = new FieldBase(DbType.SqlServer, "[TT_Reservation]", FieldType.OnlyPrimaryKey, "[ReservationId]");

        /// <summary>
        /// 物品(服务Id)
        /// </summary>
        public static readonly FieldBase TransactionId = new FieldBase(DbType.SqlServer, "[TT_Reservation]", FieldType.Common, "[TransactionId]");

        /// <summary>
        /// 店面Id
        /// </summary>
        public static readonly FieldBase ShopId = new FieldBase(DbType.SqlServer, "[TT_Reservation]", FieldType.Common, "[ShopId]");

        /// <summary>
        /// 预约说明
        /// </summary>
        public static readonly FieldBase Explain = new FieldBase(DbType.SqlServer, "[TT_Reservation]", FieldType.Common, "[Explain]");

        /// <summary>
        /// 订单Id
        /// </summary>
        public static readonly FieldBase OrderId = new FieldBase(DbType.SqlServer, "[TT_Reservation]", FieldType.Common, "[OrderId]");

        /// <summary>
        /// 预约已交付金额（预留）
        /// </summary>
        public static readonly FieldBase RMney = new FieldBase(DbType.SqlServer, "[TT_Reservation]", FieldType.Common, "[RMney]");

        /// <summary>
        /// 类型（会员预约、消费预约）
        /// </summary>
        public static readonly FieldBase Types = new FieldBase(DbType.SqlServer, "[TT_Reservation]", FieldType.Common, "[Types]");

        /// <summary>
        /// 添加时间
        /// </summary>
        public static readonly FieldBase CreateTime = new FieldBase(DbType.SqlServer, "[TT_Reservation]", FieldType.Common, "[CreateTime]");

        /// <summary>
        /// 预约时间
        /// </summary>
        public static readonly FieldBase ReserTime = new FieldBase(DbType.SqlServer, "[TT_Reservation]", FieldType.Common, "[ReserTime]");

        /// <summary>
        /// 状态（已完成1，预约中0，关闭-1）
        /// </summary>
        public static readonly FieldBase States = new FieldBase(DbType.SqlServer, "[TT_Reservation]", FieldType.Common, "[States]");

        /// <summary>
        /// 是否有效
        /// </summary>
        public static readonly FieldBase isValid = new FieldBase(DbType.SqlServer, "[TT_Reservation]", FieldType.Common, "[isValid]");

        /// <summary>
        /// 是否删除
        /// </summary>
        public static readonly FieldBase isDeleted = new FieldBase(DbType.SqlServer, "[TT_Reservation]", FieldType.Common, "[isDeleted]");
    }

}
