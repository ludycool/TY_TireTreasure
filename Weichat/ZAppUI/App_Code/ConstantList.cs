using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ZAppUI.App_Code
{
    public class ConstantList
    {
        public const string ENCRYPT_KEY="12345678";
        /// <summary>
        /// 状态（ 0 推荐中）
        /// </summary>
        public const int INVITING = 0;
        /// <summary>
        /// 状态（1推荐成功 ）
        /// </summary>
        public const int INVITE_SUCCESS = 1;

        public const string NORMAL_USER="1001";
        public const string VIP = "1011";
        public const string SELLER = "1012";

        public const string NORMAL_REGISTER="normal";
        public const string INVITE_REGISTER="invite";

        public const string PASSWORD_ENCRYPT="Password";

        public const int ADD_FRIENDS_STATUS_SUCCESS=1;
        public const int ADD_FRIENDS_STATUS_REQUESTING=2;
        public const int ADD_FRIENDS_STATUS_REJECT=0;
        public const int ADD_FRIENDS_STATUS_SERVICE_CLOSE=-1;

        public const string FRIEND_TYPE_QR_CODE="QrCode";
        public const string FRIEND_TYPE_SEARCH = "Search";
        public const string FRIEND_TYPE_CONTACT = "Contact";
    }
}