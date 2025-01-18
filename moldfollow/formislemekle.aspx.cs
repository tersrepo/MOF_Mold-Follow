using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace moldfollow
{
    public partial class formislemekle : System.Web.UI.Page
    {
        SqlConnection baglan = new SqlConnection("Data Source=192.168.2.121;Initial Catalog=Db_kaliphanetakip;Persist Security Info=True;User ID=alpertest;Password=DTrow57");
        protected void Page_Load(object sender, EventArgs e)
        {
            Button1.BackColor = System.Drawing.Color.Orange;
            Button1.ForeColor = System.Drawing.Color.White;
            
            if (Page.IsPostBack == false)
            {
                DataSet1TableAdapters.KT_PERSONELTableAdapter pt = new DataSet1TableAdapters.KT_PERSONELTableAdapter();
                DropDownList1.DataSource = pt.personeller();
                DropDownList1.DataTextField = "per_ad";
                DropDownList1.DataValueField = "per_id";
                DropDownList1.DataBind();

                DataSet1TableAdapters.KT_SURECTIPTableAdapter st = new DataSet1TableAdapters.KT_SURECTIPTableAdapter();
                DropDownList2.DataSource = st.islemsinif();
                DropDownList2.DataTextField = "surectip_ad";
                DropDownList2.DataValueField = "surectip_id";
                DropDownList2.DataBind();

                //DataSet1TableAdapters.KT_MAKINATIPTableAdapter mt = new DataSet1TableAdapters.KT_MAKINATIPTableAdapter();
                //DropDownList5.DataSource = mt.istasyonsec();
                //DropDownList5.DataTextField = "mak_isim";
                //DropDownList5.DataValueField = "mak_id";
                //DropDownList5.DataBind();

                DataSet1TableAdapters.KT_ISLEMDETAYTableAdapter dt = new DataSet1TableAdapters.KT_ISLEMDETAYTableAdapter();
                DropDownList3.DataSource = dt.detaylar();
                DropDownList3.DataTextField = "detay_aciklama";
                DropDownList3.DataValueField = "detay_id";
                DropDownList3.DataBind();

                islembasla.Text = DateTime.Now.ToString();
                islembitir.Text = DateTime.Now.ToString();
                islemsurec.Text = "1";
                //islemaciklama.Text = "İş Tanımı;";
                
                hesaplanansure.Text = "0";

            }
                
           


        }

        protected void Button1_Click(object sender, EventArgs e)
        {



            try
            {

                baglan.Open();
                SqlCommand komut = new SqlCommand("select TOP 1 maliyet_tutar,maliyet_id from KT_MALIYET INNER JOIN KT_ISLEMLER ON KT_ISLEMLER.islem_istasyon = KT_MALIYET.maliyet_maktip WHERE maliyet_maktip = @p1 ORDER BY maliyet_tar DESC", baglan);
                komut.Parameters.AddWithValue("@p1", DropDownList7.SelectedValue);
                SqlDataReader dr = komut.ExecuteReader();

                while (dr.Read())
                {
                    TextBox1.Text = dr[0].ToString();
                    TextBox2.Text = dr[1].ToString();

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


            try
            {
                
                    DataSet1TableAdapters.KT_ISLEMLERTableAdapter dt = new DataSet1TableAdapters.KT_ISLEMLERTableAdapter();
                    dt.islemekle(ASPxGridLookup1.Value.ToString(), DropDownList1.SelectedItem.Value, DropDownList7.SelectedItem.Value, DateTime.Parse(islembasla.Text), DateTime.Parse(islembitir.Text), DropDownList2.SelectedItem.Value, Convert.ToInt32(islemsurec.Text), islemaciklama.Text, hesaplanansure.Text, Convert.ToInt32(DropDownList3.Text),Convert.ToInt32(TextBox2.Text));
                Response.Redirect("formdevamedenislem.aspx");




            }
            catch (Exception)
            {
                
            }

         



        }
    }
}