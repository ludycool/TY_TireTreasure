using e3net.BLL.Base;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ZAppUI.Controllers
{
    public class FriendsController : BaseController
    {
        //
        // GET: /Friends/

        public ActionResult Index()
        {
            //string controller=RouteData.Values["controller"].ToString();
            //string action=RouteData.Values["action"].ToString();
            //isRegister(controller,action);

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
