using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using TZHSWEET.Common;

namespace WeiChatMessageHandle.tool
{
    public class MultimediaHelper
    {

        /// <SUMMARY> 
        /// 下载保存多媒体文件,返回多媒体保存路径 
        /// </SUMMARY> 
        /// <PARAM name="ACCESS_TOKEN"></PARAM> 
        /// <PARAM name="MEDIA_ID"></PARAM> 
        /// <PARAM name="Path">路径</PARAM> 
        /// <PARAM name="fileName">文件名</PARAM> 
        /// <RETURNS>成功返回全文件路径，失败为空</RETURNS> 
        public string GetMultimedia(string ACCESS_TOKEN, string MEDIA_ID, string Path, string fileName)
        {
            string file = string.Empty;
            string content = string.Empty;
            string strpath = string.Empty;
            string savepath = string.Empty;
            string stUrl = "http://file.api.weixin.qq.com/cgi-bin/media/get?access_token=" + ACCESS_TOKEN + "&media_id=" + MEDIA_ID;

            HttpWebRequest req = (HttpWebRequest)HttpWebRequest.Create(stUrl);

            req.Method = "GET";
            using (WebResponse wr = req.GetResponse())
            {
                HttpWebResponse myResponse = (HttpWebResponse)req.GetResponse();

                strpath = myResponse.ResponseUri.ToString();
                //WriteLog("接收类别://" + myResponse.ContentType);
                WebClient mywebclient = new WebClient();
                //savepath = Server.MapPath("image") + "\\" + DateTime.Now.ToString("yyyyMMddHHmmssfff") + (new Random()).Next().ToString().Substring(0, 4) + ".jpg";

                savepath = Path + fileName;
                //WriteLog("路径://" + savepath);
                try
                {
                    mywebclient.DownloadFile(strpath, savepath);
                    file = savepath;
                }
                catch (Exception ex)
                {
                    savepath = ex.ToString();
                }

            }
            return file;
        }


        public class UploadMM
        {
            public string type { set; get; }
            public string media_id { set; get; }
            public string created_at { set; get; }
        }
        /// <SUMMARY> 
        /// 上传多媒体文件,返回 MediaId 
        /// </SUMMARY> 
        /// <PARAM name="ACCESS_TOKEN"></PARAM> 
        /// <PARAM name="Type">分别有图片（image）、语音（voice）、视频（video）和缩略图（thumb）</PARAM> 
        /// <PARAM name="filepath"></PARAM> 
        /// <RETURNS></RETURNS> 
        public string UploadMultimedia(string ACCESS_TOKEN, string Type, string filepath)
        {
            string result = "";
            string wxurl = "http://file.api.weixin.qq.com/cgi-bin/media/upload?access_token=" + ACCESS_TOKEN + "&type=" + Type;
            //WriteLog("上传路径:" + filepath);
            WebClient myWebClient = new WebClient();
            myWebClient.Credentials = CredentialCache.DefaultCredentials;
            try
            {
                byte[] responseArray = myWebClient.UploadFile(wxurl, "POST", filepath);
                result = System.Text.Encoding.Default.GetString(responseArray, 0, responseArray.Length);
                //WriteLog("上传result:" + result);
                //{"type":"TYPE","media_id":"MEDIA_ID","created_at":123456789}
                UploadMM _mode = JsonHelper.FromJson<UploadMM>(result);
                result = _mode.media_id;
            }
            catch (Exception ex)
            {
                result = "Error:" + ex.Message;
            }
            //WriteLog("上传MediaId:" + result);
            return result;
        }
        /// <summary>
        /// 微信上传多媒体文件
        /// </summary>
        /// <param name="filepath">文件绝对路径</param>
        public static UploadMM WxUpLoad(string filepath, string token, string Type)
        {
            using (WebClient client = new WebClient())
            {
                byte[] b = client.UploadFile(string.Format("http://file.api.weixin.qq.com/cgi-bin/media/upload?access_token={0}&type={1}", token, Type), filepath);//调用接口上传文件
                string retdata = Encoding.Default.GetString(b);//获取返回值
                if (retdata.Contains("media_id"))//判断返回值是否包含media_id，包含则说明上传成功，然后将返回的json字符串转换成json
                {
                return   JsonHelper.FromJson<UploadMM>(retdata);
                }
                else
                {//否则，写错误日志

                    //WriteBug(retdata);//写错误日志
                    return null;
                }
            }
        }
    }
}
