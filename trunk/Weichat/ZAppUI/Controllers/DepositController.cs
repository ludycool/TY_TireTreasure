using com.unionpay.acp.sdk;
using e3net.BLL.Base;
using e3net.BLL.TireMoneyDB;
using e3net.Mode.TireMoneyDB;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using ZAppUI.App_Code;

namespace ZAppUI.Controllers
{
    public class DepositController : BaseController
    {
        //
        // GET: /Deposit/

        public ActionResult Index()
        {
            string num = getBalance();
            num = num.Substring(0, num.IndexOf("."));
            int money = int.Parse(num);

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
                    money = money + int.Parse(depositMoney);

                    TM_BalceBiz balanceBiz = new TM_BalceBiz();
                    DataSet result = balanceBiz.ExecuteSqlToDataSet("EXEC	 [TireMoneyDB].[dbo].[proc_UpdateBalanceInfoByWeixinId] '" + GetUData.OpenId + "'," + money + "");

                    updateOrderInfo(orderId);

                    addWaterBill(orderId, depositMoney, GetUData.Timestamp);
                }
                else
                {
                    //TODO
                }
            }
            ViewBag.balance = money;
            return View();
        }

        public ActionResult unionPay()
        {
            return View();
        }

        [HttpPost]
        public void unionPay(int money)
        {
            initParams(money * 100);
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
        //订单完成后更新信息
        private void updateOrderInfo(string orderId)
        {
            TM_OrderListBiz orderListBiz = new TM_OrderListBiz();
            orderListBiz.ExecuteSqlToDataSet("EXEC	[TireMoneyDB].[dbo].[proc_UpdateOrderInfoByOrderId] '" + orderId + "'," + ConstantList.ORDER_STATES_SUCCESS+ ",'"+DateTime.Now+"'");
        }
        //添加订单流水信息
        private void addWaterBill(string orderId, string depositMoney, string timestamp)
        {
            TM_WaterBill waterBill = new TM_WaterBill();
            waterBill.BiId=Guid.NewGuid();
            waterBill.UBId = getUserId();

            TM_OrderListBiz orderListBiz = new TM_OrderListBiz();
            DataSet result = orderListBiz.ExecuteSqlToDataSet("EXEC	[TireMoneyDB].[dbo].[proc_GetOrderIdByWeixinId] '" + GetUData.OpenId + "'");
            waterBill.FId = (Guid)result.Tables[0].Rows[0][0];

            waterBill.NCode = orderId;
            waterBill.WMney = decimal.Parse(depositMoney);

            //waterBill.Platform
            //waterBill.BType=ConstantList.WATER_BILL_TYPE_RECEIVE


            DateTime now = DateTime.ParseExact(timestamp, "yyyyMMddHHmmss", null);
            waterBill.Years = (short)now.Year;
            waterBill.Months = (byte)now.Month;
            waterBill.Weeks = now.DayOfWeek.ToString();

            waterBill.CreateTime = DateTime.Now;
            waterBill.isDeleted = false;

            TM_WaterBillBiz waterBillBiz = new TM_WaterBillBiz();
            waterBillBiz.Add(waterBill);
        }
        //显示用户余额
        public string getBalance()
        {
            TM_BalceBiz balanceBiz = new TM_BalceBiz();
            DataSet result = balanceBiz.ExecuteSqlToDataSet("EXEC [TireMoneyDB].[dbo].[proc_CheckBalanceInfo] '" + GetUData.OpenId + "'");
            return result.Tables[0].Rows[0]["AMneys"].ToString();
        }

    }
}
