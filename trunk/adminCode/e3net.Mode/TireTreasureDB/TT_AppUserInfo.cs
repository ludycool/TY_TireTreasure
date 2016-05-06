using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Moon.Orm;

namespace e3net.Mode.TireTreasureDB
{

    [Table("[TT_AppUserInfo]", DbType.SqlServer)]
    [TablesPrimaryKey(PrimaryKeyType.CustomerGUID, typeof(Guid), "AppUserInfoId")]
    public partial class TT_AppUserInfo : EntityBase
    {

        /// <summary>
        /// 主键
        /// </summary>
        public Guid AppUserInfoId
        {
            get { return GetPropertyValue<Guid>("AppUserInfoId"); }
            set { SetPropertyValue("AppUserInfoId", value); }
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
        /// 昵称
        /// </summary>
        public String Nickname
        {
            get { return GetPropertyValue<String>("Nickname"); }
            set { SetPropertyValue("Nickname", value); }
        }

        /// <summary>
        /// 头像图片
        /// </summary>
        public String ImgeUrl
        {
            get { return GetPropertyValue<String>("ImgeUrl"); }
            set { SetPropertyValue("ImgeUrl", value); }
        }

        /// <summary>
        /// 电话
        /// </summary>
        public String Phone
        {
            get { return GetPropertyValue<String>("Phone"); }
            set { SetPropertyValue("Phone", value); }
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
        /// 地址
        /// </summary>
        public String Address
        {
            get { return GetPropertyValue<String>("Address"); }
            set { SetPropertyValue("Address", value); }
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
        /// 详情
        /// </summary>
        public String Details
        {
            get { return GetPropertyValue<String>("Details"); }
            set { SetPropertyValue("Details", value); }
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
        /// 位置更新时间
        /// </summary>
        public DateTime? LocationUpdateTime
        {
            get { return GetPropertyValue<DateTime?>("LocationUpdateTime"); }
            set { SetPropertyValue("LocationUpdateTime", value); }
        }

        /// <summary>
        /// 推荐我的人名
        /// </summary>
        public String References
        {
            get { return GetPropertyValue<String>("References"); }
            set { SetPropertyValue("References", value); }
        }

        /// <summary>
        /// 推荐我的人Id
        /// </summary>
        public Guid? ReferencesId
        {
            get { return GetPropertyValue<Guid?>("ReferencesId"); }
            set { SetPropertyValue("ReferencesId", value); }
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

        /// <summary>
        /// 是否删除
        /// </summary>
        public Boolean? isDeleted
        {
            get { return GetPropertyValue<Boolean?>("isDeleted"); }
            set { SetPropertyValue("isDeleted", value); }
        }
    }

    [Table("[TT_AppUserInfo]", DbType.SqlServer)]
    public  partial class TT_AppUserInfoSet : MQLBase
    {
        public static  MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.SqlServer,"[TT_AppUserInfo]",fields);
        }
        public static  MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.SqlServer,"[TT_AppUserInfo]");
        }
        public static MQLBase SelectAllBut(params FieldBase[] fields)
        {
            return MQLBase.SelectAllBut(typeof(TT_AppUserInfoSet),DbType.SqlServer,"[TT_AppUserInfo]",fields);
        }

        /// <summary>
        /// 主键
        /// </summary>
        public static readonly FieldBase AppUserInfoId = new FieldBase(DbType.SqlServer, "[TT_AppUserInfo]", FieldType.OnlyPrimaryKey, "[AppUserInfoId]");

        /// <summary>
        /// 用户Id
        /// </summary>
        public static readonly FieldBase UserId = new FieldBase(DbType.SqlServer, "[TT_AppUserInfo]", FieldType.Common, "[UserId]");

        /// <summary>
        /// 昵称
        /// </summary>
        public static readonly FieldBase Nickname = new FieldBase(DbType.SqlServer, "[TT_AppUserInfo]", FieldType.Common, "[Nickname]");

        /// <summary>
        /// 头像图片
        /// </summary>
        public static readonly FieldBase ImgeUrl = new FieldBase(DbType.SqlServer, "[TT_AppUserInfo]", FieldType.Common, "[ImgeUrl]");

        /// <summary>
        /// 电话
        /// </summary>
        public static readonly FieldBase Phone = new FieldBase(DbType.SqlServer, "[TT_AppUserInfo]", FieldType.Common, "[Phone]");

        /// <summary>
        /// 省
        /// </summary>
        public static readonly FieldBase ProvinceCode = new FieldBase(DbType.SqlServer, "[TT_AppUserInfo]", FieldType.Common, "[ProvinceCode]");

        /// <summary>
        /// 城市
        /// </summary>
        public static readonly FieldBase CityCode = new FieldBase(DbType.SqlServer, "[TT_AppUserInfo]", FieldType.Common, "[CityCode]");

        /// <summary>
        /// 区
        /// </summary>
        public static readonly FieldBase AreaCode = new FieldBase(DbType.SqlServer, "[TT_AppUserInfo]", FieldType.Common, "[AreaCode]");

        /// <summary>
        /// 地址
        /// </summary>
        public static readonly FieldBase Address = new FieldBase(DbType.SqlServer, "[TT_AppUserInfo]", FieldType.Common, "[Address]");

        /// <summary>
        /// 类别
        /// </summary>
        public static readonly FieldBase CategoryId = new FieldBase(DbType.SqlServer, "[TT_AppUserInfo]", FieldType.Common, "[CategoryId]");

        /// <summary>
        /// 详情
        /// </summary>
        public static readonly FieldBase Details = new FieldBase(DbType.SqlServer, "[TT_AppUserInfo]", FieldType.Common, "[Details]");

        /// <summary>
        /// 经度
        /// </summary>
        public static readonly FieldBase Longitude = new FieldBase(DbType.SqlServer, "[TT_AppUserInfo]", FieldType.Common, "[Longitude]");

        /// <summary>
        /// 纬度
        /// </summary>
        public static readonly FieldBase Latitude = new FieldBase(DbType.SqlServer, "[TT_AppUserInfo]", FieldType.Common, "[Latitude]");

        /// <summary>
        /// 位置更新时间
        /// </summary>
        public static readonly FieldBase LocationUpdateTime = new FieldBase(DbType.SqlServer, "[TT_AppUserInfo]", FieldType.Common, "[LocationUpdateTime]");

        /// <summary>
        /// 推荐我的人名
        /// </summary>
        public static readonly FieldBase References = new FieldBase(DbType.SqlServer, "[TT_AppUserInfo]", FieldType.Common, "[References]");

        /// <summary>
        /// 推荐我的人Id
        /// </summary>
        public static readonly FieldBase ReferencesId = new FieldBase(DbType.SqlServer, "[TT_AppUserInfo]", FieldType.Common, "[ReferencesId]");

        /// <summary>
        /// 添加时间
        /// </summary>
        public static readonly FieldBase AddTime = new FieldBase(DbType.SqlServer, "[TT_AppUserInfo]", FieldType.Common, "[AddTime]");

        /// <summary>
        /// 更新时间
        /// </summary>
        public static readonly FieldBase UpdateTime = new FieldBase(DbType.SqlServer, "[TT_AppUserInfo]", FieldType.Common, "[UpdateTime]");

        /// <summary>
        /// 是否删除
        /// </summary>
        public static readonly FieldBase isDeleted = new FieldBase(DbType.SqlServer, "[TT_AppUserInfo]", FieldType.Common, "[isDeleted]");
    }

}
