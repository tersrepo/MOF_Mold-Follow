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
    public partial class formguncellemeislem : System.Web.UI.Page
    {
        SqlConnection baglan = new SqlConnection("Data Source=192.168.2.121;Initial Catalog=Db_kaliphanetakip;Persist Security Info=True;User ID=alpertest;Password=DTrow57");
        protected void Page_Load(object sender, EventArgs e)
        {
            int sayi1,sayi2,toplam;
            int kid = Convert.ToInt32(Request.QueryString["islem_id"].ToString());
            TextBox1.Text = kid.ToString();

            //DataSet1TableAdapters.KT_ISLEMLERTableAdapter dti = new DataSet1TableAdapters.KT_ISLEMLERTableAdapter();
            //TextBox2.Text = dti.formacek(kid)[1].islem_surec.ToString();

            TextBox4.Text= DateTime.Now.ToString();

            try
            {

                baglan.Open();
                SqlCommand komut = new SqlCommand("select islem_surec,islem_baslama,islem_persure from KT_ISLEMLER where islem_id=@p1", baglan);
                komut.Parameters.AddWithValue("@p1",TextBox1.Text);
                SqlDataReader dr = komut.ExecuteReader();

                while (dr.Read())
                {
                    TextBox2.Text = dr[0].ToString();
                    TextBox3.Text = dr[1].ToString();
                    TextBox6.Text = dr[2].ToString();
                   
                    //txtmodel.Text = dr[1].ToString();
                    //txttalep.Text = dr[2].ToString();
                    //txtaciklama.Text = dr[3].ToString();
                    //txttalepacan.Text = dr[4].ToString();
                    //txttaleptarihi.Text = dr[5].ToString();

                }
                //baglanti.Close();
            }
            catch (Exception)
            {

            }
            baglan.Close();

            baglan.Open();
            SqlCommand incelemeguncelle = new SqlCommand("Update KT_ISLEMLER set islem_surec=@p1,islem_bitirme=@p3 where islem_id=@p2", baglan);
            incelemeguncelle.Parameters.AddWithValue("@p1", "2");
            incelemeguncelle.Parameters.AddWithValue("@p2", TextBox1.Text);
            incelemeguncelle.Parameters.AddWithValue("@p3", DateTime.Parse(TextBox4.Text));
            incelemeguncelle.ExecuteNonQuery();
            baglan.Close();

            baglan.Open();
            SqlCommand komut7 = new SqlCommand("Select DATEDIFF(MINUTE,islem_baslama,islem_bitirme) as 'islem_sure'from KT_ISLEMLER where islem_id=@p1", baglan);
            komut7.Parameters.AddWithValue("@p1", TextBox1.Text);
            SqlDataReader dr7 = komut7.ExecuteReader();
            while (dr7.Read())
            {
                TextBox7.Text = dr7[0].ToString();

            }
            baglan.Close();

       





           

            sayi1 = Convert.ToInt16(TextBox6.Text);
            sayi2 = Convert.ToInt16(TextBox7.Text);
            toplam = sayi1 + sayi2;
            TextBox5.Text = toplam.ToString();


            baglan.Open();
            SqlCommand incelemeguncelle4 = new SqlCommand("Update KT_ISLEMLER set islem_persure=@p1 where islem_id=@p2", baglan);
            incelemeguncelle4.Parameters.AddWithValue("@p1", TextBox5.Text);
            incelemeguncelle4.Parameters.AddWithValue("@p2", TextBox1.Text);
          
            incelemeguncelle4.ExecuteNonQuery();
            baglan.Close();


            Response.Redirect("formtamamlananislem.aspx");
        }
    }
}