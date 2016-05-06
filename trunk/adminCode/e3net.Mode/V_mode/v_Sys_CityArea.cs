using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Moon.Orm;

namespace e3net.Mode.V_mode
{

    [Table("[v_Sys_CityArea]", DbType.SqlServer)]

    public partial class v_Sys_CityArea : EntityBase
    {

        /// <summary>
        /// 
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
        /// 
        /// </summary>
        public String TName
        {
            get { return GetPropertyValue<String>("TName"); }
            set { SetPropertyValue("TName", value); }
        }

        /// <summary>
        /// 
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
        /// 
        /// </summary>
        public String Remarks
        {
            get { return GetPropertyValue<String>("Remarks"); }
            set { SetPropertyValue("Remarks", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public DateTime? CreateTime
        {
            get { return GetPropertyValue<DateTime?>("CreateTime"); }
            set { SetPropertyValue("CreateTime", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public DateTime? UpdateTime
        {
            get { return GetPropertyValue<DateTime?>("UpdateTime"); }
            set { SetPropertyValue("UpdateTime", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public Boolean? isValid
        {
            get { return GetPropertyValue<Boolean?>("isValid"); }
            set { SetPropertyValue("isValid", value); }
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
        public String AreaTypesName
        {
            get { return GetPropertyValue<String>("AreaTypesName"); }
            set { SetPropertyValue("AreaTypesName", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public Int32? OrderNo
        {
            get { return GetPropertyValue<Int32?>("OrderNo"); }
            set { SetPropertyValue("OrderNo", value); }
        }
    }

    [Table("[v_Sys_CityArea]", DbType.SqlServer)]
    public  partial class v_Sys_CityAreaSet : MQLBase
    {
        public static  MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.SqlServer,"[v_Sys_CityArea]",fields);
        }
        public static  MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.SqlServer,"[v_Sys_CityArea]");
        }
        public static MQLBase SelectAllBut(params FieldBase[] fields)
        {
            return MQLBase.SelectAllBut(typeof(v_Sys_CityAreaSet),DbType.SqlServer,"[v_Sys_CityArea]",fields);
        }

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase CityAreaId = new FieldBase(DbType.SqlServer, "[v_Sys_CityArea]", FieldType.Common, "[CityAreaId]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase ParentId = new FieldBase(DbType.SqlServer, "[v_Sys_CityArea]", FieldType.Common, "[ParentId]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase TName = new FieldBase(DbType.SqlServer, "[v_Sys_CityArea]", FieldType.Common, "[TName]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase TCode = new FieldBase(DbType.SqlServer, "[v_Sys_CityArea]", FieldType.Common, "[TCode]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase AreaTypes = new FieldBase(DbType.SqlServer, "[v_Sys_CityArea]", FieldType.Common, "[AreaTypes]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase Icon = new FieldBase(DbType.SqlServer, "[v_Sys_CityArea]", FieldType.Common, "[Icon]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase Remarks = new FieldBase(DbType.SqlServer, "[v_Sys_CityArea]", FieldType.Common, "[Remarks]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase CreateTime = new FieldBase(DbType.SqlServer, "[v_Sys_CityArea]", FieldType.Common, "[CreateTime]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase UpdateTime = new FieldBase(DbType.SqlServer, "[v_Sys_CityArea]", FieldType.Common, "[UpdateTime]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase isValid = new FieldBase(DbType.SqlServer, "[v_Sys_CityArea]", FieldType.Common, "[isValid]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase isDeleted = new FieldBase(DbType.SqlServer, "[v_Sys_CityArea]", FieldType.Common, "[isDeleted]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase AreaTypesName = new FieldBase(DbType.SqlServer, "[v_Sys_CityArea]", FieldType.Common, "[AreaTypesName]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase OrderNo = new FieldBase(DbType.SqlServer, "[v_Sys_CityArea]", FieldType.Common, "[OrderNo]");
    }

}
