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
    public partial class formtamamdetay : System.Web.UI.Page
    {
        SqlConnection baglan = new SqlConnection("Data Source=192.168.2.121;Initial Catalog=Db_kaliphanetakip;Persist Security Info=True;User ID=alpertest;Password=DTrow57");
        protected void Page_Load(object sender, EventArgs e)
        {
            int min,permal,elkmal,ekipmal;
            double personel,elektrik,ekipman,toplam;

         

            int kid = Convert.ToInt32(Request.QueryString["islem_id"].ToString());
            id.Text = kid.ToString();

            //id.BackColor = System.Drawing.Color.Black;
            //id.ForeColor = System.Drawing.Color.White;

            //Button1.BackColor = System.Drawing.Color.RoyalBlue;
            //Button1.ForeColor = System.Drawing.Color.White;

            //TextBox1.BackColor = System.Drawing.Color.LightSkyBlue;
            //TextBox1.ForeColor = System.Drawing.Color.White;

            //TextBox2.BackColor = System.Drawing.Color.Black;
            //TextBox2.ForeColor = System.Drawing.Color.White;

            //TextBox3.BackColor = System.Drawing.Color.Black;
            //TextBox3.ForeColor = System.Drawing.Color.White;
            //TextBox4.BackColor = System.Drawing.Color.Black;
            //TextBox4.ForeColor = System.Drawing.Color.White;

            //TextBox5.BackColor = System.Drawing.Color.Black;
            //TextBox5.ForeColor = System.Drawing.Color.White;
            //TextBox6.BackColor = System.Drawing.Color.Black;
            //TextBox6.ForeColor = System.Drawing.Color.White;

            //TextBox7.BackColor = System.Drawing.Color.Black;
            //TextBox7.ForeColor = System.Drawing.Color.White;
            //TextBox8.BackColor = System.Drawing.Color.Black;
            //TextBox8.ForeColor = System.Drawing.Color.White;

            //TextBox9.BackColor = System.Drawing.Color.Black;
            //TextBox9.ForeColor = System.Drawing.Color.White;

            try
            {

                baglan.Open();
                SqlCommand komut = new SqlCommand("select islem_id,per_ad,surectip_ad,islem_kalipno,mak_isim,islem_baslama,islem_bitirme,detay_aciklama,islem_aciklama,islem_persure from KT_ISLEMLER JOIN KT_MAKINATIP ON KT_ISLEMLER.islem_istasyon=KT_MAKINATIP.mak_id JOIN KT_PERSONEL ON KT_ISLEMLER.islem_personel=KT_PERSONEL.per_id JOIN KT_SURECTIP ON KT_ISLEMLER.islem_sinif=KT_SURECTIP.surectip_id JOIN KT_ISLEMDETAY ON KT_ISLEMLER.islem_detay=KT_ISLEMDETAY.detay_id JOIN KT_ISLEMSUREC ON KT_ISLEMLER.islem_surec=KT_ISLEMSUREC.islemsurec_id where islem_id=@p1", baglan);
                komut.Parameters.AddWithValue("@p1", id.Text);
                SqlDataReader dr = komut.ExecuteReader();

                while (dr.Read())
                {
                    TextBox1.Text = dr[1].ToString();
                    TextBox2.Text = dr[2].ToString();
                    TextBox3.Text = dr[3].ToString();
                    TextBox4.Text = dr[4].ToString();
                    TextBox5.Text = dr[5].ToString();
                    TextBox6.Text = dr[6].ToString();
                    TextBox7.Text = dr[7].ToString();
                    TextBox8.Text = dr[8].ToString();
                    TextBox9.Text = dr[9].ToString();
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

            //baglan.Open();
            //SqlDataAdapter da = new SqlDataAdapter("select * from KT_DURUSLAR", baglan);
            //DataTable dt = new DataTable();
            //da.Fill(dt);
            //GridView1.DataSource = dt;
            //baglan.Close();


            try
            {

                baglan.Open();
                SqlCommand komut = new SqlCommand("select maliyet_tutar from KT_ISLEMLER JOIN KT_MALIYET ON KT_ISLEMLER.islem_malcarpan = KT_MALIYET.maliyet_id where islem_id=@p1", baglan);
                komut.Parameters.AddWithValue("@p1", id.Text);
                SqlDataReader dr = komut.ExecuteReader();

                while (dr.Read())
                {
                    TextBox10.Text = dr[0].ToString();
                    

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

            min = Convert.ToInt16(TextBox9.Text);
            personel = Convert.ToInt32(TextBox10.Text);
            toplam = min * personel;
            TextBox11.Text = toplam.ToString("00.00");
            //personel = min * 1.43;
            //elektrik=min * 2.61;
            //ekipman = min * 0.41;
            //TextBox10.Text = personel + " ₺".ToString();
            //TextBox11.Text = elektrik + " ₺".ToString();
            //TextBox12.Text = ekipman + " ₺".ToString();
            //toplam = min + elektrik + ekipman;
            //TextBox13.Text = toplam + " ₺".ToString();
        }
    }
}