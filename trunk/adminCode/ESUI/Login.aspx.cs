using BH.PalmHosp.tools.ToolsHelper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TZHSWEET.Common;

namespace ESUI
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["User"] = "我去你的";
        }

        protected void aebtn_Click(object sender, EventArgs e)
        {

            string data=TextBox1.Text;
            TextBox2.Text = DESProvider.Encrypt(data, "362514");
        }

        protected void debtn_Click(object sender, EventArgs e)
        {
            string data = TextBox1.Text;
            string res = DESProvider.Decrypt(data, "362514");
            TextBox2.Text = res;
        
        }
    }
}