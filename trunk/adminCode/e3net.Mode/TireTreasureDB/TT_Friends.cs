using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Moon.Orm;

namespace e3net.Mode.TireTreasureDB
{

    [Table("[TT_Friends]", DbType.SqlServer)]
    [TablesPrimaryKey(PrimaryKeyType.CustomerGUID, typeof(Guid), "FriendsId")]
    public partial class TT_Friends : EntityBase
    {

        /// <summary>
        /// 主键
        /// </summary>
        public Guid FriendsId
        {
            get { return GetPropertyValue<Guid>("FriendsId"); }
            set { SetPropertyValue("FriendsId", value); }
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
        /// 好友Id
        /// </summary>
        public Guid? ToUserId
        {
            get { return GetPropertyValue<Guid?>("ToUserId"); }
            set { SetPropertyValue("ToUserId", value); }
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
        /// 名称备注
        /// </summary>
        public String SetName
        {
            get { return GetPropertyValue<String>("SetName"); }
            set { SetPropertyValue("SetName", value); }
        }

        /// <summary>
        /// 添加方式(扫一扫，搜索，通讯录)
        /// </summary>
        public String ByWay
        {
            get { return GetPropertyValue<String>("ByWay"); }
            set { SetPropertyValue("ByWay", value); }
        }

        /// <summary>
        /// 星标志(ture是 false否)
        /// </summary>
        public Boolean? StarSign
        {
            get { return GetPropertyValue<Boolean?>("StarSign"); }
            set { SetPropertyValue("StarSign", value); }
        }

        /// <summary>
        /// 加入黑名单(ture是 false否)
        /// </summary>
        public Boolean? BlackList
        {
            get { return GetPropertyValue<Boolean?>("BlackList"); }
            set { SetPropertyValue("BlackList", value); }
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
        /// 备注
        /// </summary>
        public String Remarks
        {
            get { return GetPropertyValue<String>("Remarks"); }
            set { SetPropertyValue("Remarks", value); }
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
        /// 更新时间
        /// </summary>
        public DateTime? UpdateTime
        {
            get { return GetPropertyValue<DateTime?>("UpdateTime"); }
            set { SetPropertyValue("UpdateTime", value); }
        }
    }

    [Table("[TT_Friends]", DbType.SqlServer)]
    public  partial class TT_FriendsSet : MQLBase
    {
        public static  MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.SqlServer,"[TT_Friends]",fields);
        }
        public static  MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.SqlServer,"[TT_Friends]");
        }
        public static MQLBase SelectAllBut(params FieldBase[] fields)
        {
            return MQLBase.SelectAllBut(typeof(TT_FriendsSet),DbType.SqlServer,"[TT_Friends]",fields);
        }

        /// <summary>
        /// 主键
        /// </summary>
        public static readonly FieldBase FriendsId = new FieldBase(DbType.SqlServer, "[TT_Friends]", FieldType.OnlyPrimaryKey, "[FriendsId]");

        /// <summary>
        /// 用户Id
        /// </summary>
        public static readonly FieldBase UserId = new FieldBase(DbType.SqlServer, "[TT_Friends]", FieldType.Common, "[UserId]");

        /// <summary>
        /// 好友Id
        /// </summary>
        public static readonly FieldBase ToUserId = new FieldBase(DbType.SqlServer, "[TT_Friends]", FieldType.Common, "[ToUserId]");

        /// <summary>
        /// 是否删除
        /// </summary>
        public static readonly FieldBase isDeleted = new FieldBase(DbType.SqlServer, "[TT_Friends]", FieldType.Common, "[isDeleted]");

        /// <summary>
        /// 名称备注
        /// </summary>
        public static readonly FieldBase SetName = new FieldBase(DbType.SqlServer, "[TT_Friends]", FieldType.Common, "[SetName]");

        /// <summary>
        /// 添加方式(扫一扫，搜索，通讯录)
        /// </summary>
        public static readonly FieldBase ByWay = new FieldBase(DbType.SqlServer, "[TT_Friends]", FieldType.Common, "[ByWay]");

        /// <summary>
        /// 星标志(ture是 false否)
        /// </summary>
        public static readonly FieldBase StarSign = new FieldBase(DbType.SqlServer, "[TT_Friends]", FieldType.Common, "[StarSign]");

        /// <summary>
        /// 加入黑名单(ture是 false否)
        /// </summary>
        public static readonly FieldBase BlackList = new FieldBase(DbType.SqlServer, "[TT_Friends]", FieldType.Common, "[BlackList]");

        /// <summary>
        /// 类别
        /// </summary>
        public static readonly FieldBase CategoryId = new FieldBase(DbType.SqlServer, "[TT_Friends]", FieldType.Common, "[CategoryId]");

        /// <summary>
        /// 备注
        /// </summary>
        public static readonly FieldBase Remarks = new FieldBase(DbType.SqlServer, "[TT_Friends]", FieldType.Common, "[Remarks]");

        /// <summary>
        /// 添加时间
        /// </summary>
        public static readonly FieldBase AddTime = new FieldBase(DbType.SqlServer, "[TT_Friends]", FieldType.Common, "[AddTime]");

        /// <summary>
        /// 更新时间
        /// </summary>
        public static readonly FieldBase UpdateTime = new FieldBase(DbType.SqlServer, "[TT_Friends]", FieldType.Common, "[UpdateTime]");
    }

}
