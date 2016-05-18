using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Moon.Orm;

namespace e3net.Mode.TireTreasureDB
{

    [Table("[TT_Messages]", DbType.SqlServer)]
    [TablesPrimaryKey(PrimaryKeyType.AutoIncrease, typeof(Int64), "MessagesId")]
    public partial class TT_Messages : EntityBase
    {

        /// <summary>
        /// 主键
        /// </summary>
        public Int64 MessagesId
        {
            get { return GetPropertyValue<Int64>("MessagesId"); }
            set { SetPropertyValue("MessagesId", value); }
        }

        /// <summary>
        /// 接收用户Id
        /// </summary>
        public Guid ReceiveUserId
        {
            get { return GetPropertyValue<Guid>("ReceiveUserId"); }
            set { SetPropertyValue("ReceiveUserId", value); }
        }

        /// <summary>
        /// 发送用户Id
        /// </summary>
        public Guid? SendUserId
        {
            get { return GetPropertyValue<Guid?>("SendUserId"); }
            set { SetPropertyValue("SendUserId", value); }
        }

        /// <summary>
        /// 标题
        /// </summary>
        public String Title
        {
            get { return GetPropertyValue<String>("Title"); }
            set { SetPropertyValue("Title", value); }
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
        /// 发送时间
        /// </summary>
        public DateTime? SendTime
        {
            get { return GetPropertyValue<DateTime?>("SendTime"); }
            set { SetPropertyValue("SendTime", value); }
        }

        /// <summary>
        /// 查看时间
        /// </summary>
        public DateTime? ViewTime
        {
            get { return GetPropertyValue<DateTime?>("ViewTime"); }
            set { SetPropertyValue("ViewTime", value); }
        }

        /// <summary>
        /// 是否查看
        /// </summary>
        public Boolean? isView
        {
            get { return GetPropertyValue<Boolean?>("isView"); }
            set { SetPropertyValue("isView", value); }
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

    [Table("[TT_Messages]", DbType.SqlServer)]
    public  partial class TT_MessagesSet : MQLBase
    {
        public static  MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.SqlServer,"[TT_Messages]",fields);
        }
        public static  MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.SqlServer,"[TT_Messages]");
        }
        public static MQLBase SelectAllBut(params FieldBase[] fields)
        {
            return MQLBase.SelectAllBut(typeof(TT_MessagesSet),DbType.SqlServer,"[TT_Messages]",fields);
        }

        /// <summary>
        /// 主键
        /// </summary>
        public static readonly FieldBase MessagesId = new FieldBase(DbType.SqlServer, "[TT_Messages]", FieldType.OnlyPrimaryKey, "[MessagesId]");

        /// <summary>
        /// 接收用户Id
        /// </summary>
        public static readonly FieldBase ReceiveUserId = new FieldBase(DbType.SqlServer, "[TT_Messages]", FieldType.Common, "[ReceiveUserId]");

        /// <summary>
        /// 发送用户Id
        /// </summary>
        public static readonly FieldBase SendUserId = new FieldBase(DbType.SqlServer, "[TT_Messages]", FieldType.Common, "[SendUserId]");

        /// <summary>
        /// 标题
        /// </summary>
        public static readonly FieldBase Title = new FieldBase(DbType.SqlServer, "[TT_Messages]", FieldType.Common, "[Title]");

        /// <summary>
        /// 详情
        /// </summary>
        public static readonly FieldBase Details = new FieldBase(DbType.SqlServer, "[TT_Messages]", FieldType.Common, "[Details]");

        /// <summary>
        /// 发送时间
        /// </summary>
        public static readonly FieldBase SendTime = new FieldBase(DbType.SqlServer, "[TT_Messages]", FieldType.Common, "[SendTime]");

        /// <summary>
        /// 查看时间
        /// </summary>
        public static readonly FieldBase ViewTime = new FieldBase(DbType.SqlServer, "[TT_Messages]", FieldType.Common, "[ViewTime]");

        /// <summary>
        /// 是否查看
        /// </summary>
        public static readonly FieldBase isView = new FieldBase(DbType.SqlServer, "[TT_Messages]", FieldType.Common, "[isView]");

        /// <summary>
        /// 是否删除
        /// </summary>
        public static readonly FieldBase isDeleted = new FieldBase(DbType.SqlServer, "[TT_Messages]", FieldType.Common, "[isDeleted]");
    }

}
