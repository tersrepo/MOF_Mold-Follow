using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace moldfollow
{
    public partial class formislemsil : System.Web.UI.Page
    {
        SqlConnection bagla = new SqlConnection("Data Source=192.168.2.121;Initial Catalog=Db_kaliphanetakip;Persist Security Info=True;User ID=alpertest;Password=DTrow57");
        protected void Page_Load(object sender, EventArgs e)
        {
            int sid = Convert.ToInt32(Request.QueryString["islem_id"].ToString());
            TextBox1.Text = sid.ToString();

            bagla.Open();
            SqlCommand islemsil = new SqlCommand("Delete from KT_ISLEMLER where islem_id=@p1", bagla);
            islemsil.Parameters.AddWithValue("@p1", TextBox1.Text);
            islemsil.ExecuteNonQuery();
            bagla.Close();
            Response.Redirect("formdevamedenislem.aspx");
            
        }
    }
}