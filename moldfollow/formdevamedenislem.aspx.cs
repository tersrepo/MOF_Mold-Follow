
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

//Data Source = 192.168.2.121; Initial Catalog = Db_kaliphanetakip; Persist Security Info=True; User ID = alpertest; Password = DTrow57
namespace moldfollow
{
    public partial class formdevamedenislem : System.Web.UI.Page
    {
        SqlConnection baglan = new SqlConnection("Data Source=192.168.2.121;Initial Catalog=Db_kaliphanetakip;Persist Security Info=True;User ID=alpertest;Password=DTrow57");
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet1TableAdapters.devamopsiyonv2TableAdapter it = new DataSet1TableAdapters.devamopsiyonv2TableAdapter();
            Repeater1.DataSource = it.opsiyondevam();
            Repeater1.DataBind();

            //try
            //{

            //    baglan.Open();
            //    SqlCommand komut = new SqlCommand("select aks_acilisacik from tblbild_aksiyon where aks_id=@p1",baglan);
            //    komut.Parameters.AddWithValue("@p1", .Text);
            //    SqlDataReader dr = komut.ExecuteReader();

            //    while (dr.Read())
            //    {
            //        richTextBox1.Text = dr[0].ToString();
            //        //txtmodel.Text = dr[1].ToString();
            //        //txttalep.Text = dr[2].ToString();
            //        //txtaciklama.Text = dr[3].ToString();
            //        //txttalepacan.Text = dr[4].ToString();
            //        //txttaleptarihi.Text = dr[5].ToString();

            //    }
            //    //baglanti.Close();
            //}
            //catch (Exception)
            //{

            //}
            //baglanti.Close();


        }
    }
}