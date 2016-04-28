using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Moon.Orm;

namespace e3net.Mode.TireMoneyDB
{

    [Table("[TM_Banard]", DbType.SqlServer)]
    [TablesPrimaryKey(PrimaryKeyType.CustomerGUID, typeof(Guid), "BardId")]
    public partial class TM_Banard : EntityBase
    {

        /// <summary>
        /// 主键
        /// </summary>
        public Guid BardId
        {
            get { return GetPropertyValue<Guid>("BardId"); }
            set { SetPropertyValue("BardId", value); }
        }

        /// <summary>
        /// 用户Id
        /// </summary>
        public Guid UEId
        {
            get { return GetPropertyValue<Guid>("UEId"); }
            set { SetPropertyValue("UEId", value); }
        }

        /// <summary>
        /// 银行名称
        /// </summary>
        public String TName
        {
            get { return GetPropertyValue<String>("TName"); }
            set { SetPropertyValue("TName", value); }
        }

        /// <summary>
        /// 卡类型类（1储蓄卡2信用卡）
        /// </summary>
        public Int32? CType
        {
            get { return GetPropertyValue<Int32?>("CType"); }
            set { SetPropertyValue("CType", value); }
        }

        /// <summary>
        /// 银行类型(各种银行)
        /// </summary>
        public Int32? BType
        {
            get { return GetPropertyValue<Int32?>("BType"); }
            set { SetPropertyValue("BType", value); }
        }

        /// <summary>
        /// 密钥
        /// </summary>
        public String SecretKey
        {
            get { return GetPropertyValue<String>("SecretKey"); }
            set { SetPropertyValue("SecretKey", value); }
        }

        /// <summary>
        /// 绑定手机号
        /// </summary>
        public String PCall
        {
            get { return GetPropertyValue<String>("PCall"); }
            set { SetPropertyValue("PCall", value); }
        }

        /// <summary>
        /// 状态（ 0 正常-1冻结）
        /// </summary>
        public Int32? States
        {
            get { return GetPropertyValue<Int32?>("States"); }
            set { SetPropertyValue("States", value); }
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

        /// <summary>
        /// 尾号（四位）
        /// </summary>
        public String LNoo
        {
            get { return GetPropertyValue<String>("LNoo"); }
            set { SetPropertyValue("LNoo", value); }
        }
    }

    [Table("[TM_Banard]", DbType.SqlServer)]
    public  partial class TM_BanardSet : MQLBase
    {
        public static  MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.SqlServer,"[TM_Banard]",fields);
        }
        public static  MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.SqlServer,"[TM_Banard]");
        }
        public static MQLBase SelectAllBut(params FieldBase[] fields)
        {
            return MQLBase.SelectAllBut(typeof(TM_BanardSet),DbType.SqlServer,"[TM_Banard]",fields);
        }

        /// <summary>
        /// 主键
        /// </summary>
        public static readonly FieldBase BardId = new FieldBase(DbType.SqlServer, "[TM_Banard]", FieldType.OnlyPrimaryKey, "[BardId]");

        /// <summary>
        /// 用户Id
        /// </summary>
        public static readonly FieldBase UEId = new FieldBase(DbType.SqlServer, "[TM_Banard]", FieldType.Common, "[UEId]");

        /// <summary>
        /// 银行名称
        /// </summary>
        public static readonly FieldBase TName = new FieldBase(DbType.SqlServer, "[TM_Banard]", FieldType.Common, "[TName]");

        /// <summary>
        /// 卡类型类（1储蓄卡2信用卡）
        /// </summary>
        public static readonly FieldBase CType = new FieldBase(DbType.SqlServer, "[TM_Banard]", FieldType.Common, "[CType]");

        /// <summary>
        /// 银行类型(各种银行)
        /// </summary>
        public static readonly FieldBase BType = new FieldBase(DbType.SqlServer, "[TM_Banard]", FieldType.Common, "[BType]");

        /// <summary>
        /// 密钥
        /// </summary>
        public static readonly FieldBase SecretKey = new FieldBase(DbType.SqlServer, "[TM_Banard]", FieldType.Common, "[SecretKey]");

        /// <summary>
        /// 绑定手机号
        /// </summary>
        public static readonly FieldBase PCall = new FieldBase(DbType.SqlServer, "[TM_Banard]", FieldType.Common, "[PCall]");

        /// <summary>
        /// 状态（ 0 正常-1冻结）
        /// </summary>
        public static readonly FieldBase States = new FieldBase(DbType.SqlServer, "[TM_Banard]", FieldType.Common, "[States]");

        /// <summary>
        /// 添加时间
        /// </summary>
        public static readonly FieldBase CreateTime = new FieldBase(DbType.SqlServer, "[TM_Banard]", FieldType.Common, "[CreateTime]");

        /// <summary>
        /// 修改时间
        /// </summary>
        public static readonly FieldBase UpdateTime = new FieldBase(DbType.SqlServer, "[TM_Banard]", FieldType.Common, "[UpdateTime]");

        /// <summary>
        /// 是否删除
        /// </summary>
        public static readonly FieldBase isDeleted = new FieldBase(DbType.SqlServer, "[TM_Banard]", FieldType.Common, "[isDeleted]");

        /// <summary>
        /// 尾号（四位）
        /// </summary>
        public static readonly FieldBase LNoo = new FieldBase(DbType.SqlServer, "[TM_Banard]", FieldType.Common, "[LNoo]");
    }

}
