using BH.Community.tools.ToolsHelper;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WeiChatMessageHandle.OpenId
{
    public class GetOpenId
    {
        public const int OPEND_ID = 0;
        public const int NICK_NAME = 1;
        public const int HEAD_IMG_URL = 2;

        private const string APP_ID = "wx5c2b91a9bbef68b4";
        private const string APP_SECRET = "e895093b0a7227eac53199d8bcf4e031";

        private static HttpUtil request = new HttpUtil();
        private static JObject obj;

        public static string[] getAccessToken(string code)
        {
            string[] strArray = new String[3];
            if (code != null)
            {
                string url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=" + APP_ID + "&secret=" + APP_SECRET + "&code=" + code + "&grant_type=authorization_code";
                string result = request.GetRequest(url);

                obj = JObject.Parse(result);
                string token = obj["access_token"].ToString();
                string openid = obj["openid"].ToString();
                string refreshToken = obj["refresh_token"].ToString();
                //str = "access_token:" + token + "\n" + "openid:"+openid;

                string userResult = getUserInfo(token, openid);
                obj = JObject.Parse(userResult);
                string nickName = obj["nickname"].ToString();
                string headImgUrl = obj["headimgurl"].ToString();

                strArray[OPEND_ID] = openid;
                strArray[NICK_NAME] = nickName;
                strArray[HEAD_IMG_URL] = headImgUrl;
            }
            return strArray;
        }

        private static string getUserInfo(string token, string openid)
        {
            string url = "https://api.weixin.qq.com/sns/userinfo?access_token=" + token + "&openid=" + openid + "&lang=zh_CN";
            string result = request.GetRequest(url);
            return result;
        }
    }
}
