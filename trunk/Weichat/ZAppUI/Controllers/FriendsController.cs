using e3net.BLL.Base;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WeiChatMessageHandle;
using ZAppUI.App_Code;

namespace ZAppUI.Controllers
{
    public class FriendsController : BaseController
    {
        //
        // GET: /Friends/

        public ActionResult Index()
        {
            //判断是否已经注册
            if(!isRegister())
            {
                string redirect_uri = "http://test.luntaibaobao.com/register";
                string state = RouteData.Values["controller"].ToString();
                string url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + WechatParamList.APP_ID + "&redirect_uri=" + redirect_uri + "&response_type=code&scope=snsapi_userinfo&state=" + state + "#wechat_redirect";
                return Redirect(url);
            }

            FriendsBiz friendsBiz=new FriendsBiz();
            DataSet result=friendsBiz.ExecuteSqlToDataSet("EXEC	[TireTreasureDB].[dbo].[proc_GetUserInfoBy_v_FriendsList] '" + GetUData.OpenId + "'");
            if (result.Tables[0].Rows.Count>0)
            {
                List<Dictionary<string, string>> list = new List<Dictionary<string, string>>();
                for (int count = 0; count < result.Tables[0].Rows.Count; count++)
                {
                    Dictionary<string, string> dictionary = new Dictionary<string, string>();
                    dictionary.Add("Nickname", result.Tables[0].Rows[count]["Nickname"].ToString());
                    dictionary.Add("ImgeUrl", result.Tables[0].Rows[count]["ImgeUrl"].ToString());
                    dictionary.Add("AddTime", result.Tables[0].Rows[count]["AddTime"].ToString());
                    list.Add(dictionary);
                }
                ViewBag.friendList = list;
            }
            
            return View();
        }

    }
}
