using e3net.BLL.Base;
using e3net.Mode.Base;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TZHSWEET.Common;
using ZAppUI.App_Code;
using ZAppUI.Models;
using e3net.BLL.Base;

namespace ZAppUI.Controllers
{
    public class AddFriendsController : BaseController
    {
        //
        // GET: /AddFriends/

        public ActionResult Index()
        {
            return View();
        }
        //通过手机号搜索用户
        [HttpPost]
        public ActionResult searchUserInfo(string userAccount)
        {
            if (userAccount == null || userAccount == "" || !util.isNumber(userAccount))
            {
                ViewData["IsShowAlert"] = true;
                ViewData["Alert"] = "请输入手机号";
                return View("index");
            }

            UserBiz userBiz = new UserBiz();
            DataSet result = userBiz.ExecuteSqlToDataSet("EXEC [TireTreasureDB].[dbo].[proc_GetUserLoginNameByLoginName] '" + userAccount + "'");
            if (result.Tables.Count > 0 && result.Tables[0].Rows.Count > 0)
            {
                string loginName = result.Tables[0].Rows[0]["LoginName"].ToString();
                this.TempData["LonginName"] = loginName;
            }
            return RedirectToAction("showUserInfo");
        }
        //显示搜索用户信息
        public ActionResult showUserInfo()
        {
            string loginName = this.TempData["LonginName"] as string;
            string openId = null;
            UserBiz userBiz = new UserBiz();
            DataSet result = userBiz.ExecuteSqlToDataSet("SELECT WeiXinId FROM [TireTreasureDB].[dbo].[TT_User] where LoginName='" + loginName + "'");
            if (result.Tables[0].Rows.Count > 0)
            {
                openId = result.Tables[0].Rows[0]["WeiXinId"].ToString();

                GetUData.Request_User_OpenId = openId;
                AppUserInfoBiz appUserInfoBiz = new AppUserInfoBiz();
                result = appUserInfoBiz.ExecuteSqlToDataSet("EXEC	[TireTreasureDB].[dbo].[proc_GetUserInfoByWeiXinId] '" + openId + "'");
                if (result.Tables[0].Rows.Count > 0)
                {
                    ViewBag.nickName = result.Tables[0].Rows[0]["Nickname"].ToString();
                    ViewBag.headImgUrl = result.Tables[0].Rows[0]["ImgeUrl"].ToString();


                    //TODO 判断搜索账号与搜索的状态关系 可分离出方法
                    RequestFriendsBiz requestFriendsBiz = new RequestFriendsBiz();
                    result = requestFriendsBiz.ExecuteSqlToDataSet("EXEC	[TireTreasureDB].[dbo].[proc_IsAlreadyFriend] '" + GetUData.OpenId + "','" + GetUData.Request_User_OpenId + "'");
                    if (result.Tables[0].Rows.Count > 0)
                    {
                        ViewBag.states = ConstantList.ADD_FRIENDS_STATUS_SUCCESS;
                    }
                    result = requestFriendsBiz.ExecuteSqlToDataSet("EXEC [TireTreasureDB].[dbo].[proc_GetRequestUserId] '" + GetUData.OpenId + "'," + ConstantList.ADD_FRIENDS_STATUS_REQUESTING + "");
                    if (result.Tables[0].Rows.Count > 0)
                    {
                        ViewBag.states = ConstantList.ADD_FRIENDS_STATUS_REQUESTING;
                    }

                }
            }
            return View();
        }
        //添加好友请求
        public void addToFriend()
        {
            RequestFriendsBiz requestFriendsBiz = new RequestFriendsBiz();

            DataSet result = requestFriendsBiz.ExecuteSqlToDataSet("EXEC [TireTreasureDB].[dbo].[proc_GetRequestUserId] '" + GetUData.OpenId + "'," + ConstantList.ADD_FRIENDS_STATUS_REQUESTING + "");
            //TODO 多次点击会生成多条数据 设置一个flag
            if (!(result.Tables[0].Rows.Count > 0))
            {
                UserBiz userBiz = new UserBiz();
                result = userBiz.ExecuteSqlToDataSet("SELECT UserId FROM [TireTreasureDB].[dbo].[TT_User] where WeiXinId='" + GetUData.OpenId + "'");
                if (result.Tables[0].Rows.Count > 0)
                {
                    RequestFriends requestFriends = new RequestFriends();

                    Guid userId = (Guid)result.Tables[0].Rows[0][0];
                    requestFriends.UserId = userId;

                    result = userBiz.ExecuteSqlToDataSet("SELECT UserId FROM [TireTreasureDB].[dbo].[TT_User] where WeiXinId='" + GetUData.Request_User_OpenId + "'");

                    Guid toUserId = (Guid)result.Tables[0].Rows[0][0];
                    requestFriends.ToUserId = toUserId;
                    requestFriends.States = ConstantList.ADD_FRIENDS_STATUS_REQUESTING;
                    requestFriends.AddTime = DateTime.Now;
                    requestFriends.isDeleted = false;

                    //RequestFriendsBiz requestFriendsBiz = new RequestFriendsBiz();
                    requestFriendsBiz.Add(requestFriends);
                }
            }
            else
            {
                //TODO
            }
        }
        //请求好友列表
        public ActionResult requestFriendList()
        {

            RequestFriendsBiz requestFriendsBiz = new RequestFriendsBiz();
            DataSet result = requestFriendsBiz.ExecuteSqlToDataSet("EXEC [dbo].[proc_GetUserInfoBy_v_RequestFriends] '" + GetUData.OpenId + "'");
            if (result.Tables[0].Rows.Count > 0)
            {
                List<Dictionary<string, string>> list = new List<Dictionary<string, string>>();
                for (int count = 0; count < result.Tables[0].Rows.Count; count++)
                {
                    Dictionary<string, string> dictionary = new Dictionary<string, string>();
                    dictionary.Add("Nickname", result.Tables[0].Rows[count]["Nickname"].ToString());
                    dictionary.Add("ImgeUrl", result.Tables[0].Rows[count]["ImgeUrl"].ToString());
                    dictionary.Add("States", result.Tables[0].Rows[count]["States"].ToString());
                    list.Add(dictionary);
                }
                ViewBag.messageList = list;
            }
            return View();
        }
        //同意

        public ActionResult agree()
        {
            string src = Request["src"];

            AppUserInfoBiz appUserInfoBiz = new AppUserInfoBiz();
            DataSet result = appUserInfoBiz.ExecuteSqlToDataSet("SELECT UserId FROM [TireTreasureDB].[dbo].[TT_AppUserInfo] where  ImgeUrl= '" + src + "'");

            if (result.Tables[0].Rows.Count > 0)
            {
                RequestFriendsBiz requestFriendsBiz = new RequestFriendsBiz();
                requestFriendsBiz.ExecuteSqlToDataSet("EXEC [TireTreasureDB].[dbo].[proc_UpdateRequestFriendsSates] '" + GetUData.OpenId + "'," + ConstantList.ADD_FRIENDS_STATUS_SUCCESS + "");

                Guid user = (Guid)result.Tables[0].Rows[0]["UserId"];
                result = requestFriendsBiz.ExecuteSqlToDataSet("SELECT UserId FROM [TireTreasureDB].[dbo].[TT_User] where  WeiXinId= '" + GetUData.OpenId + "'");

                DateTime now = DateTime.Now;
                Friends friends = new Friends();

                friends.FriendsId = Guid.NewGuid();
                friends.UserId = user;
                friends.ToUserId = (Guid)result.Tables[0].Rows[0]["UserId"];
                friends.isDeleted = false;
                friends.ByWay = ConstantList.FRIEND_TYPE_SEARCH;
                friends.BlackList = false;
                friends.AddTime = now;
                friends.UpdateTime = now;

                FriendsBiz friendsBiz = new FriendsBiz();
                friendsBiz.Add(friends);

                friends.FriendsId = Guid.NewGuid();
                friends.UserId = (Guid)result.Tables[0].Rows[0]["UserId"];
                friends.ToUserId = user;
                friendsBiz.Add(friends);
            }
            return RedirectToAction("Index", "Friends");
        }
        //拒绝
        public ActionResult reject()
        {
            RequestFriendsBiz requestFriendsBiz = new RequestFriendsBiz();
            requestFriendsBiz.ExecuteSqlToDataSet("EXEC [TireTreasureDB].[dbo].[proc_UpdateRequestFriendsSates] '" + GetUData.OpenId + "'," + ConstantList.ADD_FRIENDS_STATUS_REJECT + "");
            return RedirectToAction("Index", "Friends");
        }
    }
}
