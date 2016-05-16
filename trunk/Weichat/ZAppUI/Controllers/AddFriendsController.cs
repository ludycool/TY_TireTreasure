using e3net.BLL.Base;
using e3net.Mode.Base;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ZAppUI.App_Code;
using ZAppUI.Models;

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
       
        [HttpPost]
        public ActionResult searchUser(SearchUser user)
        {
            if (user.UserAccount == null || user.UserAccount == "" || !util.isNumber(user.UserAccount))
            {
                ViewData["IsShowAlert"] = true;
                ViewData["Alert"] = "请输入手机号";
                return View("index");
            }

            UserBiz userBiz = new UserBiz();
            DataSet result = userBiz.ExecuteSqlToDataSet("EXEC [TireTreasureDB].[dbo].[proc_GetUserLoginNameByLoginName] '" + user.UserAccount + "'");
            if (result.Tables.Count > 0 && result.Tables[0].Rows.Count > 0)
            {
                string loginName = result.Tables[0].Rows[0]["LoginName"].ToString();
                this.TempData["LonginName"] = loginName;
            }

            return RedirectToAction("showUserInfo");
        }
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
                }
            }
            return View();
        }

        public void addFriend()
        {
            UserBiz userBiz = new UserBiz();
            DataSet result = userBiz.ExecuteSqlToDataSet("SELECT UserId FROM [TireTreasureDB].[dbo].[TT_User] where WeiXinId='" + GetUData.OpenId + "'");
            if (result.Tables[0].Rows.Count > 0)
            {
                RequestFriends requestFriends = new RequestFriends();

                requestFriends.UserId = (Guid)result.Tables[0].Rows[0][0];

                result = userBiz.ExecuteSqlToDataSet("SELECT UserId FROM [TireTreasureDB].[dbo].[TT_User] where WeiXinId='" + GetUData.Request_User_OpenId + "'");

                requestFriends.ToUserId = (Guid)result.Tables[0].Rows[0][0];
                requestFriends.States = ConstantList.ADD_FRIENDS_STATUS_REQUESTING;
                requestFriends.AddTime=DateTime.Now;
                requestFriends.isDeleted=false;

                RequestFriendsBiz requestFriendsBiz = new RequestFriendsBiz();
                requestFriendsBiz.Add(requestFriends);
                //页面相应部分有bug 在库里生成两条数据
            }
            else
            {
                //TODO
            }
        }
    }
}
