using BH.Community.tools.ToolsHelper;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WeiChatMessageHandle
{
    public class GetJsParam
    {
        private static HttpUtil request = new HttpUtil();
        private static JObject obj;
        private static string getAccessToken()
        {
            string url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=" + WechatParamList.APP_ID + "&secret=" + WechatParamList.APP_SECRET + "";
            string result = request.GetRequest(url);
            obj = JObject.Parse(result);
            string token = obj["access_token"].ToString();
            return token;
        }
        public static string getJsApiTicket()
        {
            string accessToken = getAccessToken();
            string url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=" + accessToken + "&type=jsapi";
            string result = request.GetRequest(url);
            obj = JObject.Parse(result);
            string ticket = obj["ticket"].ToString();
            return ticket;
        }

        public static string generateNoncestr(int length = 16)
        {
            //string noncestr = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            //string str = "";
            //for (int i = 0; i < noncestr.Length; i++)
            //{
            //    Random ran = new Random();
            //    str = noncestr.Substring(ran.Next(0, noncestr.Length - 1), 1);
            //}
            //return str;
            return Guid.NewGuid().ToString().Replace("-", "").Substring(0, length > 32 ? 32 : length);
        }
        public static int generateTimeStamp()//创建时间戳
        {
            DateTime dateStart = new DateTime(1970, 1, 1, 0, 0, 0);//格林威治时间1970，1，1，0，0，0
            return (int)(DateTime.Now - dateStart).TotalSeconds;
        }      
    }
}
