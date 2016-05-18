using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Moon.Orm;

namespace e3net.Mode.TireTreasureDB
{

    [Table("[TT_References]", DbType.SqlServer)]
    [TablesPrimaryKey(PrimaryKeyType.AutoIncrease, typeof(Int64), "ReferencesId")]
    public partial class TT_References : EntityBase
    {

        /// <summary>
        /// 主键
        /// </summary>
        public Int64 ReferencesId
        {
            get { return GetPropertyValue<Int64>("ReferencesId"); }
            set { SetPropertyValue("ReferencesId", value); }
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
        /// 推荐的用户Id
        /// </summary>
        public Guid? ToUserId
        {
            get { return GetPropertyValue<Guid?>("ToUserId"); }
            set { SetPropertyValue("ToUserId", value); }
        }

        /// <summary>
        /// 邀请码
        /// </summary>
        public String InvitationCode
        {
            get { return GetPropertyValue<String>("InvitationCode"); }
            set { SetPropertyValue("InvitationCode", value); }
        }

        /// <summary>
        /// 状态（1推荐成功 0 推荐中 -1关闭）
        /// </summary>
        public Byte States
        {
            get { return GetPropertyValue<Byte>("States"); }
            set { SetPropertyValue("States", value); }
        }

        /// <summary>
        /// 类别
        /// </summary>
        public String CategoryId
        {
            get { return GetPropertyValue<String>("CategoryId"); }
            set { SetPropertyValue("CategoryId", value); }
        }

        /// <summary>
        /// 留言
        /// </summary>
        public String Messages
        {
            get { return GetPropertyValue<String>("Messages"); }
            set { SetPropertyValue("Messages", value); }
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
        /// 是否删除
        /// </summary>
        public Boolean? isDeleted
        {
            get { return GetPropertyValue<Boolean?>("isDeleted"); }
            set { SetPropertyValue("isDeleted", value); }
        }
    }

    [Table("[TT_References]", DbType.SqlServer)]
    public  partial class TT_ReferencesSet : MQLBase
    {
        public static  MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.SqlServer,"[TT_References]",fields);
        }
        public static  MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.SqlServer,"[TT_References]");
        }
        public static MQLBase SelectAllBut(params FieldBase[] fields)
        {
            return MQLBase.SelectAllBut(typeof(TT_ReferencesSet),DbType.SqlServer,"[TT_References]",fields);
        }

        /// <summary>
        /// 主键
        /// </summary>
        public static readonly FieldBase ReferencesId = new FieldBase(DbType.SqlServer, "[TT_References]", FieldType.OnlyPrimaryKey, "[ReferencesId]");

        /// <summary>
        /// 用户Id
        /// </summary>
        public static readonly FieldBase UserId = new FieldBase(DbType.SqlServer, "[TT_References]", FieldType.Common, "[UserId]");

        /// <summary>
        /// 推荐的用户Id
        /// </summary>
        public static readonly FieldBase ToUserId = new FieldBase(DbType.SqlServer, "[TT_References]", FieldType.Common, "[ToUserId]");

        /// <summary>
        /// 邀请码
        /// </summary>
        public static readonly FieldBase InvitationCode = new FieldBase(DbType.SqlServer, "[TT_References]", FieldType.Common, "[InvitationCode]");

        /// <summary>
        /// 状态（1推荐成功 0 推荐中 -1关闭）
        /// </summary>
        public static readonly FieldBase States = new FieldBase(DbType.SqlServer, "[TT_References]", FieldType.Common, "[States]");

        /// <summary>
        /// 类别
        /// </summary>
        public static readonly FieldBase CategoryId = new FieldBase(DbType.SqlServer, "[TT_References]", FieldType.Common, "[CategoryId]");

        /// <summary>
        /// 留言
        /// </summary>
        public static readonly FieldBase Messages = new FieldBase(DbType.SqlServer, "[TT_References]", FieldType.Common, "[Messages]");

        /// <summary>
        /// 添加时间
        /// </summary>
        public static readonly FieldBase AddTime = new FieldBase(DbType.SqlServer, "[TT_References]", FieldType.Common, "[AddTime]");

        /// <summary>
        /// 是否删除
        /// </summary>
        public static readonly FieldBase isDeleted = new FieldBase(DbType.SqlServer, "[TT_References]", FieldType.Common, "[isDeleted]");
    }

}
