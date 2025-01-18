using System;
using System.Data;
using System.Data.SqlClient;

namespace moldfollow
{
    public partial class kalite : System.Web.UI.Page
    {
        SqlConnection baglan = new SqlConnection("Data Source=192.168.2.121;Initial Catalog=Nopeksis_V7;Persist Security Info=True;User ID=alpertest;Password=DTrow57");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                TextBox9.Text = DateTime.Now.ToString(); // Tarih ve saat
            GetStokDetails();
            ClientScript.RegisterStartupScript(GetType(), "script", "function OnGridLookupSelectedIndexChanged(s, e) { var selectedValue = s.GetSelectedValues()[0]; document.getElementById('" + TextBox1.ClientID + "').value = selectedValue; }", true);
            ////if (!IsPostBack)
            ////{
            ////    // Sayfa ilk defa yüklendiğinde çalışacak kodlar
            ////    // Bu kısımda istediğiniz verileri çekip TextBox'lara atayabilirsiniz
            ////    GetStokDetails();
            ////}
            DataSet1TableAdapters.KAL_PERTableAdapter st = new DataSet1TableAdapters.KAL_PERTableAdapter();
            DropDownList1.DataSource = st.kalper_GetData();
            DropDownList1.DataTextField = "kalper_ad";
            DropDownList1.DataValueField = "kalper_id";
            DropDownList1.DataBind();
            }
        }

        protected void btnGetSelectedValue_Click(object sender, EventArgs e)
        {
            GetStokDetails();
        }

        protected void GetStokDetails()
        {
            if (ASPxGridLookup1 != null && ASPxGridLookup1.Value != null)
            {
                string selectedStokKodu = ASPxGridLookup1.Value.ToString();

                using (SqlConnection baglan = new SqlConnection("Data Source=192.168.2.121;Initial Catalog=Nopeksis_V7;Persist Security Info=True;User ID=alpertest;Password=DTrow57"))
                {
                    baglan.Open();

                    // Stok Detayları
                    string queryStok = "SELECT [Göz Sayısı], [kplan_Sure], [Kalıp Adı],[Kalıp No],[Stok Açıklama] FROM [Nopeksis_V7].[dbo].[STOK_KALIP_ESLESMELER] WHERE [Stok Kodu] = @StokKodu";

                    using (SqlCommand commandStok = new SqlCommand(queryStok, baglan))
                    {
                        commandStok.Parameters.AddWithValue("@StokKodu", selectedStokKodu);

                        using (SqlDataReader readerStok = commandStok.ExecuteReader())
                        {
                            if (readerStok.Read())
                            {
                                TextBox2.Text = $"{readerStok["Göz Sayısı"]}";
                                TextBox3.Text = $"{readerStok["kplan_Sure"]}";
                                TextBox8.Text = $"{readerStok["Stok Açıklama"]}";

                                TextBox5.Text = $" Kalıp No: {readerStok["Kalıp No"]} - Kalıp Adı: {readerStok["Kalıp Adı"]}";
                                TextBox1.Text = selectedStokKodu;
                            }
                        }
                    }

                    // Machine ID
                    try
                    {
                        // Mevcut kod...

                        // Machine ID
                        string queryMachineId = "SELECT [machineid] FROM [MikroDB_V16_X23].[dbo].[MIKRO_ISEMRI_LISTESI] WHERE [stockid] = @StokKodu";

                        using (SqlCommand commandMachineId = new SqlCommand(queryMachineId, baglan))
                        {
                            commandMachineId.Parameters.AddWithValue("@StokKodu", selectedStokKodu);

                            using (SqlDataReader readerMachineId = commandMachineId.ExecuteReader())
                            {
                                if (readerMachineId.Read())
                                {
                                    TextBox7.Text = readerMachineId["machineid"].ToString();
                                }
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        // Hata olursa logla
                        // Örneğin: Response.Write("Hata: " + ex.Message);
                        // veya bir loglama kütüphanesi kullanabilirsiniz.
                    }
                }
                }
                }



        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                DataSet1TableAdapters.KAL_TAKIP1TableAdapter dt = new DataSet1TableAdapters.KAL_TAKIP1TableAdapter();
                int kal_prosescevrim = Convert.ToInt32(TextBox6.Text);
                int kal_gercekcevrim = Convert.ToInt32(TextBox3.Text); // Varsayılan olarak TextBox8'e atılan değeri kullandım, gerekirse düzeltebilirsin

                dt.kalite_insert(TextBox7.Text, TextBox1.Text, TextBox8.Text, Convert.ToInt32(TextBox2.Text), Convert.ToInt32(TextBox4.Text), Convert.ToInt32(TextBox3.Text), kal_prosescevrim, DateTime.Parse(TextBox9.Text), DropDownList1.SelectedIndex);

                // Fark kontrolü
                int fark = Math.Abs(kal_prosescevrim - kal_gercekcevrim);
                if (fark > (kal_gercekcevrim * 0.1)) // Eğer fark %10'dan büyükse
                {
                    // Farklı ise HedefMiktar sayfasına yönlendir
                    Label1.Text = "PROSES YANLIŞ";
                    Label2.Text = "KAYIT TAMAMLANDI";
                    //Response.Redirect("formtakip.aspx");
                    
                }
                else

                // Fark yoksa normal yönlendirme
                Label1.Text = "PROSES DOĞRU"; Label2.Text = "KAYIT TAMAMLANDI";
            }
            catch (Exception ex)
            {
                Console.WriteLine("Hata Oluştu: " + ex.Message);
                Console.WriteLine("Hata Detayı: " + ex.StackTrace);

                // Hata mesajını kullanıcıya göstermek için bir uyarı veya loglama işlemi ekleyebilirsin
                // Örneğin: Response.Write("Hata Oluştu: " + ex.Message);
                // veya bir loglama kütüphanesi kullanabilirsiniz.
            }
        }


        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

    }
}
