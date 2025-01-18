using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace moldfollow
{
    public partial class formtakiplogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            // Burada kullanıcı adı ve şifre doğrulama işlemleri yapılabilir

            if (username == "admin" && password == "94")
            {
                
                lblMessage.Text = "0x000000";
                Response.Redirect("formtakipadmin.aspx");

            }
            else
            {
                lblMessage.Text = "Kullanıcı adı veya şifre yanlış";
            }
        }
    }
}