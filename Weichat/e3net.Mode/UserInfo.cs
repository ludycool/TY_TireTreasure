using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Moon.Orm;
namespace e3net.Mode
{
    [Table("[TT_AppUserInfo]", DbType.SqlServer)]
    [TablesPrimaryKey(PrimaryKeyType.AutoIncrease, typeof(Guid), "AppUserInfoId")]
    public class UserInfo : EntityBase
    {
        public Guid AppUserInfoId
        {
            get { return GetPropertyValue<Guid>("AppUserInfoId"); }
            set { SetPropertyValue("AppUserInfoId", value); }
        }
        public Guid UserId
        {
            get{return GetPropertyValue<Guid>("UserId");}
            set { SetPropertyValue("UserId", value); }
        }
        public string OpenId
        {
            get { return GetPropertyValue<string>("WeiXinId"); }
            set { SetPropertyValue("WeiXinId", value); }
        }

        public string NickName
        {
            get { return GetPropertyValue<string>("Nickname"); }
            set { SetPropertyValue("Nickname", value); }
        }

        public string HeadImg
        {
            get { return GetPropertyValue<string>("ImgeUrl"); }
            set { SetPropertyValue("ImgeUrl", value); }
        }
        public DateTime AddTime
        {
            get { return GetPropertyValue<DateTime>("AddTime"); }
            set { SetPropertyValue("AddTime",value); }
        }
    }
    [Table("[TT_AppUserInfo]", DbType.SqlServer)]
    public class UserInfoSet : MQLBase
    {
        public static new MQLBase Select(params FieldBase[] fields)
        {
            return MQLBase.Select(DbType.SqlServer, "[TT_AppUserInfo]", fields);
        }
        public static new MQLBase SelectAll()
        {
            return MQLBase.SelectAll(DbType.SqlServer, "[TT_AppUserInfo]");
        }

        public static readonly FieldBase AppUserInfoId = new FieldBase(DbType.SqlServer, "[TT_AppUserInfo]", FieldType.OnlyPrimaryKey, "[AppUserInfoId]");
        public static readonly FieldBase UserId = new FieldBase(DbType.SqlServer, "[TT_AppUserInfo]", FieldType.Common, "[UserId]");
        public static readonly FieldBase OpenId = new FieldBase(DbType.SqlServer, "[TT_AppUserInfo]", FieldType.Common, "[WeiXinId]");
        public static readonly FieldBase NickName = new FieldBase(DbType.SqlServer, "[TT_AppUserInfo]", FieldType.Common, "[Nickname]");
        public static readonly FieldBase headImg = new FieldBase(DbType.SqlServer, "[TT_AppUserInfo]", FieldType.Common, "[ImgeUrl]");
    }
}
