using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Moon.Orm;

namespace e3net.Mode.Base
{

    [Table("[TT_RequestFriends]", DbType.SqlServer)]
    public partial class TT_RequestFriendsSet : MQLBase
    {
        public static MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.SqlServer, "[TT_RequestFriends]", fields);
        }
        public static MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.SqlServer, "[TT_RequestFriends]");
        }
        public static MQLBase SelectAllBut(params FieldBase[] fields)
        {
            return MQLBase.SelectAllBut(typeof(TT_RequestFriendsSet), DbType.SqlServer, "[TT_RequestFriends]", fields);
        }

        /// <summary>
        /// 主键
        /// </summary>
        public static readonly FieldBase RequestFriendsId = new FieldBase(DbType.SqlServer, "[TT_RequestFriends]", FieldType.OnlyPrimaryKey, "[RequestFriendsId]");

        /// <summary>
        /// 用户Id
        /// </summary>
        public static readonly FieldBase UserId = new FieldBase(DbType.SqlServer, "[TT_RequestFriends]", FieldType.Common, "[UserId]");

        /// <summary>
        /// 申请的用户Id
        /// </summary>
        public static readonly FieldBase ToUserId = new FieldBase(DbType.SqlServer, "[TT_RequestFriends]", FieldType.Common, "[ToUserId]");

        /// <summary>
        /// 状态（1添加成功 0 拒绝 -1关闭）
        /// </summary>
        public static readonly FieldBase States = new FieldBase(DbType.SqlServer, "[TT_RequestFriends]", FieldType.Common, "[States]");

        /// <summary>
        /// 类别
        /// </summary>
        public static readonly FieldBase CategoryId = new FieldBase(DbType.SqlServer, "[TT_RequestFriends]", FieldType.Common, "[CategoryId]");

        /// <summary>
        /// 留言
        /// </summary>
        public static readonly FieldBase Messages = new FieldBase(DbType.SqlServer, "[TT_RequestFriends]", FieldType.Common, "[Messages]");

        /// <summary>
        /// 添加时间
        /// </summary>
        public static readonly FieldBase AddTime = new FieldBase(DbType.SqlServer, "[TT_RequestFriends]", FieldType.Common, "[AddTime]");

        /// <summary>
        /// 是否删除
        /// </summary>
        public static readonly FieldBase isDeleted = new FieldBase(DbType.SqlServer, "[TT_RequestFriends]", FieldType.Common, "[isDeleted]");
    }


    [Table("[TT_RequestFriends]", DbType.SqlServer)]
    [TablesPrimaryKey(PrimaryKeyType.AutoIncrease, typeof(Int64), "RequestFriendsId")]
    public partial class RequestFriends : EntityBase
    {

        /// <summary>
        /// 主键
        /// </summary>
        public Int64 RequestFriendsId
        {
            get
            {
                return GetPropertyValue<Int64>("RequestFriendsId");
            }
            set
            {
                SetPropertyValue("RequestFriendsId", value);
            }
        }

        /// <summary>
        /// 用户Id
        /// </summary>
        public Guid UserId
        {
            get
            {
                return GetPropertyValue<Guid>("UserId");
            }
            set
            {
                SetPropertyValue("UserId", value);
            }
        }

        /// <summary>
        /// 申请的用户Id
        /// </summary>
        public Guid? ToUserId
        {
            get
            {
                return GetPropertyValue<Guid?>("ToUserId");
            }
            set
            {
                SetPropertyValue("ToUserId", value);
            }
        }

        /// <summary>
        /// 状态（1添加成功 0 拒绝 -1关闭）
        /// </summary>
        public Byte States
        {
            get
            {
                return GetPropertyValue<Byte>("States");
            }
            set
            {
                SetPropertyValue("States", value);
            }
        }

        /// <summary>
        /// 类别
        /// </summary>
        public String CategoryId
        {
            get
            {
                return GetPropertyValue<String>("CategoryId");
            }
            set
            {
                SetPropertyValue("CategoryId", value);
            }
        }

        /// <summary>
        /// 留言
        /// </summary>
        public String Messages
        {
            get
            {
                return GetPropertyValue<String>("Messages");
            }
            set
            {
                SetPropertyValue("Messages", value);
            }
        }

        /// <summary>
        /// 添加时间
        /// </summary>
        public DateTime? AddTime
        {
            get
            {
                return GetPropertyValue<DateTime?>("AddTime");
            }
            set
            {
                SetPropertyValue("AddTime", value);
            }
        }

        /// <summary>
        /// 是否删除
        /// </summary>
        public Boolean? isDeleted
        {
            get
            {
                return GetPropertyValue<Boolean?>("isDeleted");
            }
            set
            {
                SetPropertyValue("isDeleted", value);
            }
        }
    }


}
