using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Moon.Orm;

namespace e3net.Mode.TireTreasureBaseDB
{

    [Table("[Sys_CityArea]", DbType.SqlServer)]
    [TablesPrimaryKey(PrimaryKeyType.AutoIncrease, typeof(Int32), "CityAreaId")]
    public partial class Sys_CityArea : EntityBase
    {

        /// <summary>
        /// 主键
        /// </summary>
        public Int32 CityAreaId
        {
            get { return GetPropertyValue<Int32>("CityAreaId"); }
            set { SetPropertyValue("CityAreaId", value); }
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
        /// 排序
        /// </summary>
        public Int32? OrderNo
        {
            get { return GetPropertyValue<Int32?>("OrderNo"); }
            set { SetPropertyValue("OrderNo", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public String TName
        {
            get { return GetPropertyValue<String>("TName"); }
            set { SetPropertyValue("TName", value); }
        }

        /// <summary>
        /// 登录名
        /// </summary>
        public String TCode
        {
            get { return GetPropertyValue<String>("TCode"); }
            set { SetPropertyValue("TCode", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public Int32? AreaTypes
        {
            get { return GetPropertyValue<Int32?>("AreaTypes"); }
            set { SetPropertyValue("AreaTypes", value); }
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
        /// 详情
        /// </summary>
        public String Remarks
        {
            get { return GetPropertyValue<String>("Remarks"); }
            set { SetPropertyValue("Remarks", value); }
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
        /// 修改时间
        /// </summary>
        public DateTime? UpdateTime
        {
            get { return GetPropertyValue<DateTime?>("UpdateTime"); }
            set { SetPropertyValue("UpdateTime", value); }
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

    [Table("[Sys_CityArea]", DbType.SqlServer)]
    public  partial class Sys_CityAreaSet : MQLBase
    {
        public static new MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.SqlServer,"[Sys_CityArea]",fields);
        }
        public static new MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.SqlServer,"[Sys_CityArea]");
        }

        /// <summary>
        /// 主键
        /// </summary>
        public static readonly FieldBase CityAreaId = new FieldBase(DbType.SqlServer, "[Sys_CityArea]", FieldType.OnlyPrimaryKey, "[CityAreaId]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase ParentId = new FieldBase(DbType.SqlServer, "[Sys_CityArea]", FieldType.Common, "[ParentId]");

        /// <summary>
        /// 排序
        /// </summary>
        public static readonly FieldBase OrderNo = new FieldBase(DbType.SqlServer, "[Sys_CityArea]", FieldType.Common, "[OrderNo]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase TName = new FieldBase(DbType.SqlServer, "[Sys_CityArea]", FieldType.Common, "[TName]");

        /// <summary>
        /// 登录名
        /// </summary>
        public static readonly FieldBase TCode = new FieldBase(DbType.SqlServer, "[Sys_CityArea]", FieldType.Common, "[TCode]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase AreaTypes = new FieldBase(DbType.SqlServer, "[Sys_CityArea]", FieldType.Common, "[AreaTypes]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase Icon = new FieldBase(DbType.SqlServer, "[Sys_CityArea]", FieldType.Common, "[Icon]");

        /// <summary>
        /// 详情
        /// </summary>
        public static readonly FieldBase Remarks = new FieldBase(DbType.SqlServer, "[Sys_CityArea]", FieldType.Common, "[Remarks]");

        /// <summary>
        /// 添加时间
        /// </summary>
        public static readonly FieldBase CreateTime = new FieldBase(DbType.SqlServer, "[Sys_CityArea]", FieldType.Common, "[CreateTime]");

        /// <summary>
        /// 修改时间
        /// </summary>
        public static readonly FieldBase UpdateTime = new FieldBase(DbType.SqlServer, "[Sys_CityArea]", FieldType.Common, "[UpdateTime]");

        /// <summary>
        /// 是否有效
        /// </summary>
        public static readonly FieldBase isValid = new FieldBase(DbType.SqlServer, "[Sys_CityArea]", FieldType.Common, "[isValid]");

        /// <summary>
        /// 是否删除
        /// </summary>
        public static readonly FieldBase isDeleted = new FieldBase(DbType.SqlServer, "[Sys_CityArea]", FieldType.Common, "[isDeleted]");
    }

}
