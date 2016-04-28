using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Moon.Orm;

namespace e3net.Mode.TireTreasureBaseDB
{

    [Table("[Sys_Dictionary]", DbType.SqlServer)]
    [TablesPrimaryKey(PrimaryKeyType.AutoIncrease, typeof(Int32), "DicId")]
    public partial class Sys_Dictionary : EntityBase
    {

        /// <summary>
        /// 字典主键
        /// </summary>
        public Int32 DicId
        {
            get { return GetPropertyValue<Int32>("DicId"); }
            set { SetPropertyValue("DicId", value); }
        }

        /// <summary>
        /// 字典编号
        /// </summary>
        public Int32? DicTypeId
        {
            get { return GetPropertyValue<Int32?>("DicTypeId"); }
            set { SetPropertyValue("DicTypeId", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public Int32? ParentId
        {
            get { return GetPropertyValue<Int32?>("ParentId"); }
            set { SetPropertyValue("ParentId", value); }
        }

        /// <summary>
        /// 字典名称
        /// </summary>
        public String DicName
        {
            get { return GetPropertyValue<String>("DicName"); }
            set { SetPropertyValue("DicName", value); }
        }

        /// <summary>
        /// 字典编号
        /// </summary>
        public String DicNo
        {
            get { return GetPropertyValue<String>("DicNo"); }
            set { SetPropertyValue("DicNo", value); }
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

    [Table("[Sys_Dictionary]", DbType.SqlServer)]
    public  partial class Sys_DictionarySet : MQLBase
    {
        public static  MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.SqlServer,"[Sys_Dictionary]",fields);
        }
        public static  MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.SqlServer,"[Sys_Dictionary]");
        }
        public static MQLBase SelectAllBut(params FieldBase[] fields)
        {
            return MQLBase.SelectAllBut(typeof(Sys_DictionarySet),DbType.SqlServer,"[Sys_Dictionary]",fields);
        }

        /// <summary>
        /// 字典主键
        /// </summary>
        public static readonly FieldBase DicId = new FieldBase(DbType.SqlServer, "[Sys_Dictionary]", FieldType.OnlyPrimaryKey, "[DicId]");

        /// <summary>
        /// 字典编号
        /// </summary>
        public static readonly FieldBase DicTypeId = new FieldBase(DbType.SqlServer, "[Sys_Dictionary]", FieldType.Common, "[DicTypeId]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase ParentId = new FieldBase(DbType.SqlServer, "[Sys_Dictionary]", FieldType.Common, "[ParentId]");

        /// <summary>
        /// 字典名称
        /// </summary>
        public static readonly FieldBase DicName = new FieldBase(DbType.SqlServer, "[Sys_Dictionary]", FieldType.Common, "[DicName]");

        /// <summary>
        /// 字典编号
        /// </summary>
        public static readonly FieldBase DicNo = new FieldBase(DbType.SqlServer, "[Sys_Dictionary]", FieldType.Common, "[DicNo]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase Icon = new FieldBase(DbType.SqlServer, "[Sys_Dictionary]", FieldType.Common, "[Icon]");

        /// <summary>
        /// 状态
        /// </summary>
        public static readonly FieldBase Remarks = new FieldBase(DbType.SqlServer, "[Sys_Dictionary]", FieldType.Common, "[Remarks]");

        /// <summary>
        /// 序号
        /// </summary>
        public static readonly FieldBase OrderId = new FieldBase(DbType.SqlServer, "[Sys_Dictionary]", FieldType.Common, "[OrderId]");

        /// <summary>
        /// 添加时间
        /// </summary>
        public static readonly FieldBase CreateTime = new FieldBase(DbType.SqlServer, "[Sys_Dictionary]", FieldType.Common, "[CreateTime]");

        /// <summary>
        /// 是否有效
        /// </summary>
        public static readonly FieldBase isValid = new FieldBase(DbType.SqlServer, "[Sys_Dictionary]", FieldType.Common, "[isValid]");

        /// <summary>
        /// 是否删除
        /// </summary>
        public static readonly FieldBase isDeleted = new FieldBase(DbType.SqlServer, "[Sys_Dictionary]", FieldType.Common, "[isDeleted]");
    }

}
