using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Moon.Orm;

namespace e3net.Mode.TireTreasureDB
{

    [Table("[TT_Shop]", DbType.SqlServer)]
    [TablesPrimaryKey(PrimaryKeyType.CustomerGUID, typeof(Guid), "ShopId")]
    public partial class TT_Shop : EntityBase
    {

        /// <summary>
        /// 主键
        /// </summary>
        public Guid ShopId
        {
            get { return GetPropertyValue<Guid>("ShopId"); }
            set { SetPropertyValue("ShopId", value); }
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
        /// 名称
        /// </summary>
        public String TName
        {
            get { return GetPropertyValue<String>("TName"); }
            set { SetPropertyValue("TName", value); }
        }

        /// <summary>
        /// 大图片
        /// </summary>
        public String ImageUrlMax
        {
            get { return GetPropertyValue<String>("ImageUrlMax"); }
            set { SetPropertyValue("ImageUrlMax", value); }
        }

        /// <summary>
        /// 图像
        /// </summary>
        public String ImageUrl
        {
            get { return GetPropertyValue<String>("ImageUrl"); }
            set { SetPropertyValue("ImageUrl", value); }
        }

        /// <summary>
        /// 星级
        /// </summary>
        public Byte Star
        {
            get { return GetPropertyValue<Byte>("Star"); }
            set { SetPropertyValue("Star", value); }
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
        /// 详情
        /// </summary>
        public String Details
        {
            get { return GetPropertyValue<String>("Details"); }
            set { SetPropertyValue("Details", value); }
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
        /// 创建人
        /// </summary>
        public Guid? CreateMan
        {
            get { return GetPropertyValue<Guid?>("CreateMan"); }
            set { SetPropertyValue("CreateMan", value); }
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
        /// 呼叫量
        /// </summary>
        public Int32? CallCount
        {
            get { return GetPropertyValue<Int32?>("CallCount"); }
            set { SetPropertyValue("CallCount", value); }
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
        /// 点击数
        /// </summary>
        public Int32? Clicks
        {
            get { return GetPropertyValue<Int32?>("Clicks"); }
            set { SetPropertyValue("Clicks", value); }
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
        /// 状态（2已审核、开启1，未审核0，关闭-1）
        /// </summary>
        public Byte States
        {
            get { return GetPropertyValue<Byte>("States"); }
            set { SetPropertyValue("States", value); }
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

    [Table("[TT_Shop]", DbType.SqlServer)]
    public  partial class TT_ShopSet : MQLBase
    {
        public static  MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.SqlServer,"[TT_Shop]",fields);
        }
        public static  MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.SqlServer,"[TT_Shop]");
        }
        public static MQLBase SelectAllBut(params FieldBase[] fields)
        {
            return MQLBase.SelectAllBut(typeof(TT_ShopSet),DbType.SqlServer,"[TT_Shop]",fields);
        }

        /// <summary>
        /// 主键
        /// </summary>
        public static readonly FieldBase ShopId = new FieldBase(DbType.SqlServer, "[TT_Shop]", FieldType.OnlyPrimaryKey, "[ShopId]");

        /// <summary>
        /// 用户Id
        /// </summary>
        public static readonly FieldBase UserId = new FieldBase(DbType.SqlServer, "[TT_Shop]", FieldType.Common, "[UserId]");

        /// <summary>
        /// 名称
        /// </summary>
        public static readonly FieldBase TName = new FieldBase(DbType.SqlServer, "[TT_Shop]", FieldType.Common, "[TName]");

        /// <summary>
        /// 大图片
        /// </summary>
        public static readonly FieldBase ImageUrlMax = new FieldBase(DbType.SqlServer, "[TT_Shop]", FieldType.Common, "[ImageUrlMax]");

        /// <summary>
        /// 图像
        /// </summary>
        public static readonly FieldBase ImageUrl = new FieldBase(DbType.SqlServer, "[TT_Shop]", FieldType.Common, "[ImageUrl]");

        /// <summary>
        /// 星级
        /// </summary>
        public static readonly FieldBase Star = new FieldBase(DbType.SqlServer, "[TT_Shop]", FieldType.Common, "[Star]");

        /// <summary>
        /// 电话
        /// </summary>
        public static readonly FieldBase Phone = new FieldBase(DbType.SqlServer, "[TT_Shop]", FieldType.Common, "[Phone]");

        /// <summary>
        /// 详情
        /// </summary>
        public static readonly FieldBase Details = new FieldBase(DbType.SqlServer, "[TT_Shop]", FieldType.Common, "[Details]");

        /// <summary>
        /// 类别
        /// </summary>
        public static readonly FieldBase CategoryId = new FieldBase(DbType.SqlServer, "[TT_Shop]", FieldType.Common, "[CategoryId]");

        /// <summary>
        /// 创建人
        /// </summary>
        public static readonly FieldBase CreateMan = new FieldBase(DbType.SqlServer, "[TT_Shop]", FieldType.Common, "[CreateMan]");

        /// <summary>
        /// 省
        /// </summary>
        public static readonly FieldBase ProvinceCode = new FieldBase(DbType.SqlServer, "[TT_Shop]", FieldType.Common, "[ProvinceCode]");

        /// <summary>
        /// 城市
        /// </summary>
        public static readonly FieldBase CityCode = new FieldBase(DbType.SqlServer, "[TT_Shop]", FieldType.Common, "[CityCode]");

        /// <summary>
        /// 区
        /// </summary>
        public static readonly FieldBase AreaCode = new FieldBase(DbType.SqlServer, "[TT_Shop]", FieldType.Common, "[AreaCode]");

        /// <summary>
        /// 地址
        /// </summary>
        public static readonly FieldBase Address = new FieldBase(DbType.SqlServer, "[TT_Shop]", FieldType.Common, "[Address]");

        /// <summary>
        /// 呼叫量
        /// </summary>
        public static readonly FieldBase CallCount = new FieldBase(DbType.SqlServer, "[TT_Shop]", FieldType.Common, "[CallCount]");

        /// <summary>
        /// 赞
        /// </summary>
        public static readonly FieldBase Praises = new FieldBase(DbType.SqlServer, "[TT_Shop]", FieldType.Common, "[Praises]");

        /// <summary>
        /// 点击数
        /// </summary>
        public static readonly FieldBase Clicks = new FieldBase(DbType.SqlServer, "[TT_Shop]", FieldType.Common, "[Clicks]");

        /// <summary>
        /// 添加时间
        /// </summary>
        public static readonly FieldBase CreateTime = new FieldBase(DbType.SqlServer, "[TT_Shop]", FieldType.Common, "[CreateTime]");

        /// <summary>
        /// 修改时间
        /// </summary>
        public static readonly FieldBase UpdateTime = new FieldBase(DbType.SqlServer, "[TT_Shop]", FieldType.Common, "[UpdateTime]");

        /// <summary>
        /// 经度
        /// </summary>
        public static readonly FieldBase Longitude = new FieldBase(DbType.SqlServer, "[TT_Shop]", FieldType.Common, "[Longitude]");

        /// <summary>
        /// 纬度
        /// </summary>
        public static readonly FieldBase Latitude = new FieldBase(DbType.SqlServer, "[TT_Shop]", FieldType.Common, "[Latitude]");

        /// <summary>
        /// 状态（2已审核、开启1，未审核0，关闭-1）
        /// </summary>
        public static readonly FieldBase States = new FieldBase(DbType.SqlServer, "[TT_Shop]", FieldType.Common, "[States]");

        /// <summary>
        /// 是否删除
        /// </summary>
        public static readonly FieldBase isDeleted = new FieldBase(DbType.SqlServer, "[TT_Shop]", FieldType.Common, "[isDeleted]");
    }

}
