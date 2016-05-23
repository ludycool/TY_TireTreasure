using com.unionpay.acp.sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ZAppUI.Controllers
{
    public class DepositController : BaseController
    {
        //
        // GET: /Deposit/

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult unionPay()
        {
            return View();
        }

        [HttpPost]
        public ActionResult unionPay(string money)
         {
            
            return View();
         }
         private void initParams()
         {
             Dictionary<string, string> param = new Dictionary<string, string>();

             param["version"] = "5.0.0";//版本号
             param["encoding"] = "UTF-8";//编码方式
             param["txnType"] = "01";//交易类型
             param["txnSubType"] = "01";//交易子类
             param["bizType"] = "000201";//业务类型
             param["signMethod"] = "01";//签名方法
             param["channelType"] = "08";//渠道类型
             param["accessType"] = "0";//接入类型
             param["frontUrl"] = SDKConfig.FrontUrl;  //前台通知地址      
             param["backUrl"] = SDKConfig.BackUrl;  //后台通知地址
             param["currencyCode"] = "156";//交易币种


         }
    }
}
