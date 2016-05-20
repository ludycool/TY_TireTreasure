using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ZAppUI.App_Code
{
    public class ConstantList
    {
        /// <summary>
        /// 加密KEY
        /// </summary>
        public const string ENCRYPT_KEY="12345678";

        /// <summary>
        /// 密码加密
        /// </summary>
        public const string PASSWORD_ENCRYPT = "Password";

        /// <summary>
        /// 邀请注册状态（ 0 推荐中）
        /// </summary>
        public const int INVITING = 0;
        /// <summary>
        /// 邀请注册状态（1 推荐成功 ）
        /// </summary>
        public const int INVITE_SUCCESS = 1;


        /// <summary>
        /// 用户类型(1001 普通用户)
        /// </summary>
        public const string NORMAL_USER="1001";
        /// <summary>
        /// 用户类型(1011 VIP用户)
        /// </summary>
        public const string VIP = "1011";
        /// <summary>
        /// 用户类型(1012 商家)
        /// </summary>
        public const string SELLER = "1012";


        /// <summary>
        /// 注册类型(normal 关注)
        /// </summary>
        public const string REGISTER_TYPE_NORMAL = "normal";
        /// <summary>
        /// 注册类型(invite 邀请)
        /// </summary>
        public const string REGISTER_TYPE_INVITE = "invite";

        

        /// <summary>
        /// 添加好友状态(1 成功)
        /// </summary>
        public const int ADD_FRIENDS_STATUS_SUCCESS=1;
        /// <summary>
        /// 添加好友状态(2 邀请中)
        /// </summary>
        public const int ADD_FRIENDS_STATUS_REQUESTING=2;
        /// <summary>
        /// 添加好友状态(0 拒绝)
        /// </summary>
        public const int ADD_FRIENDS_STATUS_REJECT=0;
        /// <summary>
        /// 添加好友状态(-1 关闭)
        /// </summary>
        public const int ADD_FRIENDS_STATUS_SERVICE_CLOSE=-1;

        /// <summary>
        /// 添加方式(二维码)
        /// </summary>
        public const string FRIEND_TYPE_QR_CODE="QrCode";
        /// <summary>
        /// 添加好友状态(查找)
        /// </summary>
        public const string FRIEND_TYPE_SEARCH = "Search";
        /// <summary>
        /// 添加好友状态(通讯录)
        /// </summary>
        public const string FRIEND_TYPE_CONTACT = "Contact";
    }
}