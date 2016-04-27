using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Moon.Orm;

namespace e3net.Mode.TireTreasureBaseDB
{

    [Table("[Sys_DicType]", DbType.SqlServer)]
    [TablesPrimaryKey(PrimaryKeyType.AutoIncrease, typeof(Int32), "DicTypeId")]
    public partial class Sys_DicType : EntityBase
    {

        /// <summary>
        /// 字典主键
        /// </summary>
        public Int32 DicTypeId
        {
            get { return GetPropertyValue<Int32>("DicTypeId"); }
            set { SetPropertyValue("DicTypeId", value); }
        }

        /// <summary>
        /// 字典名称
        /// </summary>
        public String DicTypeName
        {
            get { return GetPropertyValue<String>("DicTypeName"); }
            set { SetPropertyValue("DicTypeName", value); }
        }

        /// <summary>
        /// 字典编号
        /// </summary>
        public String DicTypeNum
        {
            get { return GetPropertyValue<String>("DicTypeNum"); }
            set { SetPropertyValue("DicTypeNum", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public String Icon
        {
            get { return GetPropertyValue<String>("Icon"); }
            set { SetPropertyValue("Icon", value); }
        }

        /// <summary>
        /// 状态
        /// </summary>
        public String Remarks
        {
            get { return GetPropertyValue<String>("Remarks"); }
            set { SetPropertyValue("Remarks", value); }
        }

        /// <summary>
        /// 序号
        /// </summary>
        public Int32? OrderId
        {
            get { return GetPropertyValue<Int32?>("OrderId"); }
            set { SetPropertyValue("OrderId", value); }
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

    [Table("[Sys_DicType]", DbType.SqlServer)]
    public  partial class Sys_DicTypeSet : MQLBase
    {
        public static new MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.SqlServer,"[Sys_DicType]",fields);
        }
        public static new MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.SqlServer,"[Sys_DicType]");
        }

        /// <summary>
        /// 字典主键
        /// </summary>
        public static readonly FieldBase DicTypeId = new FieldBase(DbType.SqlServer, "[Sys_DicType]", FieldType.OnlyPrimaryKey, "[DicTypeId]");

        /// <summary>
        /// 字典名称
        /// </summary>
        public static readonly FieldBase DicTypeName = new FieldBase(DbType.SqlServer, "[Sys_DicType]", FieldType.Common, "[DicTypeName]");

        /// <summary>
        /// 字典编号
        /// </summary>
        public static readonly FieldBase DicTypeNum = new FieldBase(DbType.SqlServer, "[Sys_DicType]", FieldType.Common, "[DicTypeNum]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase Icon = new FieldBase(DbType.SqlServer, "[Sys_DicType]", FieldType.Common, "[Icon]");

        /// <summary>
        /// 状态
        /// </summary>
        public static readonly FieldBase Remarks = new FieldBase(DbType.SqlServer, "[Sys_DicType]", FieldType.Common, "[Remarks]");

        /// <summary>
        /// 序号
        /// </summary>
        public static readonly FieldBase OrderId = new FieldBase(DbType.SqlServer, "[Sys_DicType]", FieldType.Common, "[OrderId]");

        /// <summary>
        /// 添加时间
        /// </summary>
        public static readonly FieldBase CreateTime = new FieldBase(DbType.SqlServer, "[Sys_DicType]", FieldType.Common, "[CreateTime]");

        /// <summary>
        /// 是否有效
        /// </summary>
        public static readonly FieldBase isValid = new FieldBase(DbType.SqlServer, "[Sys_DicType]", FieldType.Common, "[isValid]");

        /// <summary>
        /// 是否删除
        /// </summary>
        public static readonly FieldBase isDeleted = new FieldBase(DbType.SqlServer, "[Sys_DicType]", FieldType.Common, "[isDeleted]");
    }

}
