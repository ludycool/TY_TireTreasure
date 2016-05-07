using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Moon.Orm;

namespace e3net.Mode.Base
{

    [Table("[Sys_Files]", DbType.SqlServer)]
    [TablesPrimaryKey(PrimaryKeyType.AutoIncrease, typeof(Int64), "FileId")]
    public partial class Sys_Files : EntityBase
    {

        /// <summary>
        /// 主键
        /// </summary>
        public Int64 FileId
        {
            get { return GetPropertyValue<Int64>("FileId"); }
            set { SetPropertyValue("FileId", value); }
        }

        /// <summary>
        /// 所禹对象Id
        /// </summary>
        public Guid? ToId
        {
            get { return GetPropertyValue<Guid?>("ToId"); }
            set { SetPropertyValue("ToId", value); }
        }

        /// <summary>
        /// 显示名称
        /// </summary>
        public String ShowName
        {
            get { return GetPropertyValue<String>("ShowName"); }
            set { SetPropertyValue("ShowName", value); }
        }

        /// <summary>
        /// 文件名
        /// </summary>
        public String FileName
        {
            get { return GetPropertyValue<String>("FileName"); }
            set { SetPropertyValue("FileName", value); }
        }

        /// <summary>
        /// 来源表（某个数据表）
        /// </summary>
        public String SourceTable
        {
            get { return GetPropertyValue<String>("SourceTable"); }
            set { SetPropertyValue("SourceTable", value); }
        }

        /// <summary>
        /// 相对路径
        /// </summary>
        public String RelativePath
        {
            get { return GetPropertyValue<String>("RelativePath"); }
            set { SetPropertyValue("RelativePath", value); }
        }

        /// <summary>
        /// 路由
        /// </summary>
        public String Route
        {
            get { return GetPropertyValue<String>("Route"); }
            set { SetPropertyValue("Route", value); }
        }

        /// <summary>
        /// 后缀名
        /// </summary>
        public String Suffix
        {
            get { return GetPropertyValue<String>("Suffix"); }
            set { SetPropertyValue("Suffix", value); }
        }

        /// <summary>
        /// 文件属性类型（中文）
        /// </summary>
        public String FileType
        {
            get { return GetPropertyValue<String>("FileType"); }
            set { SetPropertyValue("FileType", value); }
        }

        /// <summary>
        /// 添加时间
        /// </summary>
        public DateTime? AddTime
        {
            get { return GetPropertyValue<DateTime?>("AddTime"); }
            set { SetPropertyValue("AddTime", value); }
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

    [Table("[Sys_Files]", DbType.SqlServer)]
    public  partial class Sys_FilesSet : MQLBase
    {
        public static  MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.SqlServer,"[Sys_Files]",fields);
        }
        public static  MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.SqlServer,"[Sys_Files]");
        }
        public static MQLBase SelectAllBut(params FieldBase[] fields)
        {
            return MQLBase.SelectAllBut(typeof(Sys_FilesSet),DbType.SqlServer,"[Sys_Files]",fields);
        }

        /// <summary>
        /// 主键
        /// </summary>
        public static readonly FieldBase FileId = new FieldBase(DbType.SqlServer, "[Sys_Files]", FieldType.OnlyPrimaryKey, "[FileId]");

        /// <summary>
        /// 所禹对象Id
        /// </summary>
        public static readonly FieldBase ToId = new FieldBase(DbType.SqlServer, "[Sys_Files]", FieldType.Common, "[ToId]");

        /// <summary>
        /// 显示名称
        /// </summary>
        public static readonly FieldBase ShowName = new FieldBase(DbType.SqlServer, "[Sys_Files]", FieldType.Common, "[ShowName]");

        /// <summary>
        /// 文件名
        /// </summary>
        public static readonly FieldBase FileName = new FieldBase(DbType.SqlServer, "[Sys_Files]", FieldType.Common, "[FileName]");

        /// <summary>
        /// 来源表（某个数据表）
        /// </summary>
        public static readonly FieldBase SourceTable = new FieldBase(DbType.SqlServer, "[Sys_Files]", FieldType.Common, "[SourceTable]");

        /// <summary>
        /// 相对路径
        /// </summary>
        public static readonly FieldBase RelativePath = new FieldBase(DbType.SqlServer, "[Sys_Files]", FieldType.Common, "[RelativePath]");

        /// <summary>
        /// 路由
        /// </summary>
        public static readonly FieldBase Route = new FieldBase(DbType.SqlServer, "[Sys_Files]", FieldType.Common, "[Route]");

        /// <summary>
        /// 后缀名
        /// </summary>
        public static readonly FieldBase Suffix = new FieldBase(DbType.SqlServer, "[Sys_Files]", FieldType.Common, "[Suffix]");

        /// <summary>
        /// 文件属性类型（中文）
        /// </summary>
        public static readonly FieldBase FileType = new FieldBase(DbType.SqlServer, "[Sys_Files]", FieldType.Common, "[FileType]");

        /// <summary>
        /// 添加时间
        /// </summary>
        public static readonly FieldBase AddTime = new FieldBase(DbType.SqlServer, "[Sys_Files]", FieldType.Common, "[AddTime]");

        /// <summary>
        /// 是否有效
        /// </summary>
        public static readonly FieldBase isValid = new FieldBase(DbType.SqlServer, "[Sys_Files]", FieldType.Common, "[isValid]");

        /// <summary>
        /// 是否删除
        /// </summary>
        public static readonly FieldBase isDeleted = new FieldBase(DbType.SqlServer, "[Sys_Files]", FieldType.Common, "[isDeleted]");
    }

}
