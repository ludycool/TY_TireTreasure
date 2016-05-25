using e3net.BLL.Base;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace ZAppUI.App_Code
{
    public class Util
    {
        //openId是否存在
        public static bool isOpenIdExist(string openId)
        {
            UserBiz userBiz = new UserBiz();
            DataSet result = userBiz.ExecuteSqlToDataSet("EXEC   [TireTreasureDB].[dbo].[proc_IsOpenIdExist]'" + openId + "'");
            if (result.Tables[0].Rows.Count > 0)
                return true;
            return false;
        }
        
        //判断手机号
        public static bool isNumber(string s)
        {
            string dianxin = @"^1[3578][01379]\d{8}$";
            Regex d = new Regex(dianxin);
            string liantong = @"^1[34578][01256]\d{8}$";
            Regex l = new Regex(liantong);
            string yidong = @"^(1[34578][0123456789]\d{8})$";
            Regex y = new Regex(yidong);
            return d.IsMatch(s) || l.IsMatch(s) || y.IsMatch(s);
        }
        //创建时间戳
        public static int generateTimestamp()
        {
            DateTime dateStart = new DateTime(1970, 1, 1, 0, 0, 0);//格林威治时间1970，1，1，0，0，0
            return (int)(DateTime.Now - dateStart).TotalSeconds;
        } 
    }
}