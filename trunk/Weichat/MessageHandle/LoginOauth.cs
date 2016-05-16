using BH.Community.tools.ToolsHelper;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WeiChatMessageHandle.OpenId
{
    public class OauthLogin
    {
        public const int NICK_NAME = 0;
        public const int HEAD_IMG_URL = 1;

        static HttpUtil request = new HttpUtil();
        static JObject obj;

        public static string getOpenId(string code)
        {
            string url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=" + WechatParamList.APP_ID + "&secret=" + WechatParamList.APP_SECRET + "&code=" + code + "&grant_type=authorization_code";
            string result = request.GetRequest(url);

            obj = JObject.Parse(result);

            return obj["openid"].ToString();
        }

        public static string[] getUserInfo(string code)
        {
            string[] strArray = new String[2];
            if (code != null)
            {
                string url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=" + WechatParamList.APP_ID + "&secret=" + WechatParamList.APP_SECRET + "&code=" + code + "&grant_type=authorization_code";
                string result = request.GetRequest(url);

                obj = JObject.Parse(result);
                string token = obj["access_token"].ToString();
                string openid = obj["openid"].ToString();

                url = "https://api.weixin.qq.com/sns/userinfo?access_token=" + token + "&openid=" + openid + "&lang=zh_CN";
                result = request.GetRequest(url);

                obj = JObject.Parse(result);
                string nickName = obj["nickname"].ToString();
                string headImgUrl = obj["headimgurl"].ToString();

                strArray[NICK_NAME] = nickName;
                strArray[HEAD_IMG_URL] = headImgUrl;
            }
            return strArray;
        }
    }
}
