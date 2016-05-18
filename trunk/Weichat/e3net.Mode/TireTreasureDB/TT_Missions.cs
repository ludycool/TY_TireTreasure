using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Moon.Orm;

namespace e3net.Mode.TireTreasureDB
{

    [Table("[TT_Missions]", DbType.SqlServer)]
    [TablesPrimaryKey(PrimaryKeyType.CustomerGUID, typeof(Guid), "MissionId")]
    public partial class TT_Missions : EntityBase
    {

        /// <summary>
        /// 主键
        /// </summary>
        public Guid MissionId
        {
            get { return GetPropertyValue<Guid>("MissionId"); }
            set { SetPropertyValue("MissionId", value); }
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
        /// 省
        /// </summary>
        public String ProvinceCode
        {
            get { return GetPropertyValue<String>("ProvinceCode"); }
            set { SetPropertyValue("ProvinceCode", value); }
        }

        /// <summary>
        /// 城市
        /// </summary>
        public String CityCode
        {
            get { return GetPropertyValue<String>("CityCode"); }
            set { SetPropertyValue("CityCode", value); }
        }

        /// <summary>
        /// 区
        /// </summary>
        public String AreaCode
        {
            get { return GetPropertyValue<String>("AreaCode"); }
            set { SetPropertyValue("AreaCode", value); }
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
        /// 标题
        /// </summary>
        public String Titles
        {
            get { return GetPropertyValue<String>("Titles"); }
            set { SetPropertyValue("Titles", value); }
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
        /// 地址
        /// </summary>
        public String Address
        {
            get { return GetPropertyValue<String>("Address"); }
            set { SetPropertyValue("Address", value); }
        }

        /// <summary>
        /// 经度
        /// </summary>
        public Double? Longitude
        {
            get { return GetPropertyValue<Double?>("Longitude"); }
            set { SetPropertyValue("Longitude", value); }
        }

        /// <summary>
        /// 纬度
        /// </summary>
        public Double? Latitude
        {
            get { return GetPropertyValue<Double?>("Latitude"); }
            set { SetPropertyValue("Latitude", value); }
        }

        /// <summary>
        /// 赏金
        /// </summary>
        public Decimal? MoneyReward
        {
            get { return GetPropertyValue<Decimal?>("MoneyReward"); }
            set { SetPropertyValue("MoneyReward", value); }
        }

        /// <summary>
        /// 状态（2已完成1进行中0待接受-1关闭）
        /// </summary>
        public Byte States
        {
            get { return GetPropertyValue<Byte>("States"); }
            set { SetPropertyValue("States", value); }
        }

        /// <summary>
        /// 要求完成时间
        /// </summary>
        public DateTime? SpendTime
        {
            get { return GetPropertyValue<DateTime?>("SpendTime"); }
            set { SetPropertyValue("SpendTime", value); }
        }

        /// <summary>
        /// 要求完成（小时）
        /// </summary>
        public Int32? SpendHours
        {
            get { return GetPropertyValue<Int32?>("SpendHours"); }
            set { SetPropertyValue("SpendHours", value); }
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

    [Table("[TT_Missions]", DbType.SqlServer)]
    public  partial class TT_MissionsSet : MQLBase
    {
        public static  MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.SqlServer,"[TT_Missions]",fields);
        }
        public static  MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.SqlServer,"[TT_Missions]");
        }
        public static MQLBase SelectAllBut(params FieldBase[] fields)
        {
            return MQLBase.SelectAllBut(typeof(TT_MissionsSet),DbType.SqlServer,"[TT_Missions]",fields);
        }

        /// <summary>
        /// 主键
        /// </summary>
        public static readonly FieldBase MissionId = new FieldBase(DbType.SqlServer, "[TT_Missions]", FieldType.OnlyPrimaryKey, "[MissionId]");

        /// <summary>
        /// 用户Id
        /// </summary>
        public static readonly FieldBase UserId = new FieldBase(DbType.SqlServer, "[TT_Missions]", FieldType.Common, "[UserId]");

        /// <summary>
        /// 省
        /// </summary>
        public static readonly FieldBase ProvinceCode = new FieldBase(DbType.SqlServer, "[TT_Missions]", FieldType.Common, "[ProvinceCode]");

        /// <summary>
        /// 城市
        /// </summary>
        public static readonly FieldBase CityCode = new FieldBase(DbType.SqlServer, "[TT_Missions]", FieldType.Common, "[CityCode]");

        /// <summary>
        /// 区
        /// </summary>
        public static readonly FieldBase AreaCode = new FieldBase(DbType.SqlServer, "[TT_Missions]", FieldType.Common, "[AreaCode]");

        /// <summary>
        /// 类别
        /// </summary>
        public static readonly FieldBase CategoryId = new FieldBase(DbType.SqlServer, "[TT_Missions]", FieldType.Common, "[CategoryId]");

        /// <summary>
        /// 标题
        /// </summary>
        public static readonly FieldBase Titles = new FieldBase(DbType.SqlServer, "[TT_Missions]", FieldType.Common, "[Titles]");

        /// <summary>
        /// 详情
        /// </summary>
        public static readonly FieldBase Details = new FieldBase(DbType.SqlServer, "[TT_Missions]", FieldType.Common, "[Details]");

        /// <summary>
        /// 地址
        /// </summary>
        public static readonly FieldBase Address = new FieldBase(DbType.SqlServer, "[TT_Missions]", FieldType.Common, "[Address]");

        /// <summary>
        /// 经度
        /// </summary>
        public static readonly FieldBase Longitude = new FieldBase(DbType.SqlServer, "[TT_Missions]", FieldType.Common, "[Longitude]");

        /// <summary>
        /// 纬度
        /// </summary>
        public static readonly FieldBase Latitude = new FieldBase(DbType.SqlServer, "[TT_Missions]", FieldType.Common, "[Latitude]");

        /// <summary>
        /// 赏金
        /// </summary>
        public static readonly FieldBase MoneyReward = new FieldBase(DbType.SqlServer, "[TT_Missions]", FieldType.Common, "[MoneyReward]");

        /// <summary>
        /// 状态（2已完成1进行中0待接受-1关闭）
        /// </summary>
        public static readonly FieldBase States = new FieldBase(DbType.SqlServer, "[TT_Missions]", FieldType.Common, "[States]");

        /// <summary>
        /// 要求完成时间
        /// </summary>
        public static readonly FieldBase SpendTime = new FieldBase(DbType.SqlServer, "[TT_Missions]", FieldType.Common, "[SpendTime]");

        /// <summary>
        /// 要求完成（小时）
        /// </summary>
        public static readonly FieldBase SpendHours = new FieldBase(DbType.SqlServer, "[TT_Missions]", FieldType.Common, "[SpendHours]");

        /// <summary>
        /// 添加时间
        /// </summary>
        public static readonly FieldBase CreateTime = new FieldBase(DbType.SqlServer, "[TT_Missions]", FieldType.Common, "[CreateTime]");

        /// <summary>
        /// 修改时间
        /// </summary>
        public static readonly FieldBase UpdateTime = new FieldBase(DbType.SqlServer, "[TT_Missions]", FieldType.Common, "[UpdateTime]");

        /// <summary>
        /// 是否有效
        /// </summary>
        public static readonly FieldBase isValid = new FieldBase(DbType.SqlServer, "[TT_Missions]", FieldType.Common, "[isValid]");

        /// <summary>
        /// 是否删除
        /// </summary>
        public static readonly FieldBase isDeleted = new FieldBase(DbType.SqlServer, "[TT_Missions]", FieldType.Common, "[isDeleted]");
    }

}
