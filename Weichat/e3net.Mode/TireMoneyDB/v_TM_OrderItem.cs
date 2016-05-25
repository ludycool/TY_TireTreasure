using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Moon.Orm;

namespace e3net.Mode.TireMoneyDB
{

    [Table("[v_TM_OrderItem]", DbType.SqlServer)]

    public partial class v_TM_OrderItem : EntityBase
    {

        /// <summary>
        /// 
        /// </summary>
        public Guid ItemId
        {
            get { return GetPropertyValue<Guid>("ItemId"); }
            set { SetPropertyValue("ItemId", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public Guid OrderId
        {
            get { return GetPropertyValue<Guid>("OrderId"); }
            set { SetPropertyValue("OrderId", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public Guid ToId
        {
            get { return GetPropertyValue<Guid>("ToId"); }
            set { SetPropertyValue("ToId", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public Decimal? IMuney
        {
            get { return GetPropertyValue<Decimal?>("IMuney"); }
            set { SetPropertyValue("IMuney", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public Byte States
        {
            get { return GetPropertyValue<Byte>("States"); }
            set { SetPropertyValue("States", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public Boolean? isDeleted
        {
            get { return GetPropertyValue<Boolean?>("isDeleted"); }
            set { SetPropertyValue("isDeleted", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public String NCode
        {
            get { return GetPropertyValue<String>("NCode"); }
            set { SetPropertyValue("NCode", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public Byte OrderListState
        {
            get { return GetPropertyValue<Byte>("OrderListState"); }
            set { SetPropertyValue("OrderListState", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public Decimal? OMuney
        {
            get { return GetPropertyValue<Decimal?>("OMuney"); }
            set { SetPropertyValue("OMuney", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public String Title
        {
            get { return GetPropertyValue<String>("Title"); }
            set { SetPropertyValue("Title", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public String ImageUrl
        {
            get { return GetPropertyValue<String>("ImageUrl"); }
            set { SetPropertyValue("ImageUrl", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public Guid? ShopId
        {
            get { return GetPropertyValue<Guid?>("ShopId"); }
            set { SetPropertyValue("ShopId", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public Byte ICount
        {
            get { return GetPropertyValue<Byte>("ICount"); }
            set { SetPropertyValue("ICount", value); }
        }
    }

    [Table("[v_TM_OrderItem]", DbType.SqlServer)]
    public  partial class v_TM_OrderItemSet : MQLBase
    {
        public static  MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.SqlServer,"[v_TM_OrderItem]",fields);
        }
        public static  MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.SqlServer,"[v_TM_OrderItem]");
        }
        public static MQLBase SelectAllBut(params FieldBase[] fields)
        {
            return MQLBase.SelectAllBut(typeof(v_TM_OrderItemSet),DbType.SqlServer,"[v_TM_OrderItem]",fields);
        }

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase ItemId = new FieldBase(DbType.SqlServer, "[v_TM_OrderItem]", FieldType.Common, "[ItemId]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase OrderId = new FieldBase(DbType.SqlServer, "[v_TM_OrderItem]", FieldType.Common, "[OrderId]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase ToId = new FieldBase(DbType.SqlServer, "[v_TM_OrderItem]", FieldType.Common, "[ToId]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase IMuney = new FieldBase(DbType.SqlServer, "[v_TM_OrderItem]", FieldType.Common, "[IMuney]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase States = new FieldBase(DbType.SqlServer, "[v_TM_OrderItem]", FieldType.Common, "[States]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase isDeleted = new FieldBase(DbType.SqlServer, "[v_TM_OrderItem]", FieldType.Common, "[isDeleted]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase NCode = new FieldBase(DbType.SqlServer, "[v_TM_OrderItem]", FieldType.Common, "[NCode]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase OrderListState = new FieldBase(DbType.SqlServer, "[v_TM_OrderItem]", FieldType.Common, "[OrderListState]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase OMuney = new FieldBase(DbType.SqlServer, "[v_TM_OrderItem]", FieldType.Common, "[OMuney]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase Title = new FieldBase(DbType.SqlServer, "[v_TM_OrderItem]", FieldType.Common, "[Title]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase ImageUrl = new FieldBase(DbType.SqlServer, "[v_TM_OrderItem]", FieldType.Common, "[ImageUrl]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase ShopId = new FieldBase(DbType.SqlServer, "[v_TM_OrderItem]", FieldType.Common, "[ShopId]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase ICount = new FieldBase(DbType.SqlServer, "[v_TM_OrderItem]", FieldType.Common, "[ICount]");
    }

}
