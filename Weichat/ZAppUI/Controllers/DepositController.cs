using BH.Community.tools.ToolsHelper;
using com.unionpay.acp.sdk;
using e3net.BLL.Base;
using e3net.BLL.TireMoneyDB;
using e3net.Mode.TireMoneyDB;
using log4net;
using log4net.Repository.Hierarchy;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;
using System.Xml.Serialization;
using WeiChatMessageHandle;
using WeiChatMessageHandle.WechatPay;
using ZAppUI.App_Code;

namespace ZAppUI.Controllers
{
    public class DepositController : BaseController
    {
        //
        // GET: /Deposit/

        public ActionResult Index()
        {
            int money = int.Parse(getBalance());

            if (Request.Form.AllKeys.Length > 0)
            {
                NameValueCollection collection = Request.Form;
                string respCode = collection["respCode"];
                string respMsg = collection["respMsg"];
                string txnTime = collection["txnTime"];
                string orderId = collection["orderId"];

                string depositMoney = (int.Parse(collection["txnAmt"]) / 100).ToString();

                if (respCode.Equals("00") && respMsg.Equals("success") && txnTime.Equals(GetUData.Timestamp) && orderId.Equals(GetUData.OrderId))
                {
                    //TODO 确保订单的用户与当前用户ID一致
                    money = money + int.Parse(depositMoney);

                    updateUserBalance(money);

                    updateOrderInfo(orderId);

                    addWaterBill(orderId, depositMoney);
                }
            }
            ViewBag.balance = money;
            return View();
        }

        public ActionResult recharge()
        {
            GetUData.RechargeType = Request["type"];
            return View();
        }
        private string getClientIp()
        {
            string userIP = "未获取用户IP";

            try
            {
                if (System.Web.HttpContext.Current == null
            || System.Web.HttpContext.Current.Request == null
            || System.Web.HttpContext.Current.Request.ServerVariables == null)
                    return "";

                string CustomerIP = "";

                //CDN加速后取到的IP 
                CustomerIP = System.Web.HttpContext.Current.Request.Headers["Cdn-Src-Ip"];
                if (!string.IsNullOrEmpty(CustomerIP))
                {
                    return CustomerIP;
                }

                CustomerIP = System.Web.HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];


                if (!String.IsNullOrEmpty(CustomerIP))
                    return CustomerIP;

                if (System.Web.HttpContext.Current.Request.ServerVariables["HTTP_VIA"] != null)
                {
                    CustomerIP = System.Web.HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                    if (CustomerIP == null)
                        CustomerIP = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
                }
                else
                {
                    CustomerIP = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];

                }

                if (string.Compare(CustomerIP, "unknown", true) == 0)
                    return System.Web.HttpContext.Current.Request.UserHostAddress;
                return CustomerIP;
            }
            catch
            {
            }

            return userIP;
        }

        //money要求以分为单位，*100
        [HttpPost]
        public void recharge(int money)
        {
            if (GetUData.RechargeType.Equals("ali"))
            {

            }
            else if (GetUData.RechargeType.Equals("wechat"))
            {
                wechat(money * 100);
            }
            else if (GetUData.RechargeType.Equals("union"))
            {
                union(money * 100);
            }

        }
        private void wechat(int money)
        {
            initWechatParams(money);

        }
        private void initWechatParams(int money)
        {
            Dictionary<string, string> dictionary = new Dictionary<string, string>();

            dictionary["appid"] = "wx82a2b6f266d7308f";//公众账号ID
            dictionary["mch_id"] = WechatParamList.MCH_ID;//商户号
            dictionary["device_info"] = "WEB";//设备号
            dictionary["nonce_str"] = CreateNonceStr(16);//随机字符串

            dictionary["body"] = "Ipad mini  16G  白色";//商品描述
            dictionary["detail"] = "Ipad mini  16G  白色";//商品详情
            dictionary["attach"] = "深圳分店";//附加数据

            dictionary["out_trade_no"] = generateOrderSeriesNum();//商户订单号
            dictionary["fee_type"] = "CNY";//货币类型
            dictionary["total_fee"] = money.ToString();//总金额
            dictionary["spbill_create_ip"] = "180.136.199.139";//终端IP

            DateTime startTime = DateTime.Now;
            DateTime endTime = startTime.AddMinutes(6);
            dictionary["time_start"] = startTime.ToString("yyyyMMddHHmmss");//交易起始时间
            dictionary["time_expire"] = endTime.ToString("yyyyMMddHHmmss");//交易结束时间

            dictionary["goods_tag"] = "1";//商品标记
            dictionary["notify_url"] = "http://test.luntaibaobao.com/deposit/";//通知地址
            dictionary["trade_type"] = "JSAPI";//交易类型
            dictionary["product_id"] = "1";//商品ID
            dictionary["limit_pay"] = "no_credit";//指定支付方式
            dictionary["openid"] = "oYMlutyoGShOxctwMe8JUX3rbLj8";//用户标识
            dictionary = dictionary.OrderBy(o => o.Key).ToDictionary(o => o.Key, p => p.Value);

            dictionary["sign"] = getSign(dictionary);

            string str= string.Format(ReplyType.Pay, dictionary["appid"],dictionary["attach"],dictionary["body"],
            dictionary["detail"],dictionary["device_info"],dictionary["fee_type"],dictionary["goods_tag"],
            dictionary["limit_pay"],dictionary["mch_id"],dictionary["nonce_str"],dictionary["notify_url"],
            dictionary["openid"],dictionary["out_trade_no"],dictionary["product_id"],dictionary["spbill_create_ip"],
            dictionary["time_expire"],dictionary["time_start"],dictionary["total_fee"],dictionary["trade_type"], dictionary["sign"]);
       
            byte[] byteArray = Encoding.UTF8.GetBytes(str);

            HttpWebRequest request = (HttpWebRequest)HttpWebRequest.Create(WechatParamList.UNIFIED_PAY_URL);
            request.Method = "POST";
            request.ContentType = "application/x-www-form-urlencoded";
            request.ContentLength = byteArray.Length;

            Stream newStream = request.GetRequestStream();
            newStream.Write(byteArray, 0, byteArray.Length);//将请求的信息写入request
            newStream.Close();
            
            try
            {
                //向服务器发送请求
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                Stream s = response.GetResponseStream();
                StreamReader sr = new StreamReader(s, Encoding.GetEncoding("utf-8"));
                string strResult = sr.ReadToEnd();
                strResult=string.Format(ReplyType.Pay_Ready,strResult);
            }
            catch
            {
            }
           
        }
        private string getSign(Dictionary<string, string> dictionary)
        {

            string stringA = string.Empty;
            foreach (KeyValuePair<string, string> Item in dictionary)
            {
                stringA += Item.Key.ToString() + "=" + Item.Value.ToString() + "&";
            }
            stringA = stringA + "key=Ty123456Ty123456Ty123456Ty123456";
            stringA = MD5Util.GetMD5(stringA, "utf-8");
            return stringA;
        }
        private string CreateNonceStr(int length = 16)
        {
            return Guid.NewGuid().ToString().Replace("-", "").Substring(0, length > 32 ? 32 : length);
        }
        private void union(int money)
        {
            initParams(money);
        }
        private void initParams(int money)
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

            string orderId = generateOrderSeriesNum();
            string time = DateTime.Now.ToString("yyyyMMddHHmmss");
            GetUData.OrderId = orderId;
            GetUData.Timestamp = time;

            param["merId"] = "777290058131265";//商户号，请改自己的测试商户号，此处默认取demo演示页面传递的参数
            param["orderId"] = orderId;//商户订单号，8-32位数字字母，不能含“-”或“_”，此处默认取demo演示页面传递的参数，可以自行定制规则
            param["txnTime"] = time;//订单发送时间，格式为YYYYMMDDhhmmss，取北京时间，此处默认取demo演示页面传递的参数，参考取法： DateTime.Now.ToString("yyyyMMddHHmmss")
            param["txnAmt"] = money.ToString();//交易金额，单位分，此处默认取demo演示页面传递的参数

            addOrderInfo(orderId, (money / 100).ToString());

            AcpService.Sign(param, System.Text.Encoding.UTF8);
            string html = AcpService.CreateAutoFormHtml(SDKConfig.FrontTransUrl, param, System.Text.Encoding.UTF8);// 将SDKUtil产生的Html文档写入页面，从而引导用户浏览器重定向   
            Response.ContentEncoding = Encoding.UTF8; // 指定输出编码
            Response.Write(html);
        }
        //生成订单号
        private string generateOrderSeriesNum()
        {
            string seriesNum = ConstantList.ORDER_TYPE_DEPOSIT + Util.generateTimestamp();
            TM_OrderNoBiz orderNo = new TM_OrderNoBiz();
            DataSet result = orderNo.ExecuteSqlToDataSet("EXEC [TireTreasureDB].[dbo].[proc_OrderGenerate] '" + seriesNum + "'," + ConstantList.ORDER_SALE_TYPE_PERSON + "");

            return result.Tables[0].Rows[0][0].ToString();
        }
        //添加订单信息
        private void addOrderInfo(string orderId, string money)
        {
            TM_OrderList orderList = new TM_OrderList();

            orderList.OiId = Guid.NewGuid();
            orderList.UOId = getUserId();
            orderList.SOId = Guid.Empty;
            orderList.NCode = orderId;
            orderList.OMuney = decimal.Parse(money);
            orderList.SaleType = ConstantList.ORDER_SALE_TYPE_PERSON;
            orderList.States = ConstantList.ORDER_STATES_UNPAID;
            //TODO 支付类型判断
            orderList.PayType = ConstantList.ORDER_PAYMENT_TYPE_UNION;

            DateTime now = DateTime.Now;
            orderList.CreateTime = now;
            orderList.isDeleted = false;

            TM_OrderListBiz orderListBiz = new TM_OrderListBiz();
            orderListBiz.Add(orderList);
        }
        //更新用户余额
        private void updateUserBalance(int money)
        {
            TM_BalceBiz balanceBiz = new TM_BalceBiz();
            DataSet result = balanceBiz.ExecuteSqlToDataSet("EXEC	 [TireMoneyDB].[dbo].[proc_UpdateBalanceInfoByWeixinId] '" + GetUData.OpenId + "'," + money + "");
        }
        //订单完成后更新信息
        private void updateOrderInfo(string orderId)
        {
            TM_OrderListBiz orderListBiz = new TM_OrderListBiz();
            orderListBiz.ExecuteSqlToDataSet("EXEC	[TireMoneyDB].[dbo].[proc_UpdateOrderInfoByOrderId] '" + orderId + "'," + ConstantList.ORDER_STATES_SUCCESS + ",'" + DateTime.Now + "'");
        }
        //添加订单流水信息
        private void addWaterBill(string orderId, string depositMoney)
        {
            TM_WaterBill waterBill = new TM_WaterBill();
            waterBill.BiId = Guid.NewGuid();
            waterBill.UBId = getUserId();

            TM_OrderListBiz orderListBiz = new TM_OrderListBiz();
            DataSet result = orderListBiz.ExecuteSqlToDataSet("EXEC	[TireMoneyDB].[dbo].[proc_GetOrderIdByWeixinId] '" + GetUData.OpenId + "'");
            waterBill.FId = (Guid)result.Tables[0].Rows[0][0];

            waterBill.NCode = orderId;
            waterBill.WMney = decimal.Parse(depositMoney);

            //waterBill.Platform
            //waterBill.BType=ConstantList.WATER_BILL_TYPE_RECEIVE
            //TODO 类型与平台?

            DateTime now = DateTime.ParseExact(GetUData.Timestamp, "yyyyMMddHHmmss", null);
            waterBill.Years = (short)now.Year;
            waterBill.Months = (byte)now.Month;
            waterBill.Days = now.Month + "-" + now.Day;
            waterBill.Weeks = now.DayOfWeek.ToString();

            waterBill.CreateTime = DateTime.Now;
            waterBill.isDeleted = false;

            TM_WaterBillBiz waterBillBiz = new TM_WaterBillBiz();
            waterBillBiz.Add(waterBill);
        }
        //显示用户余额
        private string getBalance()
        {
            TM_BalceBiz balanceBiz = new TM_BalceBiz();
            DataSet result = balanceBiz.ExecuteSqlToDataSet("EXEC [TireMoneyDB].[dbo].[proc_CheckBalanceInfo] '" + GetUData.OpenId + "'");
            string num = result.Tables[0].Rows[0]["AMneys"].ToString();

            return num = num.Substring(0, num.IndexOf("."));
        }

    }
}
