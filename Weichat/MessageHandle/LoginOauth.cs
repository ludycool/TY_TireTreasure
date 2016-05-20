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
        public const string NICK_NAME = "NickName";
        public const string HEAD_IMG_URL ="ImgUrl";
        public const string OPEN_ID = "OpenId";

        static HttpUtil request = new HttpUtil();
        static JObject obj;

        public static string getOpenId(string code)
        {
            string url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=" + WechatParamList.APP_ID + "&secret=" + WechatParamList.APP_SECRET + "&code=" + code + "&grant_type=authorization_code";
            string result = request.GetRequest(url);

            obj = JObject.Parse(result);

            return obj["openid"].ToString();
        }

        public static Dictionary<string,string> getUserInfo(string code)
        {
            Dictionary<string,string> dictionary=new Dictionary<string,string>();
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

                dictionary.Add(OPEN_ID,openid);
                dictionary.Add(NICK_NAME,nickName);
                dictionary.Add(HEAD_IMG_URL,headImgUrl);
            }
            return dictionary;
        }
    }
}
