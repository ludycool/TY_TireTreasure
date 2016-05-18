using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Moon.Orm;

namespace e3net.Mode.TireMoneyDB
{

    [Table("[TM_TranAcc]", DbType.SqlServer)]
    [TablesPrimaryKey(PrimaryKeyType.CustomerGUID, typeof(Guid), "TiId")]
    public partial class TM_TranAcc : EntityBase
    {

        /// <summary>
        /// 主键
        /// </summary>
        public Guid TiId
        {
            get { return GetPropertyValue<Guid>("TiId"); }
            set { SetPropertyValue("TiId", value); }
        }

        /// <summary>
        /// 流水号
        /// </summary>
        public String NCode
        {
            get { return GetPropertyValue<String>("NCode"); }
            set { SetPropertyValue("NCode", value); }
        }

        /// <summary>
        /// 用户Id
        /// </summary>
        public Guid UTId
        {
            get { return GetPropertyValue<Guid>("UTId"); }
            set { SetPropertyValue("UTId", value); }
        }

        /// <summary>
        /// 对方用户Id
        /// </summary>
        public Guid? STId
        {
            get { return GetPropertyValue<Guid?>("STId"); }
            set { SetPropertyValue("STId", value); }
        }

        /// <summary>
        /// 对方姓名
        /// </summary>
        public String TureName
        {
            get { return GetPropertyValue<String>("TureName"); }
            set { SetPropertyValue("TureName", value); }
        }

        /// <summary>
        /// 对方账户（成功换成：后 姓名加号）
        /// </summary>
        public String ACao
        {
            get { return GetPropertyValue<String>("ACao"); }
            set { SetPropertyValue("ACao", value); }
        }

        /// <summary>
        /// 交易金额
        /// </summary>
        public Decimal? TManey
        {
            get { return GetPropertyValue<Decimal?>("TManey"); }
            set { SetPropertyValue("TManey", value); }
        }

        /// <summary>
        /// 备注说明
        /// </summary>
        public String Remarks
        {
            get { return GetPropertyValue<String>("Remarks"); }
            set { SetPropertyValue("Remarks", value); }
        }

        /// <summary>
        /// 状态(-1关闭 0 处理中 10已到账 )
        /// </summary>
        public Byte States
        {
            get { return GetPropertyValue<Byte>("States"); }
            set { SetPropertyValue("States", value); }
        }

        /// <summary>
        /// 转账方式(平台Id)
        /// </summary>
        public Byte PayType
        {
            get { return GetPropertyValue<Byte>("PayType"); }
            set { SetPropertyValue("PayType", value); }
        }

        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime? CreateTime
        {
            get { return GetPropertyValue<DateTime?>("CreateTime"); }
            set { SetPropertyValue("CreateTime", value); }
        }

        /// <summary>
        /// 到账时间
        /// </summary>
        public DateTime? ComeTime
        {
            get { return GetPropertyValue<DateTime?>("ComeTime"); }
            set { SetPropertyValue("ComeTime", value); }
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

    [Table("[TM_TranAcc]", DbType.SqlServer)]
    public  partial class TM_TranAccSet : MQLBase
    {
        public static  MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.SqlServer,"[TM_TranAcc]",fields);
        }
        public static  MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.SqlServer,"[TM_TranAcc]");
        }
        public static MQLBase SelectAllBut(params FieldBase[] fields)
        {
            return MQLBase.SelectAllBut(typeof(TM_TranAccSet),DbType.SqlServer,"[TM_TranAcc]",fields);
        }

        /// <summary>
        /// 主键
        /// </summary>
        public static readonly FieldBase TiId = new FieldBase(DbType.SqlServer, "[TM_TranAcc]", FieldType.OnlyPrimaryKey, "[TiId]");

        /// <summary>
        /// 流水号
        /// </summary>
        public static readonly FieldBase NCode = new FieldBase(DbType.SqlServer, "[TM_TranAcc]", FieldType.Common, "[NCode]");

        /// <summary>
        /// 用户Id
        /// </summary>
        public static readonly FieldBase UTId = new FieldBase(DbType.SqlServer, "[TM_TranAcc]", FieldType.Common, "[UTId]");

        /// <summary>
        /// 对方用户Id
        /// </summary>
        public static readonly FieldBase STId = new FieldBase(DbType.SqlServer, "[TM_TranAcc]", FieldType.Common, "[STId]");

        /// <summary>
        /// 对方姓名
        /// </summary>
        public static readonly FieldBase TureName = new FieldBase(DbType.SqlServer, "[TM_TranAcc]", FieldType.Common, "[TureName]");

        /// <summary>
        /// 对方账户（成功换成：后 姓名加号）
        /// </summary>
        public static readonly FieldBase ACao = new FieldBase(DbType.SqlServer, "[TM_TranAcc]", FieldType.Common, "[ACao]");

        /// <summary>
        /// 交易金额
        /// </summary>
        public static readonly FieldBase TManey = new FieldBase(DbType.SqlServer, "[TM_TranAcc]", FieldType.Common, "[TManey]");

        /// <summary>
        /// 备注说明
        /// </summary>
        public static readonly FieldBase Remarks = new FieldBase(DbType.SqlServer, "[TM_TranAcc]", FieldType.Common, "[Remarks]");

        /// <summary>
        /// 状态(-1关闭 0 处理中 10已到账 )
        /// </summary>
        public static readonly FieldBase States = new FieldBase(DbType.SqlServer, "[TM_TranAcc]", FieldType.Common, "[States]");

        /// <summary>
        /// 转账方式(平台Id)
        /// </summary>
        public static readonly FieldBase PayType = new FieldBase(DbType.SqlServer, "[TM_TranAcc]", FieldType.Common, "[PayType]");

        /// <summary>
        /// 创建时间
        /// </summary>
        public static readonly FieldBase CreateTime = new FieldBase(DbType.SqlServer, "[TM_TranAcc]", FieldType.Common, "[CreateTime]");

        /// <summary>
        /// 到账时间
        /// </summary>
        public static readonly FieldBase ComeTime = new FieldBase(DbType.SqlServer, "[TM_TranAcc]", FieldType.Common, "[ComeTime]");

        /// <summary>
        /// 是否删除
        /// </summary>
        public static readonly FieldBase isDeleted = new FieldBase(DbType.SqlServer, "[TM_TranAcc]", FieldType.Common, "[isDeleted]");
    }

}
