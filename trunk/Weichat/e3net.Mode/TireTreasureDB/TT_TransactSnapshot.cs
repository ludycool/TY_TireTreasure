using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Moon.Orm;

namespace e3net.Mode.TireTreasureDB
{

    [Table("[TT_TransactSnapshot]", DbType.SqlServer)]
    [TablesPrimaryKey(PrimaryKeyType.CustomerGUID, typeof(Guid), "SnapshotId")]
    public partial class TT_TransactSnapshot : EntityBase
    {

        /// <summary>
        /// 主键
        /// </summary>
        public Guid SnapshotId
        {
            get { return GetPropertyValue<Guid>("SnapshotId"); }
            set { SetPropertyValue("SnapshotId", value); }
        }

        /// <summary>
        /// 物品
        /// </summary>
        public Guid TransactionId
        {
            get { return GetPropertyValue<Guid>("TransactionId"); }
            set { SetPropertyValue("TransactionId", value); }
        }

        /// <summary>
        /// 店铺Id
        /// </summary>
        public Guid? ShopId
        {
            get { return GetPropertyValue<Guid?>("ShopId"); }
            set { SetPropertyValue("ShopId", value); }
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
        /// 图像
        /// </summary>
        public String ImageUrl
        {
            get { return GetPropertyValue<String>("ImageUrl"); }
            set { SetPropertyValue("ImageUrl", value); }
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
        /// 品牌
        /// </summary>
        public String Brand
        {
            get { return GetPropertyValue<String>("Brand"); }
            set { SetPropertyValue("Brand", value); }
        }

        /// <summary>
        /// 型号
        /// </summary>
        public String Models
        {
            get { return GetPropertyValue<String>("Models"); }
            set { SetPropertyValue("Models", value); }
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
        /// 电话
        /// </summary>
        public String Phone
        {
            get { return GetPropertyValue<String>("Phone"); }
            set { SetPropertyValue("Phone", value); }
        }

        /// <summary>
        /// 价格
        /// </summary>
        public Decimal? Price
        {
            get { return GetPropertyValue<Decimal?>("Price"); }
            set { SetPropertyValue("Price", value); }
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
        /// 呼叫量
        /// </summary>
        public Int32? CallCount
        {
            get { return GetPropertyValue<Int32?>("CallCount"); }
            set { SetPropertyValue("CallCount", value); }
        }

        /// <summary>
        /// 库存
        /// </summary>
        public Int32? Stock
        {
            get { return GetPropertyValue<Int32?>("Stock"); }
            set { SetPropertyValue("Stock", value); }
        }

        /// <summary>
        /// 已售
        /// </summary>
        public Int32? Sold
        {
            get { return GetPropertyValue<Int32?>("Sold"); }
            set { SetPropertyValue("Sold", value); }
        }

        /// <summary>
        /// 月销
        /// </summary>
        public Int32? MonthlySales
        {
            get { return GetPropertyValue<Int32?>("MonthlySales"); }
            set { SetPropertyValue("MonthlySales", value); }
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
        /// 版本号
        /// </summary>
        public Int32? Versions
        {
            get { return GetPropertyValue<Int32?>("Versions"); }
            set { SetPropertyValue("Versions", value); }
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
        /// 状态（2已审核、开启1，未审核0，关闭-1）
        /// </summary>
        public Int32? States
        {
            get { return GetPropertyValue<Int32?>("States"); }
            set { SetPropertyValue("States", value); }
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

    [Table("[TT_TransactSnapshot]", DbType.SqlServer)]
    public  partial class TT_TransactSnapshotSet : MQLBase
    {
        public static  MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.SqlServer,"[TT_TransactSnapshot]",fields);
        }
        public static  MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.SqlServer,"[TT_TransactSnapshot]");
        }
        public static MQLBase SelectAllBut(params FieldBase[] fields)
        {
            return MQLBase.SelectAllBut(typeof(TT_TransactSnapshotSet),DbType.SqlServer,"[TT_TransactSnapshot]",fields);
        }

        /// <summary>
        /// 主键
        /// </summary>
        public static readonly FieldBase SnapshotId = new FieldBase(DbType.SqlServer, "[TT_TransactSnapshot]", FieldType.OnlyPrimaryKey, "[SnapshotId]");

        /// <summary>
        /// 物品
        /// </summary>
        public static readonly FieldBase TransactionId = new FieldBase(DbType.SqlServer, "[TT_TransactSnapshot]", FieldType.Common, "[TransactionId]");

        /// <summary>
        /// 店铺Id
        /// </summary>
        public static readonly FieldBase ShopId = new FieldBase(DbType.SqlServer, "[TT_TransactSnapshot]", FieldType.Common, "[ShopId]");

        /// <summary>
        /// 标题
        /// </summary>
        public static readonly FieldBase Title = new FieldBase(DbType.SqlServer, "[TT_TransactSnapshot]", FieldType.Common, "[Title]");

        /// <summary>
        /// 图像
        /// </summary>
        public static readonly FieldBase ImageUrl = new FieldBase(DbType.SqlServer, "[TT_TransactSnapshot]", FieldType.Common, "[ImageUrl]");

        /// <summary>
        /// 类别
        /// </summary>
        public static readonly FieldBase CategoryId = new FieldBase(DbType.SqlServer, "[TT_TransactSnapshot]", FieldType.Common, "[CategoryId]");

        /// <summary>
        /// 品牌
        /// </summary>
        public static readonly FieldBase Brand = new FieldBase(DbType.SqlServer, "[TT_TransactSnapshot]", FieldType.Common, "[Brand]");

        /// <summary>
        /// 型号
        /// </summary>
        public static readonly FieldBase Models = new FieldBase(DbType.SqlServer, "[TT_TransactSnapshot]", FieldType.Common, "[Models]");

        /// <summary>
        /// 详情
        /// </summary>
        public static readonly FieldBase Details = new FieldBase(DbType.SqlServer, "[TT_TransactSnapshot]", FieldType.Common, "[Details]");

        /// <summary>
        /// 电话
        /// </summary>
        public static readonly FieldBase Phone = new FieldBase(DbType.SqlServer, "[TT_TransactSnapshot]", FieldType.Common, "[Phone]");

        /// <summary>
        /// 价格
        /// </summary>
        public static readonly FieldBase Price = new FieldBase(DbType.SqlServer, "[TT_TransactSnapshot]", FieldType.Common, "[Price]");

        /// <summary>
        /// 省
        /// </summary>
        public static readonly FieldBase ProvinceCode = new FieldBase(DbType.SqlServer, "[TT_TransactSnapshot]", FieldType.Common, "[ProvinceCode]");

        /// <summary>
        /// 城市
        /// </summary>
        public static readonly FieldBase CityCode = new FieldBase(DbType.SqlServer, "[TT_TransactSnapshot]", FieldType.Common, "[CityCode]");

        /// <summary>
        /// 区
        /// </summary>
        public static readonly FieldBase AreaCode = new FieldBase(DbType.SqlServer, "[TT_TransactSnapshot]", FieldType.Common, "[AreaCode]");

        /// <summary>
        /// 呼叫量
        /// </summary>
        public static readonly FieldBase CallCount = new FieldBase(DbType.SqlServer, "[TT_TransactSnapshot]", FieldType.Common, "[CallCount]");

        /// <summary>
        /// 库存
        /// </summary>
        public static readonly FieldBase Stock = new FieldBase(DbType.SqlServer, "[TT_TransactSnapshot]", FieldType.Common, "[Stock]");

        /// <summary>
        /// 已售
        /// </summary>
        public static readonly FieldBase Sold = new FieldBase(DbType.SqlServer, "[TT_TransactSnapshot]", FieldType.Common, "[Sold]");

        /// <summary>
        /// 月销
        /// </summary>
        public static readonly FieldBase MonthlySales = new FieldBase(DbType.SqlServer, "[TT_TransactSnapshot]", FieldType.Common, "[MonthlySales]");

        /// <summary>
        /// 赞
        /// </summary>
        public static readonly FieldBase Praises = new FieldBase(DbType.SqlServer, "[TT_TransactSnapshot]", FieldType.Common, "[Praises]");

        /// <summary>
        /// 点击数
        /// </summary>
        public static readonly FieldBase Clicks = new FieldBase(DbType.SqlServer, "[TT_TransactSnapshot]", FieldType.Common, "[Clicks]");

        /// <summary>
        /// 添加时间
        /// </summary>
        public static readonly FieldBase CreateTime = new FieldBase(DbType.SqlServer, "[TT_TransactSnapshot]", FieldType.Common, "[CreateTime]");

        /// <summary>
        /// 版本号
        /// </summary>
        public static readonly FieldBase Versions = new FieldBase(DbType.SqlServer, "[TT_TransactSnapshot]", FieldType.Common, "[Versions]");

        /// <summary>
        /// 修改时间
        /// </summary>
        public static readonly FieldBase UpdateTime = new FieldBase(DbType.SqlServer, "[TT_TransactSnapshot]", FieldType.Common, "[UpdateTime]");

        /// <summary>
        /// 状态（2已审核、开启1，未审核0，关闭-1）
        /// </summary>
        public static readonly FieldBase States = new FieldBase(DbType.SqlServer, "[TT_TransactSnapshot]", FieldType.Common, "[States]");

        /// <summary>
        /// 是否有效
        /// </summary>
        public static readonly FieldBase isValid = new FieldBase(DbType.SqlServer, "[TT_TransactSnapshot]", FieldType.Common, "[isValid]");

        /// <summary>
        /// 是否删除
        /// </summary>
        public static readonly FieldBase isDeleted = new FieldBase(DbType.SqlServer, "[TT_TransactSnapshot]", FieldType.Common, "[isDeleted]");
    }

}
