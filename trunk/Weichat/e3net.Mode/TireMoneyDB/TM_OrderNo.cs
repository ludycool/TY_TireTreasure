using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Moon.Orm;

namespace e3net.Mode.TireMoneyDB
{

    [Table("[TM_OrderNo]", DbType.SqlServer)]
    public partial class TM_OrderNoSet : MQLBase
    {
        public static MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.SqlServer, "[TM_OrderNo]", fields);
        }
        public static MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.SqlServer, "[TM_OrderNo]");
        }
        public static MQLBase SelectAllBut(params FieldBase[] fields)
        {
            return MQLBase.SelectAllBut(typeof(TM_OrderNoSet), DbType.SqlServer, "[TM_OrderNo]", fields);
        }

        /// <summary>
        /// 主键
        /// </summary>
        public static readonly FieldBase Id = new FieldBase(DbType.SqlServer, "[TM_OrderNo]", FieldType.OnlyPrimaryKey, "[Id]");

        /// <summary>
        /// 编号
        /// </summary>
        public static readonly FieldBase NCode = new FieldBase(DbType.SqlServer, "[TM_OrderNo]", FieldType.Common, "[NCode]");

        /// <summary>
        /// 类型
        /// </summary>
        public static readonly FieldBase Types = new FieldBase(DbType.SqlServer, "[TM_OrderNo]", FieldType.Common, "[Types]");
    }


    [Table("[TM_OrderNo]", DbType.SqlServer)]
    [TablesPrimaryKey(PrimaryKeyType.AutoIncrease, typeof(Int64), "Id")]
    public partial class TM_OrderNo : EntityBase
    {

        /// <summary>
        /// 主键
        /// </summary>
        public Int64 Id
        {
            get
            {
                return GetPropertyValue<Int64>("Id");
            }
            set
            {
                SetPropertyValue("Id", value);
            }
        }

        /// <summary>
        /// 编号
        /// </summary>
        public String NCode
        {
            get
            {
                return GetPropertyValue<String>("NCode");
            }
            set
            {
                SetPropertyValue("NCode", value);
            }
        }

        /// <summary>
        /// 类型
        /// </summary>
        public String Types
        {
            get
            {
                return GetPropertyValue<String>("Types");
            }
            set
            {
                SetPropertyValue("Types", value);
            }
        }
    }
}
