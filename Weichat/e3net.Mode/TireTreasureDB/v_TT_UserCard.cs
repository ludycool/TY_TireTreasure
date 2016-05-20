using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Moon.Orm;

namespace e3net.Mode.TireTreasureDB
{

    [Table("[v_TT_UserCard]", DbType.SqlServer)]

    public partial class v_TT_UserCard : EntityBase
    {

        /// <summary>
        /// 
        /// </summary>
        public Int64 CardId
        {
            get { return GetPropertyValue<Int64>("CardId"); }
            set { SetPropertyValue("CardId", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public Guid? UserId
        {
            get { return GetPropertyValue<Guid?>("UserId"); }
            set { SetPropertyValue("UserId", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public Byte Levels
        {
            get { return GetPropertyValue<Byte>("Levels"); }
            set { SetPropertyValue("Levels", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public String CarNo
        {
            get { return GetPropertyValue<String>("CarNo"); }
            set { SetPropertyValue("CarNo", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public String Password
        {
            get { return GetPropertyValue<String>("Password"); }
            set { SetPropertyValue("Password", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public Int32? Scores
        {
            get { return GetPropertyValue<Int32?>("Scores"); }
            set { SetPropertyValue("Scores", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public Byte States
        {
            get { return GetPropertyValue<Byte>("States"); }
            set { SetPropertyValue("States", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public DateTime? StarTime
        {
            get { return GetPropertyValue<DateTime?>("StarTime"); }
            set { SetPropertyValue("StarTime", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public DateTime? EndTime
        {
            get { return GetPropertyValue<DateTime?>("EndTime"); }
            set { SetPropertyValue("EndTime", value); }
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
        public Decimal? UMoney
        {
            get { return GetPropertyValue<Decimal?>("UMoney"); }
            set { SetPropertyValue("UMoney", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public String Nickname
        {
            get { return GetPropertyValue<String>("Nickname"); }
            set { SetPropertyValue("Nickname", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public String Details
        {
            get { return GetPropertyValue<String>("Nickname"); }
            set { SetPropertyValue("Nickname", value); }
        }
    }

    [Table("[v_TT_UserCard]", DbType.SqlServer)]
    public  partial class v_TT_UserCardSet : MQLBase
    {
        public static  MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.SqlServer,"[v_TT_UserCard]",fields);
        }
        public static  MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.SqlServer,"[v_TT_UserCard]");
        }
        public static MQLBase SelectAllBut(params FieldBase[] fields)
        {
            return MQLBase.SelectAllBut(typeof(v_TT_UserCardSet),DbType.SqlServer,"[v_TT_UserCard]",fields);
        }

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase CardId = new FieldBase(DbType.SqlServer, "[v_TT_UserCard]", FieldType.Common, "[CardId]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase UserId = new FieldBase(DbType.SqlServer, "[v_TT_UserCard]", FieldType.Common, "[UserId]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase Levels = new FieldBase(DbType.SqlServer, "[v_TT_UserCard]", FieldType.Common, "[Levels]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase CarNo = new FieldBase(DbType.SqlServer, "[v_TT_UserCard]", FieldType.Common, "[CarNo]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase Password = new FieldBase(DbType.SqlServer, "[v_TT_UserCard]", FieldType.Common, "[Password]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase Scores = new FieldBase(DbType.SqlServer, "[v_TT_UserCard]", FieldType.Common, "[Scores]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase States = new FieldBase(DbType.SqlServer, "[v_TT_UserCard]", FieldType.Common, "[States]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase StarTime = new FieldBase(DbType.SqlServer, "[v_TT_UserCard]", FieldType.Common, "[StarTime]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase EndTime = new FieldBase(DbType.SqlServer, "[v_TT_UserCard]", FieldType.Common, "[EndTime]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase isDeleted = new FieldBase(DbType.SqlServer, "[v_TT_UserCard]", FieldType.Common, "[isDeleted]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase UMoney = new FieldBase(DbType.SqlServer, "[v_TT_UserCard]", FieldType.Common, "[UMoney]");

        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase Nickname = new FieldBase(DbType.SqlServer, "[v_TT_UserCard]", FieldType.Common, "[Nickname]");
        /// <summary>
        /// 
        /// </summary>
        public static readonly FieldBase Details = new FieldBase(DbType.SqlServer, "[v_TT_UserCard]", FieldType.Common, "[Details]");
    }

}
