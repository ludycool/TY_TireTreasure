using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Moon.Orm;

namespace e3net.Mode.TireTreasureDB
{

    [Table("[TT_FundPerSon]", DbType.SqlServer)]
    [TablesPrimaryKey(PrimaryKeyType.CustomerGUID, typeof(Guid), "FundPerSonId")]
    public partial class TT_FundPerSon : EntityBase
    {

        /// <summary>
        /// 主键
        /// </summary>
        public Guid FundPerSonId
        {
            get { return GetPropertyValue<Guid>("FundPerSonId"); }
            set { SetPropertyValue("FundPerSonId", value); }
        }

        /// <summary>
        /// 用户Id
        /// </summary>
        public Guid UserId
        {
            get { return GetPropertyValue<Guid>("UserId"); }
            set { SetPropertyValue("UserId", value); }
        }

        /// <summary>
        /// 基金Id
        /// </summary>
        public Guid FundInfoId
        {
            get { return GetPropertyValue<Guid>("FundInfoId"); }
            set { SetPropertyValue("FundInfoId", value); }
        }

        /// <summary>
        /// 已存（金额）
        /// </summary>
        public Decimal? HScores
        {
            get { return GetPropertyValue<Decimal?>("HScores"); }
            set { SetPropertyValue("HScores", value); }
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

    [Table("[TT_FundPerSon]", DbType.SqlServer)]
    public  partial class TT_FundPerSonSet : MQLBase
    {
        public static  MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.SqlServer,"[TT_FundPerSon]",fields);
        }
        public static  MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.SqlServer,"[TT_FundPerSon]");
        }
        public static MQLBase SelectAllBut(params FieldBase[] fields)
        {
            return MQLBase.SelectAllBut(typeof(TT_FundPerSonSet),DbType.SqlServer,"[TT_FundPerSon]",fields);
        }

        /// <summary>
        /// 主键
        /// </summary>
        public static readonly FieldBase FundPerSonId = new FieldBase(DbType.SqlServer, "[TT_FundPerSon]", FieldType.OnlyPrimaryKey, "[FundPerSonId]");

        /// <summary>
        /// 用户Id
        /// </summary>
        public static readonly FieldBase UserId = new FieldBase(DbType.SqlServer, "[TT_FundPerSon]", FieldType.Common, "[UserId]");

        /// <summary>
        /// 基金Id
        /// </summary>
        public static readonly FieldBase FundInfoId = new FieldBase(DbType.SqlServer, "[TT_FundPerSon]", FieldType.Common, "[FundInfoId]");

        /// <summary>
        /// 已存（金额）
        /// </summary>
        public static readonly FieldBase HScores = new FieldBase(DbType.SqlServer, "[TT_FundPerSon]", FieldType.Common, "[HScores]");

        /// <summary>
        /// 开始时间
        /// </summary>
        public static readonly FieldBase StarTime = new FieldBase(DbType.SqlServer, "[TT_FundPerSon]", FieldType.Common, "[StarTime]");

        /// <summary>
        /// 结束时间
        /// </summary>
        public static readonly FieldBase EndTime = new FieldBase(DbType.SqlServer, "[TT_FundPerSon]", FieldType.Common, "[EndTime]");

        /// <summary>
        /// 添加时间
        /// </summary>
        public static readonly FieldBase CreateTime = new FieldBase(DbType.SqlServer, "[TT_FundPerSon]", FieldType.Common, "[CreateTime]");

        /// <summary>
        /// 修改时间
        /// </summary>
        public static readonly FieldBase UpdateTime = new FieldBase(DbType.SqlServer, "[TT_FundPerSon]", FieldType.Common, "[UpdateTime]");

        /// <summary>
        /// 是否有效
        /// </summary>
        public static readonly FieldBase isValid = new FieldBase(DbType.SqlServer, "[TT_FundPerSon]", FieldType.Common, "[isValid]");

        /// <summary>
        /// 是否删除
        /// </summary>
        public static readonly FieldBase isDeleted = new FieldBase(DbType.SqlServer, "[TT_FundPerSon]", FieldType.Common, "[isDeleted]");
    }

}
