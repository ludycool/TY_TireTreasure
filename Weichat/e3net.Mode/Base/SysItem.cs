using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Moon.Orm;

namespace e3net.Mode.Base
{

    [Table("[SysItem]", DbType.SqlServer)]
    [TablesPrimaryKey(PrimaryKeyType.AutoIncrease, typeof(Int32), "ItemID")]
    public partial class SysItem : EntityBase
    {

        /// <summary>
        /// 主键
        /// </summary>
        public Int32 ItemID
        {
            get { return GetPropertyValue<Int32>("ItemID"); }
            set { SetPropertyValue("ItemID", value); }
        }

        /// <summary>
        /// 类型
        /// </summary>
        public String ItemType
        {
            get { return GetPropertyValue<String>("ItemType"); }
            set { SetPropertyValue("ItemType", value); }
        }

        /// <summary>
        /// 值
        /// </summary>
        public String ItemValue
        {
            get { return GetPropertyValue<String>("ItemValue"); }
            set { SetPropertyValue("ItemValue", value); }
        }

        /// <summary>
        /// 名称
        /// </summary>
        public String ItemName
        {
            get { return GetPropertyValue<String>("ItemName"); }
            set { SetPropertyValue("ItemName", value); }
        }

        /// <summary>
        /// Icon
        /// </summary>
        public String Icon
        {
            get { return GetPropertyValue<String>("Icon"); }
            set { SetPropertyValue("Icon", value); }
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
        public String CreateTime
        {
            get { return GetPropertyValue<String>("CreateTime"); }
            set { SetPropertyValue("CreateTime", value); }
        }

        /// <summary>
        /// CreateMan
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

        /// <summary>
        /// 是否删除
        /// </summary>
        public Boolean? isDeleted
        {
            get { return GetPropertyValue<Boolean?>("isDeleted"); }
            set { SetPropertyValue("isDeleted", value); }
        }
    }

    [Table("[SysItem]", DbType.SqlServer)]
    public  partial class SysItemSet : MQLBase
    {
        public static  MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.SqlServer,"[SysItem]",fields);
        }
        public static  MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.SqlServer,"[SysItem]");
        }
        public static MQLBase SelectAllBut(params FieldBase[] fields)
        {
            return MQLBase.SelectAllBut(typeof(SysItemSet),DbType.SqlServer,"[SysItem]",fields);
        }

        /// <summary>
        /// 主键
        /// </summary>
        public static readonly FieldBase ItemID = new FieldBase(DbType.SqlServer, "[SysItem]", FieldType.OnlyPrimaryKey, "[ItemID]");

        /// <summary>
        /// 类型
        /// </summary>
        public static readonly FieldBase ItemType = new FieldBase(DbType.SqlServer, "[SysItem]", FieldType.Common, "[ItemType]");

        /// <summary>
        /// 值
        /// </summary>
        public static readonly FieldBase ItemValue = new FieldBase(DbType.SqlServer, "[SysItem]", FieldType.Common, "[ItemValue]");

        /// <summary>
        /// 名称
        /// </summary>
        public static readonly FieldBase ItemName = new FieldBase(DbType.SqlServer, "[SysItem]", FieldType.Common, "[ItemName]");

        /// <summary>
        /// Icon
        /// </summary>
        public static readonly FieldBase Icon = new FieldBase(DbType.SqlServer, "[SysItem]", FieldType.Common, "[Icon]");

        /// <summary>
        /// 排序
        /// </summary>
        public static readonly FieldBase OrderID = new FieldBase(DbType.SqlServer, "[SysItem]", FieldType.Common, "[OrderID]");

        /// <summary>
        /// 备注
        /// </summary>
        public static readonly FieldBase Remark = new FieldBase(DbType.SqlServer, "[SysItem]", FieldType.Common, "[Remark]");

        /// <summary>
        /// 添加时间
        /// </summary>
        public static readonly FieldBase CreateTime = new FieldBase(DbType.SqlServer, "[SysItem]", FieldType.Common, "[CreateTime]");

        /// <summary>
        /// CreateMan
        /// </summary>
        public static readonly FieldBase CreateMan = new FieldBase(DbType.SqlServer, "[SysItem]", FieldType.Common, "[CreateMan]");

        /// <summary>
        /// 是否有效
        /// </summary>
        public static readonly FieldBase isValid = new FieldBase(DbType.SqlServer, "[SysItem]", FieldType.Common, "[isValid]");

        /// <summary>
        /// 是否删除
        /// </summary>
        public static readonly FieldBase isDeleted = new FieldBase(DbType.SqlServer, "[SysItem]", FieldType.Common, "[isDeleted]");
    }

}
