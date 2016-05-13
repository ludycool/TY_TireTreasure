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

    }
}