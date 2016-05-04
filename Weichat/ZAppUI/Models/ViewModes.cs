using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace ZAppUI.Models
{
    public class LoginModel
    {
        [Required]
        [Display(Name = "手机号")]
        public string Phone { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "密码")]
        public string FirstPassword { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "密码")]
        public string SecondPassword { get; set; }


        //[Required]
        //[Display(Name = "验证码")]
        //public string VCode { get; set; }
        /// <summary>
        /// 用户类型 为1正常 姓名登录为0，身份证为2
        /// </summary>
        public string UserType { get; set; }
    }
}