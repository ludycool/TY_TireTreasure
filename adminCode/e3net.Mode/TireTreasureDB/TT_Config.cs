using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Moon.Orm;

namespace e3net.Mode.TireTreasureDB
{

    [Table("[TT_Config]", DbType.SqlServer)]
    [TablesPrimaryKey(PrimaryKeyType.AutoIncrease, typeof(Int32), "CId")]
    public partial class TT_Config : EntityBase
    {

        /// <summary>
        /// 主键
        /// </summary>
        public Int32 CId
        {
            get { return GetPropertyValue<Int32>("CId"); }
            set { SetPropertyValue("CId", value); }
        }

        /// <summary>
        /// 类型
        /// </summary>
        public String CType
        {
            get { return GetPropertyValue<String>("CType"); }
            set { SetPropertyValue("CType", value); }
        }

        /// <summary>
        /// 名称
        /// </summary>
        public String CName
        {
            get { return GetPropertyValue<String>("CName"); }
            set { SetPropertyValue("CName", value); }
        }

        /// <summary>
        /// 值
        /// </summary>
        public String CValue
        {
            get { return GetPropertyValue<String>("CValue"); }
            set { SetPropertyValue("CValue", value); }
        }

        /// <summary>
        /// 排序
        /// </summary>
        public Int32? OrderID
        {
            get { return GetPropertyValue<Int32?>("OrderID"); }
            set { SetPropertyValue("OrderID", value); }
        }

        /// <summary>
        /// 备注
        /// </summary>
        public String Remark
        {
            get { return GetPropertyValue<String>("Remark"); }
            set { SetPropertyValue("Remark", value); }
        }

        /// <summary>
        /// 添加时间
        /// </summary>
        public DateTime? UpdateTime
        {
            get { return GetPropertyValue<DateTime?>("UpdateTime"); }
            set { SetPropertyValue("UpdateTime", value); }
        }

        /// <summary>
        /// 添加人
        /// </summary>
        public String CreateMan
        {
            get { return GetPropertyValue<String>("CreateMan"); }
            set { SetPropertyValue("CreateMan", value); }
        }

        /// <summary>
        /// 是否有效
        /// </summary>
        public Boolean? isValid
        {
            get { return GetPropertyValue<Boolean?>("isValid"); }
            set { SetPropertyValue("isValid", value); }
        }
    }

    [Table("[TT_Config]", DbType.SqlServer)]
    public  partial class TT_ConfigSet : MQLBase
    {
        public static  MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.SqlServer,"[TT_Config]",fields);
        }
        public static  MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.SqlServer,"[TT_Config]");
        }
        public static MQLBase SelectAllBut(params FieldBase[] fields)
        {
            return MQLBase.SelectAllBut(typeof(TT_ConfigSet),DbType.SqlServer,"[TT_Config]",fields);
        }

        /// <summary>
        /// 主键
        /// </summary>
        public static readonly FieldBase CId = new FieldBase(DbType.SqlServer, "[TT_Config]", FieldType.OnlyPrimaryKey, "[CId]");

        /// <summary>
        /// 类型
        /// </summary>
        public static readonly FieldBase CType = new FieldBase(DbType.SqlServer, "[TT_Config]", FieldType.Common, "[CType]");

        /// <summary>
        /// 名称
        /// </summary>
        public static readonly FieldBase CName = new FieldBase(DbType.SqlServer, "[TT_Config]", FieldType.Common, "[CName]");

        /// <summary>
        /// 值
        /// </summary>
        public static readonly FieldBase CValue = new FieldBase(DbType.SqlServer, "[TT_Config]", FieldType.Common, "[CValue]");

        /// <summary>
        /// 排序
        /// </summary>
        public static readonly FieldBase OrderID = new FieldBase(DbType.SqlServer, "[TT_Config]", FieldType.Common, "[OrderID]");

        /// <summary>
        /// 备注
        /// </summary>
        public static readonly FieldBase Remark = new FieldBase(DbType.SqlServer, "[TT_Config]", FieldType.Common, "[Remark]");

        /// <summary>
        /// 添加时间
        /// </summary>
        public static readonly FieldBase UpdateTime = new FieldBase(DbType.SqlServer, "[TT_Config]", FieldType.Common, "[UpdateTime]");

        /// <summary>
        /// 添加人
        /// </summary>
        public static readonly FieldBase CreateMan = new FieldBase(DbType.SqlServer, "[TT_Config]", FieldType.Common, "[CreateMan]");

        /// <summary>
        /// 是否有效
        /// </summary>
        public static readonly FieldBase isValid = new FieldBase(DbType.SqlServer, "[TT_Config]", FieldType.Common, "[isValid]");
    }

}
