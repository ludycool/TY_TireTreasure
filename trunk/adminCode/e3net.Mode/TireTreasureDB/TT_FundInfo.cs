using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Moon.Orm;

namespace e3net.Mode.TireTreasureDB
{

    [Table("[TT_FundInfo]", DbType.SqlServer)]
    [TablesPrimaryKey(PrimaryKeyType.CustomerGUID, typeof(Guid), "FundInfoId")]
    public partial class TT_FundInfo : EntityBase
    {

        /// <summary>
        /// 主键
        /// </summary>
        public Guid FundInfoId
        {
            get { return GetPropertyValue<Guid>("FundInfoId"); }
            set { SetPropertyValue("FundInfoId", value); }
        }

        /// <summary>
        /// 名称
        /// </summary>
        public String TName
        {
            get { return GetPropertyValue<String>("TName"); }
            set { SetPropertyValue("TName", value); }
        }

        /// <summary>
        /// 代号
        /// </summary>
        public String SCode
        {
            get { return GetPropertyValue<String>("SCode"); }
            set { SetPropertyValue("SCode", value); }
        }

        /// <summary>
        /// 图标
        /// </summary>
        public String IConUrl
        {
            get { return GetPropertyValue<String>("IConUrl"); }
            set { SetPropertyValue("IConUrl", value); }
        }

        /// <summary>
        /// 排序
        /// </summary>
        public Int32? Orders
        {
            get { return GetPropertyValue<Int32?>("Orders"); }
            set { SetPropertyValue("Orders", value); }
        }

        /// <summary>
        /// 资格（金额）
        /// </summary>
        public Decimal? NeedScores
        {
            get { return GetPropertyValue<Decimal?>("NeedScores"); }
            set { SetPropertyValue("NeedScores", value); }
        }

        /// <summary>
        /// 启动（金额）
        /// </summary>
        public Decimal? Scores
        {
            get { return GetPropertyValue<Decimal?>("Scores"); }
            set { SetPropertyValue("Scores", value); }
        }

        /// <summary>
        /// 简述
        /// </summary>
        public String Summarys
        {
            get { return GetPropertyValue<String>("Summarys"); }
            set { SetPropertyValue("Summarys", value); }
        }

        /// <summary>
        /// 详情
        /// </summary>
        public String Details
        {
            get { return GetPropertyValue<String>("Details"); }
            set { SetPropertyValue("Details", value); }
        }

        /// <summary>
        /// 开始时间
        /// </summary>
        public DateTime? StarTime
        {
            get { return GetPropertyValue<DateTime?>("StarTime"); }
            set { SetPropertyValue("StarTime", value); }
        }

        /// <summary>
        /// 结束时间
        /// </summary>
        public DateTime? EndTime
        {
            get { return GetPropertyValue<DateTime?>("EndTime"); }
            set { SetPropertyValue("EndTime", value); }
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

    [Table("[TT_FundInfo]", DbType.SqlServer)]
    public  partial class TT_FundInfoSet : MQLBase
    {
        public static  MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.SqlServer,"[TT_FundInfo]",fields);
        }
        public static  MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.SqlServer,"[TT_FundInfo]");
        }
        public static MQLBase SelectAllBut(params FieldBase[] fields)
        {
            return MQLBase.SelectAllBut(typeof(TT_FundInfoSet),DbType.SqlServer,"[TT_FundInfo]",fields);
        }

        /// <summary>
        /// 主键
        /// </summary>
        public static readonly FieldBase FundInfoId = new FieldBase(DbType.SqlServer, "[TT_FundInfo]", FieldType.OnlyPrimaryKey, "[FundInfoId]");

        /// <summary>
        /// 名称
        /// </summary>
        public static readonly FieldBase TName = new FieldBase(DbType.SqlServer, "[TT_FundInfo]", FieldType.Common, "[TName]");

        /// <summary>
        /// 代号
        /// </summary>
        public static readonly FieldBase SCode = new FieldBase(DbType.SqlServer, "[TT_FundInfo]", FieldType.Common, "[SCode]");

        /// <summary>
        /// 图标
        /// </summary>
        public static readonly FieldBase IConUrl = new FieldBase(DbType.SqlServer, "[TT_FundInfo]", FieldType.Common, "[IConUrl]");

        /// <summary>
        /// 排序
        /// </summary>
        public static readonly FieldBase Orders = new FieldBase(DbType.SqlServer, "[TT_FundInfo]", FieldType.Common, "[Orders]");

        /// <summary>
        /// 资格（金额）
        /// </summary>
        public static readonly FieldBase NeedScores = new FieldBase(DbType.SqlServer, "[TT_FundInfo]", FieldType.Common, "[NeedScores]");

        /// <summary>
        /// 启动（金额）
        /// </summary>
        public static readonly FieldBase Scores = new FieldBase(DbType.SqlServer, "[TT_FundInfo]", FieldType.Common, "[Scores]");

        /// <summary>
        /// 简述
        /// </summary>
        public static readonly FieldBase Summarys = new FieldBase(DbType.SqlServer, "[TT_FundInfo]", FieldType.Common, "[Summarys]");

        /// <summary>
        /// 详情
        /// </summary>
        public static readonly FieldBase Details = new FieldBase(DbType.SqlServer, "[TT_FundInfo]", FieldType.Common, "[Details]");

        /// <summary>
        /// 开始时间
        /// </summary>
        public static readonly FieldBase StarTime = new FieldBase(DbType.SqlServer, "[TT_FundInfo]", FieldType.Common, "[StarTime]");

        /// <summary>
        /// 结束时间
        /// </summary>
        public static readonly FieldBase EndTime = new FieldBase(DbType.SqlServer, "[TT_FundInfo]", FieldType.Common, "[EndTime]");

        /// <summary>
        /// 添加时间
        /// </summary>
        public static readonly FieldBase CreateTime = new FieldBase(DbType.SqlServer, "[TT_FundInfo]", FieldType.Common, "[CreateTime]");

        /// <summary>
        /// 修改时间
        /// </summary>
        public static readonly FieldBase UpdateTime = new FieldBase(DbType.SqlServer, "[TT_FundInfo]", FieldType.Common, "[UpdateTime]");

        /// <summary>
        /// 是否有效
        /// </summary>
        public static readonly FieldBase isValid = new FieldBase(DbType.SqlServer, "[TT_FundInfo]", FieldType.Common, "[isValid]");

        /// <summary>
        /// 是否删除
        /// </summary>
        public static readonly FieldBase isDeleted = new FieldBase(DbType.SqlServer, "[TT_FundInfo]", FieldType.Common, "[isDeleted]");
    }

}
