using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Moon.Orm;

namespace e3net.Mode.TireTreasureDB
{

    [Table("[TT_MissionsApply]", DbType.SqlServer)]
    [TablesPrimaryKey(PrimaryKeyType.CustomerGUID, typeof(Guid), "MissApplyId")]
    public partial class TT_MissionsApply : EntityBase
    {

        /// <summary>
        /// 主键
        /// </summary>
        public Guid MissApplyId
        {
            get { return GetPropertyValue<Guid>("MissApplyId"); }
            set { SetPropertyValue("MissApplyId", value); }
        }

        /// <summary>
        /// 任务Id
        /// </summary>
        public Guid MissionId
        {
            get { return GetPropertyValue<Guid>("MissionId"); }
            set { SetPropertyValue("MissionId", value); }
        }

        /// <summary>
        /// 申请人Id
        /// </summary>
        public Guid UserId
        {
            get { return GetPropertyValue<Guid>("UserId"); }
            set { SetPropertyValue("UserId", value); }
        }

        /// <summary>
        /// 个人申请说明
        /// </summary>
        public String Explain
        {
            get { return GetPropertyValue<String>("Explain"); }
            set { SetPropertyValue("Explain", value); }
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
        /// 申请状态
        /// </summary>
        public Byte ApplyStates
        {
            get { return GetPropertyValue<Byte>("ApplyStates"); }
            set { SetPropertyValue("ApplyStates", value); }
        }

        /// <summary>
        /// 申请时间
        /// </summary>
        public DateTime? ApplyTime
        {
            get { return GetPropertyValue<DateTime?>("ApplyTime"); }
            set { SetPropertyValue("ApplyTime", value); }
        }

        /// <summary>
        /// 开始进行时间
        /// </summary>
        public DateTime? StarTime
        {
            get { return GetPropertyValue<DateTime?>("StarTime"); }
            set { SetPropertyValue("StarTime", value); }
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

    [Table("[TT_MissionsApply]", DbType.SqlServer)]
    public  partial class TT_MissionsApplySet : MQLBase
    {
        public static  MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.SqlServer,"[TT_MissionsApply]",fields);
        }
        public static  MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.SqlServer,"[TT_MissionsApply]");
        }
        public static MQLBase SelectAllBut(params FieldBase[] fields)
        {
            return MQLBase.SelectAllBut(typeof(TT_MissionsApplySet),DbType.SqlServer,"[TT_MissionsApply]",fields);
        }

        /// <summary>
        /// 主键
        /// </summary>
        public static readonly FieldBase MissApplyId = new FieldBase(DbType.SqlServer, "[TT_MissionsApply]", FieldType.OnlyPrimaryKey, "[MissApplyId]");

        /// <summary>
        /// 任务Id
        /// </summary>
        public static readonly FieldBase MissionId = new FieldBase(DbType.SqlServer, "[TT_MissionsApply]", FieldType.Common, "[MissionId]");

        /// <summary>
        /// 申请人Id
        /// </summary>
        public static readonly FieldBase UserId = new FieldBase(DbType.SqlServer, "[TT_MissionsApply]", FieldType.Common, "[UserId]");

        /// <summary>
        /// 个人申请说明
        /// </summary>
        public static readonly FieldBase Explain = new FieldBase(DbType.SqlServer, "[TT_MissionsApply]", FieldType.Common, "[Explain]");

        /// <summary>
        /// 备注
        /// </summary>
        public static readonly FieldBase Remarks = new FieldBase(DbType.SqlServer, "[TT_MissionsApply]", FieldType.Common, "[Remarks]");

        /// <summary>
        /// 申请状态
        /// </summary>
        public static readonly FieldBase ApplyStates = new FieldBase(DbType.SqlServer, "[TT_MissionsApply]", FieldType.Common, "[ApplyStates]");

        /// <summary>
        /// 申请时间
        /// </summary>
        public static readonly FieldBase ApplyTime = new FieldBase(DbType.SqlServer, "[TT_MissionsApply]", FieldType.Common, "[ApplyTime]");

        /// <summary>
        /// 开始进行时间
        /// </summary>
        public static readonly FieldBase StarTime = new FieldBase(DbType.SqlServer, "[TT_MissionsApply]", FieldType.Common, "[StarTime]");

        /// <summary>
        /// 是否有效
        /// </summary>
        public static readonly FieldBase isValid = new FieldBase(DbType.SqlServer, "[TT_MissionsApply]", FieldType.Common, "[isValid]");

        /// <summary>
        /// 是否删除
        /// </summary>
        public static readonly FieldBase isDeleted = new FieldBase(DbType.SqlServer, "[TT_MissionsApply]", FieldType.Common, "[isDeleted]");
    }

}
