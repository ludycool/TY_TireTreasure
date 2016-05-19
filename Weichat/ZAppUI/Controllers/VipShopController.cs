using e3net.common.SysMode;
using e3net.IDAL.TireTreasureDB;
using e3net.Mode.TireTreasureDB;
using Microsoft.Practices.Unity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ZAppUI.Models;

namespace ZAppUI.Controllers
{
    public class VipShopController : JsonNetController
    {
        //
        // GET: /VipShop/
        [Dependency]
        public ITT_ShopDao OPBiz { get; set; }

        [Dependency]
        public ITT_FilesTransactDao OPFileBiz { get; set; }


        [Dependency]
        public ITT_TransactionDao OPTranBiz { get; set; }


     

        string userId = "a3e8f66f-3552-4626-9ee2-f7ddd8b106d8";  //GetUData.User_Id;
        public ActionResult Index()
        {

            VipShopModel vshopMode = new VipShopModel();
           
            var mql = TT_ShopSet.SelectAll().Where(TT_ShopSet.ShopId.In(TT_ShopAppUserSet.Select(TT_ShopAppUserSet.ShopId).Where(TT_ShopAppUserSet.UserId.Equal(userId))));
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


                //ViewData.Model = item;
                return View(vshopMode);
            }
            else {
                return RedirectToAction("Index", "User");
            }
           
        }
        /// <summary>
        /// 商品表
        /// </summary>
        /// <returns></returns>
        public ActionResult Transaction()
        {
            var mql = TT_TransactionSet.SelectAll().Where(TT_TransactionSet.ShopId.In(TT_ShopAppUserSet.Select(TT_ShopAppUserSet.ShopId).Where(TT_ShopAppUserSet.UserId.Equal(userId))));
            List<TT_Transaction> list = OPTranBiz.GetOwnList(mql);

            if (list != null)
            {
                return View(list);
            }
            else
            {
                return RedirectToAction("Index", "User");
            }

        }
    }
}
