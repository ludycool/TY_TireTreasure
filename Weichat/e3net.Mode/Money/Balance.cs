using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Moon.Orm;

namespace e3net.Mode.Money
{

    [Table("[TM_Balce]", DbType.SqlServer)]
    public partial class TM_BalceSet : MQLBase
    {
        public static MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.SqlServer, "[TM_Balce]", fields);
        }
        public static MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.SqlServer, "[TM_Balce]");
        }
        public static MQLBase SelectAllBut(params FieldBase[] fields)
        {
            return MQLBase.SelectAllBut(typeof(TM_BalceSet), DbType.SqlServer, "[TM_Balce]", fields);
        }

        /// <summary>
        /// 主键
        /// </summary>
        public static readonly FieldBase BaId = new FieldBase(DbType.SqlServer, "[TM_Balce]", FieldType.OnlyPrimaryKey, "[BaId]");

        /// <summary>
        /// 用户Id
        /// </summary>
        public static readonly FieldBase USId = new FieldBase(DbType.SqlServer, "[TM_Balce]", FieldType.Common, "[USId]");

        /// <summary>
        /// 余额
        /// </summary>
        public static readonly FieldBase AMneys = new FieldBase(DbType.SqlServer, "[TM_Balce]", FieldType.Common, "[AMneys]");

        /// <summary>
        /// 密钥
        /// </summary>
        public static readonly FieldBase SecretS = new FieldBase(DbType.SqlServer, "[TM_Balce]", FieldType.Common, "[SecretS]");

        /// <summary>
        /// 可用金额
        /// </summary>
        public static readonly FieldBase UMoney = new FieldBase(DbType.SqlServer, "[TM_Balce]", FieldType.Common, "[UMoney]");

        /// <summary>
        /// 状态（ 0 正常-1冻结）
        /// </summary>
        public static readonly FieldBase Stas = new FieldBase(DbType.SqlServer, "[TM_Balce]", FieldType.Common, "[Stas]");

        /// <summary>
        /// 添加时间
        /// </summary>
        public static readonly FieldBase CreateTime = new FieldBase(DbType.SqlServer, "[TM_Balce]", FieldType.Common, "[CreateTime]");

        /// <summary>
        /// 修改时间
        /// </summary>
        public static readonly FieldBase UpdateTime = new FieldBase(DbType.SqlServer, "[TM_Balce]", FieldType.Common, "[UpdateTime]");

        /// <summary>
        /// 是否删除
        /// </summary>
        public static readonly FieldBase isDeleted = new FieldBase(DbType.SqlServer, "[TM_Balce]", FieldType.Common, "[isDeleted]");
    }


    [Table("[TM_Balce]", DbType.SqlServer)]
    [TablesPrimaryKey(PrimaryKeyType.CustomerGUID, typeof(Guid), "BaId")]
    public partial class Balance : EntityBase
    {

        /// <summary>
        /// 主键
        /// </summary>
        public Guid BaId
        {
            get { return GetPropertyValue<Guid>("BaId"); }
            set { SetPropertyValue("BaId", value); }
        }

        /// <summary>
        /// 用户Id
        /// </summary>
        public Guid USId
        {
            get { return GetPropertyValue<Guid>("USId"); }
            set { SetPropertyValue("USId", value); }
        }

        /// <summary>
        /// 余额
        /// </summary>
        public Decimal? AMneys
        {
            get { return GetPropertyValue<Decimal?>("AMneys"); }
            set { SetPropertyValue("AMneys", value); }
        }

        /// <summary>
        /// 密钥
        /// </summary>
        public String SecretS
        {
            get { return GetPropertyValue<String>("SecretS"); }
            set { SetPropertyValue("SecretS", value); }
        }

        /// <summary>
        /// 可用金额
        /// </summary>
        public Decimal? UMoney
        {
            get { return GetPropertyValue<Decimal?>("UMoney"); }
            set { SetPropertyValue("UMoney", value); }
        }

        /// <summary>
        /// 状态（ 0 正常-1冻结）
        /// </summary>
        public Int32? Stas
        {
            get { return GetPropertyValue<Int32?>("Stas"); }
            set { SetPropertyValue("Stas", value); }
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
        /// 是否删除
        /// </summary>
        public Boolean? isDeleted
        {
            get { return GetPropertyValue<Boolean?>("isDeleted"); }
            set { SetPropertyValue("isDeleted", value); }
        }
    }


}
