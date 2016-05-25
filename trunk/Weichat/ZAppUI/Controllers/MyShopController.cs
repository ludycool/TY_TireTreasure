using e3net.common.SysMode;
using e3net.IDAL.TireMoneyDB;
using e3net.IDAL.TireTreasureDB;
using e3net.Mode.TireTreasureDB;
using Microsoft.Practices.Unity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ZAppUI.Models;

namespace ZAppUI.Controllers
{
    public class MyShopController : JsonNetController
    {
        //
        // GET: /VipShop/
        [Dependency]
        public ITT_ShopDao OPBiz { get; set; }

        [Dependency]
        public ITT_FilesTransactDao OPFileBiz { get; set; }


        [Dependency]
        public ITT_TransactionDao OPTranBiz { get; set; }


        [Dependency]
        public Iv_TT_UserCardDao OPCardBiz { get; set; }

        [Dependency]
        public ITM_OrderListDao OPOrderListdBiz { get; set; }

        string userId = "a3e8f66f-3552-4626-9ee2-f7ddd8b106d8";  //GetUData.User_Id;
        public ActionResult Index()
        {

            VipShopModel vshopMode = new VipShopModel();

            var mql = TT_ShopSet.SelectAll().Where(TT_ShopSet.UserId.Equal(userId));
            TT_Shop item = OPBiz.GetEntity(mql);

            if (item != null)
            {
                item.UserId = new Guid();//不显示给前端 安全考虑
                var mqlimg = TT_FilesTransactSet.SelectAll().Where(TT_FilesTransactSet.SourceTable.Equal("TT_Shop").And(TT_FilesTransactSet.ToId.Equal(item.ShopId.ToString())));
                List<TT_FilesTransact> listImg = OPFileBiz.GetOwnList(mqlimg);
                //List<FileJson> img = OPFileBiz.GetFList(listImg);
                //vshopMode.ImgList = img;

                vshopMode.ShopItem = item;
                ViewBag.listImgJson = OPFileBiz.GetJson(listImg);
                vshopMode.TransactionList = Transaction();

                //ViewData.Model = item;
                return View(vshopMode);
            }
            else {
                return RedirectToAction("Index", "User");
            }
           
        }
        /// <summary>
        /// 商品列表
        /// </summary>
        /// <returns></returns>
        public List<TT_Transaction> Transaction()
        {
            var mql = TT_TransactionSet.SelectAll().Where(TT_TransactionSet.ShopId.Equal(TT_ShopSet.Select(TT_ShopSet.ShopId).Where(TT_ShopSet.UserId.Equal(userId))));
            List<TT_Transaction> list = OPTranBiz.GetOwnList(mql);
            return list;
        }
        [HttpPost]
        public JsonResult GetList()
        {



            int pageIndex = Request["page"] == null ? 1 : int.Parse(Request["page"]);
            int pageSize = Request["rows"] == null ? 10 : int.Parse(Request["rows"]);
            ////字段排序
            //String sortField = Request["sortField"];
            //String sortOrder = Request["sortOrder"];
            PageClass pc = new PageClass();
            pc.sys_Fields = "*";
            pc.sys_Key = "ID";
            pc.sys_PageIndex = pageIndex;
            pc.sys_PageSize = pageSize;
            pc.sys_Table = "v_TM_OrderItem";
            pc.sys_Where = " UserId='" + userId + "' ";
            pc.sys_Order = "ItemId";

            var list2 = OPOrderListdBiz.GetPagingData(pc);
            Dictionary<string, object> dic = new Dictionary<string, object>();


            // var mql = RMS_ButtonsSet.Id.NotEqual("");
            dic.Add("rows", list2);
            dic.Add("total", pc.RCount);

            return Json(dic, JsonRequestBehavior.AllowGet);
        }
    }
}
