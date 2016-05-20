using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ZAppUI.Models
{
    public class UserData
    {

        public string OpenId { set; get; }

        public UserInfo User_Info { set; get; }

        public string Nick_Name { set; get; }

        public string Head_Img_Url { set; get; }

        public Guid User_Id { get; set; }

        public string Request_User_OpenId{get;set;}

        public string Controller{get;set;}
    }

    public class UserInfo
    {
        

    }
}