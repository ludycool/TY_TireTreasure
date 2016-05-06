using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Moon.Orm;

namespace e3net.Mode.TireTreasureDB
{

    [Table("[TT_Levels]", DbType.SqlServer)]
    [TablesPrimaryKey(PrimaryKeyType.AutoIncrease, typeof(Int32), "LevelsId")]
    public partial class TT_Levels : EntityBase
    {

        /// <summary>
        /// 主键
        /// </summary>
        public Int32 LevelsId
        {
            get { return GetPropertyValue<Int32>("LevelsId"); }
            set { SetPropertyValue("LevelsId", value); }
        }

        /// <summary>
        /// 名称
        /// </summary>
        public String TName
        {
            get { return GetPropertyValue<String>("TName"); }
            set { SetPropertyValue("TName", value); }
        }

        /// <summary>
        /// 等级
        /// </summary>
        public Int32? Levels
        {
            get { return GetPropertyValue<Int32?>("Levels"); }
            set { SetPropertyValue("Levels", value); }
        }

        /// <summary>
        /// 所需积分
        /// </summary>
        public Int32? Scores
        {
            get { return GetPropertyValue<Int32?>("Scores"); }
            set { SetPropertyValue("Scores", value); }
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

    [Table("[TT_Levels]", DbType.SqlServer)]
    public  partial class TT_LevelsSet : MQLBase
    {
        public static  MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.SqlServer,"[TT_Levels]",fields);
        }
        public static  MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.SqlServer,"[TT_Levels]");
        }
        public static MQLBase SelectAllBut(params FieldBase[] fields)
        {
            return MQLBase.SelectAllBut(typeof(TT_LevelsSet),DbType.SqlServer,"[TT_Levels]",fields);
        }

        /// <summary>
        /// 主键
        /// </summary>
        public static readonly FieldBase LevelsId = new FieldBase(DbType.SqlServer, "[TT_Levels]", FieldType.OnlyPrimaryKey, "[LevelsId]");

        /// <summary>
        /// 名称
        /// </summary>
        public static readonly FieldBase TName = new FieldBase(DbType.SqlServer, "[TT_Levels]", FieldType.Common, "[TName]");

        /// <summary>
        /// 等级
        /// </summary>
        public static readonly FieldBase Levels = new FieldBase(DbType.SqlServer, "[TT_Levels]", FieldType.Common, "[Levels]");

        /// <summary>
        /// 所需积分
        /// </summary>
        public static readonly FieldBase Scores = new FieldBase(DbType.SqlServer, "[TT_Levels]", FieldType.Common, "[Scores]");

        /// <summary>
        /// 详情
        /// </summary>
        public static readonly FieldBase Details = new FieldBase(DbType.SqlServer, "[TT_Levels]", FieldType.Common, "[Details]");

        /// <summary>
        /// 添加时间
        /// </summary>
        public static readonly FieldBase CreateTime = new FieldBase(DbType.SqlServer, "[TT_Levels]", FieldType.Common, "[CreateTime]");

        /// <summary>
        /// 修改时间
        /// </summary>
        public static readonly FieldBase UpdateTime = new FieldBase(DbType.SqlServer, "[TT_Levels]", FieldType.Common, "[UpdateTime]");

        /// <summary>
        /// 是否有效
        /// </summary>
        public static readonly FieldBase isValid = new FieldBase(DbType.SqlServer, "[TT_Levels]", FieldType.Common, "[isValid]");

        /// <summary>
        /// 是否删除
        /// </summary>
        public static readonly FieldBase isDeleted = new FieldBase(DbType.SqlServer, "[TT_Levels]", FieldType.Common, "[isDeleted]");
    }

}
