using e3net.BLL.Base;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using e3net.BLL.Money;
namespace ZAppUI.Controllers
{
    public class UserController : BaseController
    {
        //
        // GET: /User/
        public ActionResult Index()
        {
            showUserInfo();

            return View();
        }
        private void showUserInfo()
        {
            getNickName();
            getBalance();
        }
        //显示用户昵称头像
        private void getNickName()
        {
            AppUserInfoBiz userInfoBiz = new AppUserInfoBiz();
            string openId = GetUData.OpenId;

            DataSet result = userInfoBiz.ExecuteSqlToDataSet("EXEC	[TireTreasureDB].[dbo].[proc_SearchUserInfo] '" + openId + "'");
            if (result.Tables.Count > 0 && result.Tables[0].Rows.Count > 0)
            {

                Object nickName = result.Tables[0].Rows[0]["Nickname"];
                Object headImgUrl = result.Tables[0].Rows[0]["ImgeUrl"];

                ViewBag.nickName = nickName.ToString();
                ViewBag.headImgUrl = headImgUrl.ToString();

            }
        }
        //显示用户余额
        private void getBalance()
        {


            string openId = GetUData.OpenId;

            BalanceBiz balanceBiz = new BalanceBiz();
            DataSet result = balanceBiz.ExecuteSqlToDataSet("EXEC [TireMoneyDB].[dbo].[proc_CheckBalanceInfo] '" + openId + "'");
            if (result.Tables.Count > 0 && result.Tables[0].Rows.Count > 0)
            {
                Object balance = result.Tables[0].Rows[0]["AMneys"];
                ViewBag.balance = balance.ToString();
            }
            else
            {

                createUserBalanceInfo(openId);
            }
        }
        private void createUserBalanceInfo(string openId)
        {
            BalanceBiz balanceBiz = new BalanceBiz();
            Guid baId = Guid.NewGuid();
            DateTime now = DateTime.Now;
            balanceBiz.ExecuteSqlToDataSet("EXEC [TireMoneyDB].[dbo].[proc_AddUserBalanceInfo] '" + openId + "','" + now + "','" + now + "'");
        }
    }
}
