using e3net.BLL.Base;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ZAppUI.Controllers
{
    public class UserController : BaseController
    {
        //
        // GET: /User/

        public ActionResult Index()
        {

            AppUserInfoBiz userInfoBiz = new AppUserInfoBiz();
            string openId = GetUData.OpenId;

            DataSet result = userInfoBiz.ExecuteSqlToDataSet("EXEC [TireTreasureDB].[dbo].[proc_SearchUserInfo] '" + openId + "'");
            if (result != null)
            {
                DataTable userInfoTable = result.Tables[0];
                try
                {
                    if (userInfoTable.Rows[0][0] != null)
                    {
                        Object nickName = userInfoTable.Rows[0]["Nickname"];
                        Object headImgUrl = userInfoTable.Rows[0]["ImgeUrl"];
                        ViewBag.nickName = nickName.ToString();
                        ViewBag.headImgUrl = headImgUrl.ToString();
                    }
                }
                catch (IndexOutOfRangeException Exception)
                {
                }
            }
            return View();
        }

    }
}
