using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.IO;
using System.Data.SqlClient;



namespace moldfollow
{
    public partial class kaliterapor : System.Web.UI.Page
    {
        SqlConnection baglan = new SqlConnection("Data Source=192.168.2.121;Initial Catalog=Nopeksis_V7;Persist Security Info=True;User ID=alpertest;Password=DTrow57");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
         


            }
        }
        protected void ASPxGridView1_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            // Silme işlemini gerçekleştir
            int kal_id = Convert.ToInt32(e.Keys["kal_id"]);

            // Kalite rapora ekleme kodu buraya eklenir
            // Örneğin: Kalite raporunu silme işlemini gerçekleştir
            // KaliteRaporSil(kal_id);

            // Silinen satırın veritabanından kaldırılması
            SqlDataSource1.DeleteCommand = "DELETE FROM [Db_kaliphanetakip].[dbo].[KAL_TAKIP] WHERE [kal_id] = @kal_id";
            SqlDataSource1.DeleteParameters.Add("kal_id", kal_id.ToString());
            SqlDataSource1.Delete();

            e.Cancel = true; // Silme işlemini kontrol etmek için bu satırı ekliyoruz
            ASPxGridView1.DataBind(); // GridView'i güncelle
        }
        protected void ASPxGridView1_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            try
            {
                // Güncelleme işlemini gerçekleştir ve e.Cancel özelliğini ayarla
                e.Cancel = true;

                // Güncelleme işlemi için gerekli kodları buraya ekle
                int kal_id = Convert.ToInt32(e.Keys["kal_id"]);
                string kal_makineno = Convert.ToString(e.NewValues["kal_makineno"]);
                
                int kal_giriskul = Convert.ToInt32(e.NewValues["kal_giriskul"]);

                // Veritabanında güncelleme işlemi gerçekleştir
                SqlDataSource1.UpdateCommand = "UPDATE [Db_kaliphanetakip].[dbo].[KAL_TAKIP] SET " +
                    "[kal_makineno] = @kal_makineno, " +
               
                    "WHERE [kal_id] = @kal_id";

                SqlDataSource1.UpdateParameters.Add("kal_id", kal_id.ToString());
                SqlDataSource1.UpdateParameters.Add("kal_makineno", kal_makineno);
               // Tarih formatını ayarla
                SqlDataSource1.UpdateParameters.Add("kal_giriskul", kal_giriskul.ToString());

                SqlDataSource1.Update();

                ASPxGridView1.DataBind(); // GridView'i güncelle
            }
            catch (Exception)
            {
                // Güncelleme işlemi sırasında bir hata oluştuysa burada işlemler ekleyebilirsin
            }

        }
        protected void ASPxGridView1_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            try
            {
                // Güncelleme işlemi tamamlandığında yapılacak işlemleri buraya ekle
                if (e.Exception == null || e.ExceptionHandled)
                {
                    // Güncelleme başarıyla tamamlandıysa
                    // Örneğin, bir mesaj göster:
             
                    string script = "alert('Güncelleme başarıyla tamamlandı.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert", script, true);
                }
                else
                {
                    // Güncelleme sırasında bir hata oluştuysa burada işlemler ekleyebilirsin
                    // Örneğin, bir hata mesajını logla veya kullanıcıya göster:
                    string script = "alert('Güncelleme sırasında bir hata oluştu. Hata detayı: " + e.Exception.Message + "');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Error", script, true);
                }
            }
            catch (Exception ex)
            {
                // İstisna durumlarına karşı genel bir işleme ekleyebilirsin
                string script = "alert('Bir hata oluştu. Hata detayı: " + ex.Message + "');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Error", script, true);
                
            }
        }
        protected void ExportToExcelButton_Click(object sender, EventArgs e)
        {
            // Veri tabanından DataTable'ı doldur (örneğin SqlDataSource1'ı kullanabilirsin)
            // ...
            DataSet1TableAdapters.KAL_TAKIP1TableAdapter dt = new DataSet1TableAdapters.KAL_TAKIP1TableAdapter();
            // DataTable'ı Excel dosyasına yaz
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=ExportedData.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";

            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter htw = new HtmlTextWriter(sw))
                {
                    // GridView'ı oluştur ve bind et
                    GridView gvExport = new GridView();
                    gvExport.DataSource = dt;
                    gvExport.DataBind();

                    // GridView'ı Excel formatında render et
                    gvExport.RenderControl(htw);

                    // Response'a yaz
                    Response.Write(sw.ToString());
                    Response.End();
                }
            }
        }
        protected void btnExportToExcel_Click(object sender, EventArgs e)
        {
       
            //using (SqlConnection connection = new SqlConnection(connectionString))
            {
                baglan.Open();

                string query = "SELECT TOP (1000) KT.[kal_id], KT.[kal_makineno], KT.[kal_stokkod], KT.[kal_stokad], KT.[kal_kalipgoz], KT.[kal_gercekgoz], KT.[kal_prosescevrim], KT.[kal_gercekcevrim], KT.[kal_giristarih], CASE WHEN KT.[kal_giriskul] = 0 THEN 'OMER CORAPCI' ELSE KP.[kalper_ad] END AS [kal_giriskul], CASE WHEN KT.[kal_kalipgoz] <> KT.[kal_gercekgoz] OR ABS(KT.[kal_gercekcevrim] - KT.[kal_prosescevrim]) > KT.[kal_prosescevrim] * 0.10 THEN 'Yanlış' ELSE 'Doğru' END AS Proses FROM [Db_kaliphanetakip].[dbo].[KAL_TAKIP] KT LEFT JOIN [Db_kaliphanetakip].[dbo].[KAL_PER] KP ON KT.[kal_giriskul] = KP.[kalper_id] ORDER BY KT.[kal_giristarih] DESC";

                using (SqlCommand cmd = new SqlCommand(query, baglan))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        // Response dosyasını hazırla
                        Response.Clear();
                        Response.Buffer = true;
                        Response.AddHeader("content-disposition", "attachment;filename=ExportedData.xls");
                        Response.Charset = "";
                        Response.ContentType = "application/vnd.ms-excel";

                        using (StringWriter sw = new StringWriter())
                        {
                            using (HtmlTextWriter htw = new HtmlTextWriter(sw))
                            {
                                // Verileri döngü ile oku ve yaz
                                htw.WriteLine("<table border='1'><tr>");
                                for (int i = 0; i < reader.FieldCount; i++)
                                {
                                    htw.WriteLine("<th>" + reader.GetName(i) + "</th>");
                                }
                                htw.WriteLine("</tr>");

                                while (reader.Read())
                                {
                                    htw.WriteLine("<tr>");
                                    for (int i = 0; i < reader.FieldCount; i++)
                                    {
                                        htw.WriteLine("<td>" + reader[i].ToString() + "</td>");
                                    }
                                    htw.WriteLine("</tr>");
                                }
                                htw.WriteLine("</table>");

                                // Response'a yaz
                                Response.Write(sw.ToString());
                                Response.End();
                            }
                        }
                    }
                }
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //using (SqlConnection connection = new SqlConnection(connectionString))
            {
                baglan.Open();

                string query = "SELECT TOP (1000) KT.[kal_id], KT.[kal_makineno], KT.[kal_stokkod], KT.[kal_stokad], KT.[kal_kalipgoz], KT.[kal_gercekgoz], KT.[kal_prosescevrim], KT.[kal_gercekcevrim], KT.[kal_giristarih], CASE WHEN KT.[kal_giriskul] = 0 THEN 'BURCIN ATIN' WHEN KT.[kal_giriskul] = 1 THEN 'OMER CORAPCI' ELSE 'Diğer Durum' END AS [kal_giriskul], CASE WHEN KT.[kal_kalipgoz] <> KT.[kal_gercekgoz] OR ABS(KT.[kal_gercekcevrim] - KT.[kal_prosescevrim]) > KT.[kal_prosescevrim] * 0.10 THEN 'Yanlış' ELSE 'Doğru' END AS Proses FROM [Db_kaliphanetakip].[dbo].[KAL_TAKIP] KT LEFT JOIN [Db_kaliphanetakip].[dbo].[KAL_PER] KP ON KT.[kal_giriskul] = KP.[kalper_id] ORDER BY KT.[kal_giristarih] DESC";

                using (SqlCommand cmd = new SqlCommand(query, baglan))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        // Response dosyasını hazırla
                        Response.Clear();
                        Response.Buffer = true;
                        Response.AddHeader("content-disposition", "attachment;filename=ExportedData.xls");
                        Response.Charset = "";
                        Response.ContentType = "application/vnd.ms-excel";

                        using (StringWriter sw = new StringWriter())
                        {
                            using (HtmlTextWriter htw = new HtmlTextWriter(sw))
                            {
                                // Verileri döngü ile oku ve yaz
                                htw.WriteLine("<table border='1'><tr>");
                                for (int i = 0; i < reader.FieldCount; i++)
                                {
                                    htw.WriteLine("<th>" + reader.GetName(i) + "</th>");
                                }
                                htw.WriteLine("</tr>");

                                while (reader.Read())
                                {
                                    htw.WriteLine("<tr>");
                                    for (int i = 0; i < reader.FieldCount; i++)
                                    {
                                        htw.WriteLine("<td>" + reader[i].ToString() + "</td>");
                                    }
                                    htw.WriteLine("</tr>");
                                }
                                htw.WriteLine("</table>");

                                // Response'a yaz
                                Response.Write(sw.ToString());
                                Response.End();
                            }
                        }
                    }
                }
            }

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
    







    



