using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;

namespace moldfollow
{
    public partial class formtakipekle : System.Web.UI.Page

    {
        MailMessage eposta = new MailMessage();
        SqlConnection baglan = new SqlConnection("Data Source=192.168.2.121;Initial Catalog=Db_kaliphanetakip;Persist Security Info=True;User ID=alpertest;Password=DTrow57");
        void MailGonder()
        {
            eposta.From = new MailAddress("novassd@outlook.com");
            eposta.To.Add("alperincir@novaplastik.com");
            eposta.Subject = "[NOVA 2.22]  ";
            eposta.Body =  "  TARİHİNDE OLUŞTURULAN KALIP ARIZA BİLDİRİMİ; "  + islemaciklama.Text.ToString() ;
            //eposta.Body = DateTime.Parse(dateTimePicker1.Text) + "  Tarihinde kullanıcı tarafından oluşturulan açıklama;   " + txtbirimaciklama.Text.ToString() + "    Müşterinin talebi;  " + txtsikayet.Text.ToString() + "    Ürün grubu;  " + look1.Text.ToString() + "                * Bu mesaj otomatik olarak oluşturulmuş bir bildiridir *";
            //eposta.From = new MailAddress ("alperincir@novaplastik.com");

            SmtpClient smtp = new SmtpClient();

            //smtp.Credentials = new System.Net.NetworkCredential("novassdtakipexe.bildirim@outlook.com", "Nov@744!");
            smtp.Credentials = new System.Net.NetworkCredential("novassd@outlook.com", "Nov@tech4110!");
            smtp.Host = "smtp-mail.outlook.com";
            smtp.EnableSsl = true;
            smtp.Port = 587;
            smtp.Send(eposta);

        }
        protected void Page_Load(object sender, EventArgs e)
        {
         

       
            Button1.BackColor = System.Drawing.Color.Orange;
            Button1.ForeColor = System.Drawing.Color.White;

            if (Page.IsPostBack == false)
            {
                islembasla.Text = DateTime.Now.ToString();
                TextBox1.Text = "1";

                //DataSet1TableAdapters.KT_PERSONELTableAdapter pt = new DataSet1TableAdapters.KT_PERSONELTableAdapter();
                //DropDownList1.DataSource = pt.personeller();
                //DropDownList1.DataTextField = "per_ad";
                //DropDownList1.DataValueField = "per_id";
                //DropDownList1.DataBind();
               
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {


            //DataSet1TableAdapters.KT_ISLEMLERTableAdapter dt = new DataSet1TableAdapters.KT_ISLEMLERTableAdapter();
            //dt.islemekle(ASPxGridLookup1.Value.ToString(), DropDownList1.SelectedItem.Value, DropDownList7.SelectedItem.Value, DateTime.Parse(islembasla.Text), DateTime.Parse(islembitir.Text), DropDownList2.SelectedItem.Value, Convert.ToInt32(islemsurec.Text), islemaciklama.Text, hesaplanansure.Text, Convert.ToInt32(DropDownList3.Text), Convert.ToInt32(TextBox2.Text));
            //Response.Redirect("formdevamedenislem.aspx");
            //    DataSet1TableAdapters.UR_KALIPARIZATableAdapter ut = new DataSet1TableAdapters.UR_KALIPARIZATableAdapter();
            //    ut.arizaekle(DropDownList1.SelectedItem.Value, ASPxGridLookup1.Value.ToString(), islemaciklama.Text, DateTime.Parse(islembasla.Text));
            ////Response.Redirect("formdevamedenislem.aspx");
            //Button1.Text = "RELO";


            


        }

        protected void Button1_Click1(object sender, EventArgs e)
        {

            //DataSet1TableAdapters.KT_ISLEMLERTableAdapter dt = new DataSet1TableAdapters.KT_ISLEMLERTableAdapter();
            //dt.islemekle(ASPxGridLookup1.Value.ToString(), DropDownList1.SelectedItem.Value, DropDownList7.SelectedItem.Value, DateTime.Parse(islembasla.Text), DateTime.Parse(islembitir.Text), DropDownList2.SelectedItem.Value, Convert.ToInt32(islemsurec.Text), islemaciklama.Text, hesaplanansure.Text, Convert.ToInt32(DropDownList3.Text), Convert.ToInt32(TextBox2.Text));
            //Response.Redirect("formdevamedenislem.aspx");
            //DataSet1TableAdapters.UR_KALIPARIZATableAdapter ut = new DataSet1TableAdapters.UR_KALIPARIZATableAdapter();
            //ut.arizaekle(DropDownList1.SelectedItem.Value, ASPxGridLookup1.Value.ToString(), islemaciklama.Text, DateTime.Parse(islembasla.Text));


            DataSet1TableAdapters.UR_KALIPARIZATableAdapter ut = new DataSet1TableAdapters.UR_KALIPARIZATableAdapter();
            //ut.arizaekle2(DropDownList1.SelectedItem.Value, ASPxGridLookup1.Value.ToString(), islemaciklama.Text, DateTime.Parse(islembasla.Text),TextBox1.Text);
            ut.yeniariza(DropDownList1.SelectedItem.Value, ASPxGridLookup1.Value.ToString(), islemaciklama.Text, DateTime.Parse(islembasla.Text),Convert.ToInt32(TextBox1.Text), DropDownList2.SelectedItem.Value, DropDownList3.SelectedItem.Value);
            //Response.Redirect("formdevamedenislem.aspx");
            Response.Redirect("formtakipuretimview.aspx");
            MailGonder();

        }
    }
}