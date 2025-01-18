using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace moldfollow
{
    public partial class formtakip : System.Web.UI.Page
    {
        SqlConnection baglan = new SqlConnection("Data Source=192.168.2.121;Initial Catalog=Db_kaliphanetakip;Persist Security Info=True;User ID=alpertest;Password=DTrow57");
        protected void Page_Load(object sender, EventArgs e)
        {
            int kid = Convert.ToInt32(Request.QueryString["kalipariza_id"].ToString());
            TextBox1.Text = kid.ToString();

            TextBox2.Text = DateTime.Now.ToString();

            baglan.Open();
            SqlCommand incelemeguncelle = new SqlCommand("Update UR_KALIPARIZA set kalipariza_surec=@p3,kalipariza_islemtar=@p2 where kalipariza_id=@p1", baglan);
            incelemeguncelle.Parameters.AddWithValue("@p3", "2");
            incelemeguncelle.Parameters.AddWithValue("@p1", TextBox1.Text);
            incelemeguncelle.Parameters.AddWithValue("@p2", DateTime.Parse(TextBox2.Text));
            incelemeguncelle.ExecuteNonQuery();
            baglan.Close();

            Response.Redirect("formtakipsira.aspx");




        }
    }
}