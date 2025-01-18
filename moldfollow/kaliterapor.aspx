<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="kaliterapor.aspx.cs" Inherits="moldfollow.kaliterapor" %>

<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.Bootstrap.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>


<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="/soft-ui-dashboard-main/assets/img/logos/visa.png">
  <link rel="icon" type="image/png" href="/soft-ui-dashboard-main/assets/img/logos/visa.png">
  <title>
    
     Kalite


  </title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <!-- Nucleo Icons -->
  <link href="/soft-ui-dashboard-main/assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="/soft-ui-dashboard-main/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link href="/soft-ui-dashboard-main/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link id="pagestyle" href="/soft-ui-dashboard-main/assets/css/soft-ui-dashboard.css?v=1.0.3" rel="stylesheet" />
</head>

<body class="g-sidenav-show  bg-gray-100">
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg position-absolute top-0 z-index-3 w-100 shadow-none my-3  navbar-transparent mt-4">
    <div class="container">
      <a class="navbar-brand font-weight-bolder ms-lg-0 ms-3 text-white" href="/soft-ui-dashboard-main/pages/dashboards/default.html">
        Kalite 
                          <ul>
                            <li>

                                <span id="datetime"></span>
                            </li>

                            <script>
                                function updateDateTime() {
                                    var now = new Date();
                                    var options = {
                                        year: 'numeric',
                                        month: 'long',
                                        day: 'numeric',
                                        hour: 'numeric',
                                        minute: 'numeric',
                                        second: 'numeric',
                                        hour12: false
                                    };
                                    var formattedDateTime = now.toLocaleDateString('tr-TR', options);
                                    document.getElementById('datetime').textContent = formattedDateTime;
                                }

                                // İlk çalıştırma
                                updateDateTime();

                                // Her saniyede bir güncelleme
                                setInterval(updateDateTime, 1000);
                            </script>

                        </ul>
      </a>


                <style type="text/css">
    .listeleButton {
        background-color: #001F3F;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        cursor: pointer;
    }
</style>

        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/kalite.aspx" CssClass="listeleButton">Form Oluştur</asp:HyperLink>

    </div>
  </nav>
  <!-- End Navbar -->
  <section class="min-vh-100 mb-8">
    <div class="page-header align-items-start min-vh-50 pt-5 pb-11 m-3 border-radius-lg" style="background-image: url('/soft-ui-dashboard-main/assets/img/curved-images/curved14.jpg');">


      <span class="mask bg-gradient-dark opacity-6"></span>
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-5 text-center mx-auto">
              <br />
         <asp:Label ID="Label1" runat="server" Text="Proses Takip" style="font-size: 32px; color: white; margin-top: 5px; margin-bottom: 2px;"></asp:Label>
              <br />
         <asp:Label ID="Label2" runat="server" Text="" style="font-size: 12px; color: white; margin-top: 5px; margin-bottom: 2px;"></asp:Label>

            <p class="text-lead text-white">*Veriler stok adıyla aratılabilir.</p>
     
          </div>
        </div>
      </div>
    </div>
   <div class="container">
  <div class="row mt-lg-n10 mt-md-n11 mt-n10">
    <div class="col-xl-4 col-lg-5 col-md-7 mx-auto" style="width: 1300px;">
      <div class="card z-index-0">
        <div class="card-header text-center pt-4">
        
            <h5> Proses Raporla </h5>


                <form id="form1" runat="server">
<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="kal_id" Theme="Material" OnRowUpdating="ASPxGridView1_RowUpdating" OnRowUpdated="ASPxGridView1_RowUpdated" OnRowDeleting="ASPxGridView1_RowDeleting" EnableTheming="True">
    <SettingsSearchPanel Visible="True" />
    <SettingsExport ExportSelectedRowsOnly="false" FileName="Report" />

    <Columns>
        <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="1" Caption="İslemler"></dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="kal_id" ReadOnly="True" VisibleIndex="2" Caption="Proses ID" Name="Proses ID">
            <EditFormSettings Visible="False" />
          
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="kal_makineno" VisibleIndex="3" Caption="Makine No"></dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="kal_stokkod" VisibleIndex="4" Caption="Stok Kod"></dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="kal_stokad" VisibleIndex="5" Caption="Stok Ad"></dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="kal_kalipgoz" VisibleIndex="6" Caption="Proses Goz"></dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="kal_gercekgoz" VisibleIndex="7" Caption="Gercek Goz"></dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="kal_prosescevrim" VisibleIndex="8" Caption="Proses Cevrim"></dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="kal_gercekcevrim" VisibleIndex="9" Caption="Gercek Cevrim"></dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn FieldName="kal_giristarih" VisibleIndex="10" Caption="Kayıt Tarih"></dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn FieldName="kal_giriskul" ReadOnly="True" VisibleIndex="11" Caption="Giris Kul"></dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="kal_giriskul_display" ReadOnly="True" VisibleIndex="12" Caption="Giris" Visible="False"></dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Proses" ReadOnly="True" VisibleIndex="13">
            <CellStyle BackColor="White" Font-Bold="True">
            </CellStyle>
        </dx:GridViewDataTextColumn>
    </Columns>
<%--   <SettingsAdaptivity>
    <AdaptivityModeSettings Key="DesktopAndTablet">
        <SettingsAutoColumnWidth Mode="Container" />
    </AdaptivityModeSettings>
    <AdaptivityModeSettings Key="Mobile" ColumnCount="1" />
</SettingsAdaptivity>--%>

</dx:ASPxGridView>
                    <br />
                    <style type="text/css">
    .excelButton {
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        cursor: pointer;
    }
</style>

                    <asp:Button ID="Button1" runat="server" Text="Raporu İndir" OnClick="Button1_Click" CssClass="excelButton" />



        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Db_kaliphanetakipConnectionString1 %>" SelectCommand="SELECT TOP (1000) 
  KT.[kal_id]
  ,KT.[kal_makineno]
  ,KT.[kal_stokkod]
  ,KT.[kal_stokad]
  ,KT.[kal_kalipgoz]
  ,KT.[kal_gercekgoz]
  ,KT.[kal_prosescevrim]
  ,KT.[kal_gercekcevrim]
  ,KT.[kal_giristarih]
  ,CASE WHEN KT.[kal_giriskul] = 0 THEN 'BURCIN ATIN'
     WHEN KT.[kal_giriskul] = 1 THEN 'OMER CORAPCI'
     ELSE 'Diğer Durum'
END AS [kal_giriskul]


  ,CASE WHEN KT.[kal_giriskul] = 0 THEN 'OMER CORAPCI' ELSE KP.[kalper_ad] END AS [kal_giriskul_display]
  ,CASE WHEN KT.[kal_kalipgoz] &lt;&gt; KT.[kal_gercekgoz] OR ABS(KT.[kal_gercekcevrim] - KT.[kal_prosescevrim]) &gt; KT.[kal_prosescevrim] * 0.10 THEN 'Yanlış' ELSE 'Doğru' END AS Proses
FROM [Db_kaliphanetakip].[dbo].[KAL_TAKIP] KT
LEFT JOIN [Db_kaliphanetakip].[dbo].[KAL_PER] KP ON KT.[kal_giriskul] = KP.[kalper_id]
ORDER BY KT.[kal_giristarih] DESC;">
        </asp:SqlDataSource>


<%--<dx:ASPxButton ID="ASPxButton1" runat="server" Text="Excel" AutoPostBack="False">
    <ClientSideEvents Click="function(s, e) { ExportToExcel(); }" />
</dx:ASPxButton>--%>





                    <br />
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Db_kaliphanetakipConnectionString1 %>" SelectCommand="SELECT TOP (1000) 
      KT.[kal_id]
      ,KT.[kal_makineno]
      ,KT.[kal_stokkod]
      ,KT.[kal_stokad]
      ,KT.[kal_kalipgoz]
      ,KT.[kal_gercekgoz]
      ,KT.[kal_prosescevrim]
      ,KT.[kal_gercekcevrim]
      ,KT.[kal_giristarih]
      
	  ,CASE WHEN KT.[kal_giriskul] = 0 THEN 'BURCIN ATIN'
     WHEN KT.[kal_giriskul] = 1 THEN 'OMER CORAPCI'
     ELSE 'Diğer Durum'
END AS [kal_giriskul]
      ,CASE WHEN KT.[kal_kalipgoz] &lt;&gt; KT.[kal_gercekgoz] OR ABS(KT.[kal_gercekcevrim] - KT.[kal_prosescevrim]) &gt; KT.[kal_prosescevrim] * 0.10 THEN 'Yanlış' ELSE 'Doğru' END AS Proses
FROM [Db_kaliphanetakip].[dbo].[KAL_TAKIP] KT
LEFT JOIN [Db_kaliphanetakip].[dbo].[KAL_PER] KP ON KT.[kal_giriskul] = KP.[kalper_id]
ORDER BY KT.[kal_giristarih] DESC;
"></asp:SqlDataSource>






    </form>
      
          </a>
        </div>
        <div class="card-body">
          <p class="text-sm mt-3 mb-0">Sorun Yaşarsan <a href="javascript:;" class="text-dark font-weight-bolder">Sayfayı Yenile</a></p>
        </div>
      </div>
    </div>
  </div>
</div>
      

  </section>

  <footer class="footer py-5">
    <div class="container">
      

    </div>
  </footer>

  <!--   Core JS Files   -->
  <script src="/soft-ui-dashboard-main/assets/js/core/popper.min.js"></script>
  <script src="/soft-ui-dashboard-main/assets/js/core/bootstrap.min.js"></script>
  <script src="/soft-ui-dashboard-main/assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="/soft-ui-dashboard-main/assets/js/plugins/smooth-scrollbar.min.js"></script>
  <script>
      var win = navigator.platform.indexOf('Win') > -1;
      if (win && document.querySelector('#sidenav-scrollbar')) {
          var options = {
              damping: '0.5'
          }
          Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
      }
  </script>
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="/soft-ui-dashboard-main/assets/js/soft-ui-dashboard.min.js?v=1.0.3"></script>
</body>

</html>