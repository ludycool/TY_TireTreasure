using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Moon.Orm;

namespace e3net.Mode.TireTreasureDB
{

    [Table("[TT_InsuranIterm]", DbType.SqlServer)]
    [TablesPrimaryKey(PrimaryKeyType.AutoIncrease, typeof(Int64), "InsuranItermId")]
    public partial class TT_InsuranIterm : EntityBase
    {

        /// <summary>
        /// 主键
        /// </summary>
        public Int64 InsuranItermId
        {
            get { return GetPropertyValue<Int64>("InsuranItermId"); }
            set { SetPropertyValue("InsuranItermId", value); }
        }

        /// <summary>
        /// 保险单Id
        /// </summary>
        public Guid InsuranId
        {
            get { return GetPropertyValue<Guid>("InsuranId"); }
            set { SetPropertyValue("InsuranId", value); }
        }

        /// <summary>
        /// 保险项Id
        /// </summary>
        public Int32? ItermSeelId
        {
            get { return GetPropertyValue<Int32?>("ItermSeelId"); }
            set { SetPropertyValue("ItermSeelId", value); }
        }

        /// <summary>
        /// 金额
        /// </summary>
        public Decimal? itemCost
        {
            get { return GetPropertyValue<Decimal?>("itemCost"); }
            set { SetPropertyValue("itemCost", value); }
        }
    }

    [Table("[TT_InsuranIterm]", DbType.SqlServer)]
    public  partial class TT_InsuranItermSet : MQLBase
    {
        public static  MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.SqlServer,"[TT_InsuranIterm]",fields);
        }
        public static  MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.SqlServer,"[TT_InsuranIterm]");
        }
        public static MQLBase SelectAllBut(params FieldBase[] fields)
        {
            return MQLBase.SelectAllBut(typeof(TT_InsuranItermSet),DbType.SqlServer,"[TT_InsuranIterm]",fields);
        }

        /// <summary>
        /// 主键
        /// </summary>
        public static readonly FieldBase InsuranItermId = new FieldBase(DbType.SqlServer, "[TT_InsuranIterm]", FieldType.OnlyPrimaryKey, "[InsuranItermId]");

        /// <summary>
        /// 保险单Id
        /// </summary>
        public static readonly FieldBase InsuranId = new FieldBase(DbType.SqlServer, "[TT_InsuranIterm]", FieldType.Common, "[InsuranId]");

        /// <summary>
        /// 保险项Id
        /// </summary>
        public static readonly FieldBase ItermSeelId = new FieldBase(DbType.SqlServer, "[TT_InsuranIterm]", FieldType.Common, "[ItermSeelId]");

        /// <summary>
        /// 金额
        /// </summary>
        public static readonly FieldBase itemCost = new FieldBase(DbType.SqlServer, "[TT_InsuranIterm]", FieldType.Common, "[itemCost]");
    }

}
