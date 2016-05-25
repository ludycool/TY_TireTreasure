using e3net.common.SysMode;
using e3net.Mode.TireTreasureDB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ZAppUI.Models
{

    public class VipShopModel
    {

        /// <summary>
        /// 门店信息
        /// </summary>
        public TT_Shop ShopItem { set; get; }
        /// <summary>
        /// 滚动图片
        /// </summary>
        public List<FileJson> ImgList { set; get; }
        /// <summary>
        /// 物品信息
        /// </summary>
        public List<TT_Transaction> TransactionList { set; get; }

    }
}