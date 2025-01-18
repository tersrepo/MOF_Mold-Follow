using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace moldfollow
{
    public partial class HedefMiktar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        private void BindData(string sortExpression = null, SortDirection sortDirection = SortDirection.Ascending)
        {
            // Veritabanı bağlantısı
            string connectionString = "Data Source=192.168.2.121;Initial Catalog=Nopeksis_V7;Persist Security Info=True;User ID=alpertest;Password=DTrow57";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // SQL sorgusu
                string query = @"
                    SELECT 
    DURUSLAR.durus_sure,  
    dbo.fx_KaynakID(0, gerceklesme_isemri) AS KAYNAK,
    gerceklesme_isemri AS 'IS_EMRI_NO',
    dbo.fx_TarihSaat(gerceklesme_baslatarih, gerceklesme_baslasaat) AS BASLANGIC_TARIH,
    dbo.fx_TarihSaat(gerceklesme_bitistarih, gerceklesme_bitissaat) AS BASBITIS_TARIH,
    DATEDIFF(HOUR, dbo.fx_TarihSaat(gerceklesme_baslatarih, gerceklesme_baslasaat), dbo.fx_TarihSaat(gerceklesme_bitistarih, gerceklesme_bitissaat)) AS 'SAAT_FARKI',
    DATEDIFF(SECOND, dbo.fx_TarihSaat(gerceklesme_baslatarih, gerceklesme_baslasaat), dbo.fx_TarihSaat(gerceklesme_bitistarih, gerceklesme_bitissaat)) AS 'SAN_FARKI',
    isemri_stokkodu,
    sto_isim,
    URETIM_CARPANLARI.goz_sayisi,
    URETIM_CARPANLARI.mnt_personel,
    URETIM_CARPANLARI.birim_sure,
    URETIM_CARPANLARI.cevrim_suresi,
    OEE_GERCEKLESMELER.PROSES_PERSONEL_SAYISI,
    OEE_GERCEKLESMELER.GERCEKLESME_ADET,
    (CAST(GERCEKLESMELER.gerceklesme_personelsayisi AS FLOAT) / NULLIF(OEE_GERCEKLESMELER.PROSES_PERSONEL_SAYISI, 0)) * 
    (ISNULL([Nopeksis_V7].[dbo].[DURUSLAR].durus_sure, 0) * 60) AS 'durus',
    (DATEDIFF(SECOND, dbo.fx_TarihSaat(gerceklesme_baslatarih, gerceklesme_baslasaat), dbo.fx_TarihSaat(gerceklesme_bitistarih, gerceklesme_bitissaat)) - (ISNULL([Nopeksis_V7].[dbo].[DURUSLAR].durus_sure, 0) * 60)) AS 'Saniye',
    (CAST(URETIM_CARPANLARI.goz_sayisi AS FLOAT) / NULLIF(URETIM_CARPANLARI.cevrim_suresi, 0)) * OEE_GERCEKLESMELER.PROSES_PERSONEL_SAYISI / NULLIF(GERCEKLESMELER.gerceklesme_personelsayisi, 0) *     (DATEDIFF(SECOND, dbo.fx_TarihSaat(gerceklesme_baslatarih, gerceklesme_baslasaat), dbo.fx_TarihSaat(gerceklesme_bitistarih, gerceklesme_bitissaat)) - (ISNULL([Nopeksis_V7].[dbo].[DURUSLAR].durus_sure, 0) * 60)) AS 'Formul2'


FROM 
    GERCEKLESMELER
LEFT JOIN 
    ISEMIRLERI ON isemri_id = gerceklesme_isemri
LEFT JOIN
    STOK_KALIP_ESLESMELER ON [Stok Kodu] = isemri_stokkodu
LEFT JOIN
    MIKRO_STOKLAR ON sto_kod = isemri_stokkodu
LEFT JOIN
    URETIM_CARPANLARI ON URETIM_CARPANLARI.stok_kodu = isemri_stokkodu
LEFT JOIN
    [Nopeksis_V7].[dbo].[OEE_GERCEKLESMELER] ON [Nopeksis_V7].[dbo].[OEE_GERCEKLESMELER].ISEMRI = GERCEKLESMELER.gerceklesme_isemri
LEFT JOIN
    [Nopeksis_V7].[dbo].[DURUSLAR] ON [Nopeksis_V7].[dbo].[DURUSLAR].durus_isemri_id = GERCEKLESMELER.gerceklesme_isemri";

                // DropDownList'tan seçilen değeri al
                string selectedValue = ddlFilter.SelectedValue;

                // TextBox'tan seçilen tarihi al
                string startDate = txtSelectedDate.Text;
                string endDate = txtEndDate.Text;

                // Eğer seçili bir değer varsa filtrele
                if (!string.IsNullOrEmpty(selectedValue))
                {
                    query += $@" WHERE
                        dbo.fx_KaynakID(0, gerceklesme_isemri) = '{selectedValue}' AND 
                        CONVERT(DATETIME, dbo.fx_TarihSaat(gerceklesme_baslatarih, gerceklesme_baslasaat)) BETWEEN CONVERT(DATETIME, '{startDate}') AND CONVERT(DATETIME, '{endDate}')";
                }
                else
                {
                    // Eğer seçili bir değer yoksa, sadece tarih filtresi ekleyerek
                    query += $@" WHERE
                        CONVERT(DATETIME, dbo.fx_TarihSaat(gerceklesme_baslatarih, gerceklesme_baslasaat)) BETWEEN CONVERT(DATETIME, '{startDate}') AND CONVERT(DATETIME, '{endDate}')";
                }

                // Sıralama işlemi için gerekli kod
                if (!string.IsNullOrEmpty(sortExpression))
                {
                    query += $@" ORDER BY {sortExpression} {(sortDirection == SortDirection.Ascending ? "ASC" : "DESC")}";
                }

                // Veritabanı bağlantısını aç
                connection.Open();

                // Veriyi çek
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    // DataTable'ı GridView veya başka bir kontrol ile bağla
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }

        // DropDownList seçimi değiştikçe çağrılan metod
        protected void ddlFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindData();
        }

        // GridView sıralama işlemi
        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            string sortExpression = e.SortExpression;
            SortDirection sortDirection = e.SortDirection;

            if (ViewState["SortExpression"] != null && ViewState["SortExpression"].ToString() == sortExpression)
            {
                // Eğer aynı sütuna tekrar tıklanıyorsa sıralama yönünü değiştir
                sortDirection = (sortDirection == SortDirection.Ascending) ? SortDirection.Descending : SortDirection.Ascending;
            }

            ViewState["SortExpression"] = sortExpression;
            ViewState["SortDirection"] = sortDirection;

            // Veriyi sıralı bir şekilde çekmek için metod çağrısı
            BindData(sortExpression, sortDirection);
        }
    }
}
