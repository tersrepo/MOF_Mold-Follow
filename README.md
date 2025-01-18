# MOF_Mold-Follow
Bu proje, ASP.NET Web Forms (C#) ve MSSQL veritabanını kullanarak kalıp takibi, maliyet analizleri, kalite departmanı proses takibi ve personel-istasyon ilişki yönetimi yapmaya yarayan bir uygulamadır.
Proje içerisindeki sayfalar (ASPX) ve kodlar, DevExpress kontrol kütüphaneleri (örn. Chart, Grid, CardView, vb.) ile zenginleştirilmiştir.
Genel Özellikler

    Kalıp Raporlama
        İstasyon çalışma sürelerini, duruş bilgilerini ve maliyet analizlerini grafiksel olarak göstermek için kullanılır.
        Makine saatlik çalma maliyeti, personel bilgisi gibi verileri dikkate alarak kalıp bazlı çalışma sürelerini ve maliyetlerini hesaplar.

    Kalıp Arıza Yönetimi
        Kalıp numarası, sorumlu kişi ve öncelik gibi bilgilerle arıza bildirim formu oluşturma.
        Arıza ilerleyişini veya tamamlanmış durumlarını listeleme ve güncelleme.

    Kalite Departmanı Proses Takibi
        kalite.aspx: Kalite formu, stok (ürün) numarasına ait proses göz/çevrim sürelerini görüntüleme ve gerektiğinde güncelleme.
        kaliterapor.aspx: Kaydedilen proses verilerini listeleme (ASPxGridView ile) ve indirilebilir raporlar oluşturma.
        HedefMiktar.aspx: Montaj paneli benzeri ekranda, başlama ve bitiş tarihleri seçilerek hedef üretim, gerçekleşen adet, duruş süreleri, çevrim süreleri gibi verilerin izlenmesi.

    Makine / Personel / Kalıp Tabloları
        MSSQL’de tanımlı makine/istasyon, personel tabloları, kalıp ve detay tabloları kullanılır.
        Saatlik maliyet çarpanları ve personel bilgileri üzerinden çeşitli analizler yapılır.

Kullanılan Teknolojiler

    .NET Framework (ASP.NET Web Forms, C#)
    SQL Server (MSSQL) – veritabanı tabloları ve prosedürler
    DevExpress kütüphanesi – GridView, Chart, CardView gibi bileşenler
    HTML/CSS + Bootstrap (kısmen DevExpress Bootstrap bileşenleri)

Kurulum ve Çalıştırma

    Proje Dosyaları
        Bu projeyi klonlayıp veya indirdikten sonra Visual Studio ile moldfollow.sln dosyasını açın.
        .gitignore içeriği sayesinde derleme veya geçici dosyalar commit dışı tutulmalıdır.

    Veritabanı (moldfollow.sql)
        MSSQL üzerinde uygun bir veritabanı oluşturun (örneğin Db_kaliphanetakip).
        Proje deposunda paylaşılan moldfollow.sql dosyasını çalıştırın veya kendi .bak dosyanız varsa restore edin.
        Web.config içindeki ConnectionStrings bölümünde veritabanı bağlantı bilgilerinizi ayarlayın.

    DevExpress Referansları
        Projenin DevExpress 20.1 sürümüne (veya proje hangi sürümü kullanıyorsa) gereksinimi vardır.
        NuGet veya elinizdeki DevExpress kurulumuyla referansları doğrulayın.

    Projeyi Çalıştırma
        Visual Studio’da projeyi açtıktan sonra F5 (Debug) veya Ctrl+F5 (Run Without Debugging) yaparak çalıştırabilirsiniz.
        Tarayıcıda site açıldığında menü üzerinden “İstasyon Raporları”, “Kalıp Raporları”, “Maliyet Raporları”, “Kalite” vb. sayfalara erişebilirsiniz.

Önemli Sayfalar

    formadministasyon.aspx / formadminkalip.aspx / ...
        Kalıp raporlama, istasyon kartları, maliyet örneklemleri, arıza yönetimi gibi ana modüller.

    kalite.aspx
        Kalite departmanına ait veri girişi (stok seçme, proses göz/çevrim) ekranı.

    kaliterapor.aspx
        Kalite verilerini tablo halinde listeleme, Excel’e aktarma vb.

    HedefMiktar.aspx
        Montaj panelindeki proseslerin başlangıç-bitiş tarihleri, duruş süreleri, gerçekleşen adet vs. bilgilerin bulunduğu raporlama sayfası.
