using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Moon.Orm;

namespace e3net.Mode.TireTreasureDB
{

    [Table("[TT_Insuran]", DbType.SqlServer)]
    [TablesPrimaryKey(PrimaryKeyType.CustomerGUID, typeof(Guid), "InsuranId")]
    public partial class TT_Insuran : EntityBase
    {

        /// <summary>
        /// 主键
        /// </summary>
        public Guid InsuranId
        {
            get { return GetPropertyValue<Guid>("InsuranId"); }
            set { SetPropertyValue("InsuranId", value); }
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
        /// 保险公司Id
        /// </summary>
        public Int32 InsuranCompanyId
        {
            get { return GetPropertyValue<Int32>("InsuranCompanyId"); }
            set { SetPropertyValue("InsuranCompanyId", value); }
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
        /// 金额
        /// </summary>
        public Decimal? MCost
        {
            get { return GetPropertyValue<Decimal?>("MCost"); }
            set { SetPropertyValue("MCost", value); }
        }

        /// <summary>
        /// 个人办理说明
        /// </summary>
        public String Explain
        {
            get { return GetPropertyValue<String>("Explain"); }
            set { SetPropertyValue("Explain", value); }
        }

        /// <summary>
        /// 依据（单号）
        /// </summary>
        public String NCode
        {
            get { return GetPropertyValue<String>("NCode"); }
            set { SetPropertyValue("NCode", value); }
        }

        /// <summary>
        /// 被保险人
        /// </summary>
        public String InsuranMan
        {
            get { return GetPropertyValue<String>("InsuranMan"); }
            set { SetPropertyValue("InsuranMan", value); }
        }

        /// <summary>
        /// 厂牌型号
        /// </summary>
        public String CarModel
        {
            get { return GetPropertyValue<String>("CarModel"); }
            set { SetPropertyValue("CarModel", value); }
        }

        /// <summary>
        /// 号牌号码
        /// </summary>
        public String LicensePlate
        {
            get { return GetPropertyValue<String>("LicensePlate"); }
            set { SetPropertyValue("LicensePlate", value); }
        }

        /// <summary>
        /// 发动机号
        /// </summary>
        public String EngineNumber
        {
            get { return GetPropertyValue<String>("EngineNumber"); }
            set { SetPropertyValue("EngineNumber", value); }
        }

        /// <summary>
        /// 险别
        /// </summary>
        public String RisksType
        {
            get { return GetPropertyValue<String>("RisksType"); }
            set { SetPropertyValue("RisksType", value); }
        }

        /// <summary>
        /// 车架号
        /// </summary>
        public String CarFrameNo
        {
            get { return GetPropertyValue<String>("CarFrameNo"); }
            set { SetPropertyValue("CarFrameNo", value); }
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
        /// 状态（2已办理1办理中0未付款-1关闭）
        /// </summary>
        public Byte States
        {
            get { return GetPropertyValue<Byte>("States"); }
            set { SetPropertyValue("States", value); }
        }

        /// <summary>
        /// 办理人
        /// </summary>
        public String HandlePerson
        {
            get { return GetPropertyValue<String>("HandlePerson"); }
            set { SetPropertyValue("HandlePerson", value); }
        }

        /// <summary>
        /// 开始时间
        /// </summary>
        public DateTime? StarTime
        {
            get { return GetPropertyValue<DateTime?>("StarTime"); }
            set { SetPropertyValue("StarTime", value); }
        }

        /// <summary>
        /// 结束时间
        /// </summary>
        public DateTime? EndTime
        {
            get { return GetPropertyValue<DateTime?>("EndTime"); }
            set { SetPropertyValue("EndTime", value); }
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

    [Table("[TT_Insuran]", DbType.SqlServer)]
    public  partial class TT_InsuranSet : MQLBase
    {
        public static  MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.SqlServer,"[TT_Insuran]",fields);
        }
        public static  MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.SqlServer,"[TT_Insuran]");
        }
        public static MQLBase SelectAllBut(params FieldBase[] fields)
        {
            return MQLBase.SelectAllBut(typeof(TT_InsuranSet),DbType.SqlServer,"[TT_Insuran]",fields);
        }

        /// <summary>
        /// 主键
        /// </summary>
        public static readonly FieldBase InsuranId = new FieldBase(DbType.SqlServer, "[TT_Insuran]", FieldType.OnlyPrimaryKey, "[InsuranId]");

        /// <summary>
        /// 用户Id
        /// </summary>
        public static readonly FieldBase UserId = new FieldBase(DbType.SqlServer, "[TT_Insuran]", FieldType.Common, "[UserId]");

        /// <summary>
        /// 保险公司Id
        /// </summary>
        public static readonly FieldBase InsuranCompanyId = new FieldBase(DbType.SqlServer, "[TT_Insuran]", FieldType.Common, "[InsuranCompanyId]");

        /// <summary>
        /// 类别
        /// </summary>
        public static readonly FieldBase CategoryId = new FieldBase(DbType.SqlServer, "[TT_Insuran]", FieldType.Common, "[CategoryId]");

        /// <summary>
        /// 省
        /// </summary>
        public static readonly FieldBase ProvinceCode = new FieldBase(DbType.SqlServer, "[TT_Insuran]", FieldType.Common, "[ProvinceCode]");

        /// <summary>
        /// 城市
        /// </summary>
        public static readonly FieldBase CityCode = new FieldBase(DbType.SqlServer, "[TT_Insuran]", FieldType.Common, "[CityCode]");

        /// <summary>
        /// 区
        /// </summary>
        public static readonly FieldBase AreaCode = new FieldBase(DbType.SqlServer, "[TT_Insuran]", FieldType.Common, "[AreaCode]");

        /// <summary>
        /// 金额
        /// </summary>
        public static readonly FieldBase MCost = new FieldBase(DbType.SqlServer, "[TT_Insuran]", FieldType.Common, "[MCost]");

        /// <summary>
        /// 个人办理说明
        /// </summary>
        public static readonly FieldBase Explain = new FieldBase(DbType.SqlServer, "[TT_Insuran]", FieldType.Common, "[Explain]");

        /// <summary>
        /// 依据（单号）
        /// </summary>
        public static readonly FieldBase NCode = new FieldBase(DbType.SqlServer, "[TT_Insuran]", FieldType.Common, "[NCode]");

        /// <summary>
        /// 被保险人
        /// </summary>
        public static readonly FieldBase InsuranMan = new FieldBase(DbType.SqlServer, "[TT_Insuran]", FieldType.Common, "[InsuranMan]");

        /// <summary>
        /// 厂牌型号
        /// </summary>
        public static readonly FieldBase CarModel = new FieldBase(DbType.SqlServer, "[TT_Insuran]", FieldType.Common, "[CarModel]");

        /// <summary>
        /// 号牌号码
        /// </summary>
        public static readonly FieldBase LicensePlate = new FieldBase(DbType.SqlServer, "[TT_Insuran]", FieldType.Common, "[LicensePlate]");

        /// <summary>
        /// 发动机号
        /// </summary>
        public static readonly FieldBase EngineNumber = new FieldBase(DbType.SqlServer, "[TT_Insuran]", FieldType.Common, "[EngineNumber]");

        /// <summary>
        /// 险别
        /// </summary>
        public static readonly FieldBase RisksType = new FieldBase(DbType.SqlServer, "[TT_Insuran]", FieldType.Common, "[RisksType]");

        /// <summary>
        /// 车架号
        /// </summary>
        public static readonly FieldBase CarFrameNo = new FieldBase(DbType.SqlServer, "[TT_Insuran]", FieldType.Common, "[CarFrameNo]");

        /// <summary>
        /// 备注
        /// </summary>
        public static readonly FieldBase Remarks = new FieldBase(DbType.SqlServer, "[TT_Insuran]", FieldType.Common, "[Remarks]");

        /// <summary>
        /// 状态（2已办理1办理中0未付款-1关闭）
        /// </summary>
        public static readonly FieldBase States = new FieldBase(DbType.SqlServer, "[TT_Insuran]", FieldType.Common, "[States]");

        /// <summary>
        /// 办理人
        /// </summary>
        public static readonly FieldBase HandlePerson = new FieldBase(DbType.SqlServer, "[TT_Insuran]", FieldType.Common, "[HandlePerson]");

        /// <summary>
        /// 开始时间
        /// </summary>
        public static readonly FieldBase StarTime = new FieldBase(DbType.SqlServer, "[TT_Insuran]", FieldType.Common, "[StarTime]");

        /// <summary>
        /// 结束时间
        /// </summary>
        public static readonly FieldBase EndTime = new FieldBase(DbType.SqlServer, "[TT_Insuran]", FieldType.Common, "[EndTime]");

        /// <summary>
        /// 添加时间
        /// </summary>
        public static readonly FieldBase CreateTime = new FieldBase(DbType.SqlServer, "[TT_Insuran]", FieldType.Common, "[CreateTime]");

        /// <summary>
        /// 修改时间
        /// </summary>
        public static readonly FieldBase UpdateTime = new FieldBase(DbType.SqlServer, "[TT_Insuran]", FieldType.Common, "[UpdateTime]");

        /// <summary>
        /// 是否有效
        /// </summary>
        public static readonly FieldBase isValid = new FieldBase(DbType.SqlServer, "[TT_Insuran]", FieldType.Common, "[isValid]");

        /// <summary>
        /// 是否删除
        /// </summary>
        public static readonly FieldBase isDeleted = new FieldBase(DbType.SqlServer, "[TT_Insuran]", FieldType.Common, "[isDeleted]");
    }

}
