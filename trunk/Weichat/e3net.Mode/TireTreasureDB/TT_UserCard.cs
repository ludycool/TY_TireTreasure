using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Moon.Orm;

namespace e3net.Mode.TireTreasureDB
{

    [Table("[TT_UserCard]", DbType.SqlServer)]
    [TablesPrimaryKey(PrimaryKeyType.AutoIncrease, typeof(Int64), "CardId")]
    public partial class TT_UserCard : EntityBase
    {

        /// <summary>
        /// 主键
        /// </summary>
        public Int64 CardId
        {
            get { return GetPropertyValue<Int64>("CardId"); }
            set { SetPropertyValue("CardId", value); }
        }

        /// <summary>
        /// 用户Id
        /// </summary>
        public Guid? UserId
        {
            get { return GetPropertyValue<Guid?>("UserId"); }
            set { SetPropertyValue("UserId", value); }
        }

        /// <summary>
        /// 等级（联盟）
        /// </summary>
        public Byte Levels
        {
            get { return GetPropertyValue<Byte>("Levels"); }
            set { SetPropertyValue("Levels", value); }
        }

        /// <summary>
        /// 编号
        /// </summary>
        public String CarNo
        {
            get { return GetPropertyValue<String>("CarNo"); }
            set { SetPropertyValue("CarNo", value); }
        }

        /// <summary>
        /// 密码
        /// </summary>
        public String Password
        {
            get { return GetPropertyValue<String>("Password"); }
            set { SetPropertyValue("Password", value); }
        }

        /// <summary>
        /// 积分（联盟）
        /// </summary>
        public Int32? Scores
        {
            get { return GetPropertyValue<Int32?>("Scores"); }
            set { SetPropertyValue("Scores", value); }
        }

        /// <summary>
        /// 状态（1开通 0 未开通 11锁定 12 失效）
        /// </summary>
        public Byte States
        {
            get { return GetPropertyValue<Byte>("States"); }
            set { SetPropertyValue("States", value); }
        }

        /// <summary>
        /// 开卡日期
        /// </summary>
        public DateTime? StarTime
        {
            get { return GetPropertyValue<DateTime?>("StarTime"); }
            set { SetPropertyValue("StarTime", value); }
        }

        /// <summary>
        /// 到期日期
        /// </summary>
        public DateTime? EndTime
        {
            get { return GetPropertyValue<DateTime?>("EndTime"); }
            set { SetPropertyValue("EndTime", value); }
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

    [Table("[TT_UserCard]", DbType.SqlServer)]
    public  partial class TT_UserCardSet : MQLBase
    {
        public static  MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.SqlServer,"[TT_UserCard]",fields);
        }
        public static  MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.SqlServer,"[TT_UserCard]");
        }
        public static MQLBase SelectAllBut(params FieldBase[] fields)
        {
            return MQLBase.SelectAllBut(typeof(TT_UserCardSet),DbType.SqlServer,"[TT_UserCard]",fields);
        }

        /// <summary>
        /// 主键
        /// </summary>
        public static readonly FieldBase CardId = new FieldBase(DbType.SqlServer, "[TT_UserCard]", FieldType.OnlyPrimaryKey, "[CardId]");

        /// <summary>
        /// 用户Id
        /// </summary>
        public static readonly FieldBase UserId = new FieldBase(DbType.SqlServer, "[TT_UserCard]", FieldType.Common, "[UserId]");

        /// <summary>
        /// 等级（联盟）
        /// </summary>
        public static readonly FieldBase Levels = new FieldBase(DbType.SqlServer, "[TT_UserCard]", FieldType.Common, "[Levels]");

        /// <summary>
        /// 编号
        /// </summary>
        public static readonly FieldBase CarNo = new FieldBase(DbType.SqlServer, "[TT_UserCard]", FieldType.Common, "[CarNo]");

        /// <summary>
        /// 密码
        /// </summary>
        public static readonly FieldBase Password = new FieldBase(DbType.SqlServer, "[TT_UserCard]", FieldType.Common, "[Password]");

        /// <summary>
        /// 积分（联盟）
        /// </summary>
        public static readonly FieldBase Scores = new FieldBase(DbType.SqlServer, "[TT_UserCard]", FieldType.Common, "[Scores]");

        /// <summary>
        /// 状态（1开通 0 未开通 11锁定 12 失效）
        /// </summary>
        public static readonly FieldBase States = new FieldBase(DbType.SqlServer, "[TT_UserCard]", FieldType.Common, "[States]");

        /// <summary>
        /// 开卡日期
        /// </summary>
        public static readonly FieldBase StarTime = new FieldBase(DbType.SqlServer, "[TT_UserCard]", FieldType.Common, "[StarTime]");

        /// <summary>
        /// 到期日期
        /// </summary>
        public static readonly FieldBase EndTime = new FieldBase(DbType.SqlServer, "[TT_UserCard]", FieldType.Common, "[EndTime]");

        /// <summary>
        /// 是否删除
        /// </summary>
        public static readonly FieldBase isDeleted = new FieldBase(DbType.SqlServer, "[TT_UserCard]", FieldType.Common, "[isDeleted]");
    }

}
