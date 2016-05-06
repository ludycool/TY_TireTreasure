using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Moon.Orm;

namespace e3net.Mode.TireTreasureDB
{

    [Table("[TT_CommentT]", DbType.SqlServer)]
    [TablesPrimaryKey(PrimaryKeyType.AutoIncrease, typeof(Int64), "CommentId")]
    public partial class TT_CommentT : EntityBase
    {

        /// <summary>
        /// 主键
        /// </summary>
        public Int64 CommentId
        {
            get { return GetPropertyValue<Int64>("CommentId"); }
            set { SetPropertyValue("CommentId", value); }
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
        /// 所属Id（物品）
        /// </summary>
        public Guid? PostId
        {
            get { return GetPropertyValue<Guid?>("PostId"); }
            set { SetPropertyValue("PostId", value); }
        }

        /// <summary>
        /// 打星级
        /// </summary>
        public Int32? Star
        {
            get { return GetPropertyValue<Int32?>("Star"); }
            set { SetPropertyValue("Star", value); }
        }

        /// <summary>
        /// 赞
        /// </summary>
        public Int32? Praises
        {
            get { return GetPropertyValue<Int32?>("Praises"); }
            set { SetPropertyValue("Praises", value); }
        }

        /// <summary>
        /// 举报
        /// </summary>
        public Int32? Reports
        {
            get { return GetPropertyValue<Int32?>("Reports"); }
            set { SetPropertyValue("Reports", value); }
        }

        /// <summary>
        /// 类别（）
        /// </summary>
        public String Category
        {
            get { return GetPropertyValue<String>("Category"); }
            set { SetPropertyValue("Category", value); }
        }

        /// <summary>
        /// 作者
        /// </summary>
        public String Author
        {
            get { return GetPropertyValue<String>("Author"); }
            set { SetPropertyValue("Author", value); }
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
        /// 添加时间
        /// </summary>
        public DateTime? AddTime
        {
            get { return GetPropertyValue<DateTime?>("AddTime"); }
            set { SetPropertyValue("AddTime", value); }
        }

        /// <summary>
        /// 状态（已审核、开启1，未审核0，关闭2）
        /// </summary>
        public Int32? States
        {
            get { return GetPropertyValue<Int32?>("States"); }
            set { SetPropertyValue("States", value); }
        }

        /// <summary>
        /// 是否有图（0没有，1有）
        /// </summary>
        public Boolean? IsHaveImg
        {
            get { return GetPropertyValue<Boolean?>("IsHaveImg"); }
            set { SetPropertyValue("IsHaveImg", value); }
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

    [Table("[TT_CommentT]", DbType.SqlServer)]
    public  partial class TT_CommentTSet : MQLBase
    {
        public static  MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.SqlServer,"[TT_CommentT]",fields);
        }
        public static  MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.SqlServer,"[TT_CommentT]");
        }
        public static MQLBase SelectAllBut(params FieldBase[] fields)
        {
            return MQLBase.SelectAllBut(typeof(TT_CommentTSet),DbType.SqlServer,"[TT_CommentT]",fields);
        }

        /// <summary>
        /// 主键
        /// </summary>
        public static readonly FieldBase CommentId = new FieldBase(DbType.SqlServer, "[TT_CommentT]", FieldType.OnlyPrimaryKey, "[CommentId]");

        /// <summary>
        /// 用户Id
        /// </summary>
        public static readonly FieldBase UserId = new FieldBase(DbType.SqlServer, "[TT_CommentT]", FieldType.Common, "[UserId]");

        /// <summary>
        /// 所属Id（物品）
        /// </summary>
        public static readonly FieldBase PostId = new FieldBase(DbType.SqlServer, "[TT_CommentT]", FieldType.Common, "[PostId]");

        /// <summary>
        /// 打星级
        /// </summary>
        public static readonly FieldBase Star = new FieldBase(DbType.SqlServer, "[TT_CommentT]", FieldType.Common, "[Star]");

        /// <summary>
        /// 赞
        /// </summary>
        public static readonly FieldBase Praises = new FieldBase(DbType.SqlServer, "[TT_CommentT]", FieldType.Common, "[Praises]");

        /// <summary>
        /// 举报
        /// </summary>
        public static readonly FieldBase Reports = new FieldBase(DbType.SqlServer, "[TT_CommentT]", FieldType.Common, "[Reports]");

        /// <summary>
        /// 类别（）
        /// </summary>
        public static readonly FieldBase Category = new FieldBase(DbType.SqlServer, "[TT_CommentT]", FieldType.Common, "[Category]");

        /// <summary>
        /// 作者
        /// </summary>
        public static readonly FieldBase Author = new FieldBase(DbType.SqlServer, "[TT_CommentT]", FieldType.Common, "[Author]");

        /// <summary>
        /// 详情
        /// </summary>
        public static readonly FieldBase Details = new FieldBase(DbType.SqlServer, "[TT_CommentT]", FieldType.Common, "[Details]");

        /// <summary>
        /// 添加时间
        /// </summary>
        public static readonly FieldBase AddTime = new FieldBase(DbType.SqlServer, "[TT_CommentT]", FieldType.Common, "[AddTime]");

        /// <summary>
        /// 状态（已审核、开启1，未审核0，关闭2）
        /// </summary>
        public static readonly FieldBase States = new FieldBase(DbType.SqlServer, "[TT_CommentT]", FieldType.Common, "[States]");

        /// <summary>
        /// 是否有图（0没有，1有）
        /// </summary>
        public static readonly FieldBase IsHaveImg = new FieldBase(DbType.SqlServer, "[TT_CommentT]", FieldType.Common, "[IsHaveImg]");

        /// <summary>
        /// 是否有效
        /// </summary>
        public static readonly FieldBase isValid = new FieldBase(DbType.SqlServer, "[TT_CommentT]", FieldType.Common, "[isValid]");

        /// <summary>
        /// 是否删除
        /// </summary>
        public static readonly FieldBase isDeleted = new FieldBase(DbType.SqlServer, "[TT_CommentT]", FieldType.Common, "[isDeleted]");
    }

}
