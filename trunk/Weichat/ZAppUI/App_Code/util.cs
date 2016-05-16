using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace ZAppUI.App_Code
{
    public class util
    {
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
    }
}