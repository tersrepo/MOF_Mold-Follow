<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="kalite.aspx.cs" Inherits="moldfollow.kalite" %>

<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


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

        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/kaliterapor.aspx" CssClass="listeleButton">Verileri Listele</asp:HyperLink>


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
        <div class="col-xl-4 col-lg-5 col-md-7 mx-auto">
          <div class="card z-index-0">
            <div class="card-header text-center pt-4">
              <a href="kalite.aspx">
    <h5> Yeni Form </h5>
</a>

            </div>
         
            <div class="card-body">
          
                   <form id="form1" runat="server">
      <%--      <label for="ASPxGridLookup1" runat="server">Stok Numarası</label>--%>
            <dx:ASPxGridLookup ID="ASPxGridLookup1" runat="server" ClientInstanceName="gridLookup" CssClass="form-control" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="Stok Kodu" Theme="iOS" EnableTheming="True" OnSelectedIndexChanged="ASPxGridLookup1_SelectedIndexChanged">
                <ClientSideEvents Init="function(s, e) { s.SelectedIndexChanged = OnGridLookupSelectedIndexChanged; }" />
                <GridViewProperties>
                    <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>
                </GridViewProperties>
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="Stok Kodu" ReadOnly="true" VisibleIndex="0" Width="30px">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Stok Açıklama" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                </Columns>
                <ClearButton DisplayMode="Always">
                </ClearButton>
            </dx:ASPxGridLookup>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Nopeksis_V7Conn %>" SelectCommand="WITH TekrarEdenStoklar AS (
    SELECT 
        [Stok Kodu], 
        [Stok Açıklama], 
        ROW_NUMBER() OVER(PARTITION BY [Stok Kodu] ORDER BY (SELECT NULL)) AS Siralama
    FROM [Nopeksis_V7].[dbo].[STOK_KALIP_ESLESMELER]
    WHERE [Stok Kodu] IS NOT NULL
)
SELECT [Stok Kodu], [Stok Açıklama]
FROM TekrarEdenStoklar
WHERE Siralama = 1;
"></asp:SqlDataSource>

            <div class="action-button2">
                <asp:Button ID="btnGetSelectedValue" runat="server" Text="Veriyi Getir" OnClick="btnGetSelectedValue_Click" CssClass="btn bg-gradient-dark w-100 my-4 mb-2" />

                <script>
                    function OnGridLookupSelectedIndexChanged(s, e) {
                        var selectedValue = s.GetSelectedValues()[0];
                        document.getElementById('<%= TextBox1.ClientID %>').value = selectedValue;
                    }
                </script>
            </div>
            <br />
            <br />
               

                 <label class="form-check-label" for="flexCheckDefault">
                  Proses <a href="javascript:;" class="text-dark font-weight-bolder">Göz Sayısı</a>
                  </label>
            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"  Enabled="false"></asp:TextBox>

                 <label class="form-check-label" for="flexCheckDefault">
                    Proses <a href="javascript:;" class="text-dark font-weight-bolder" >Çevrim Süresi</a>
                  </label>
            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"  Enabled="false"></asp:TextBox>

                 <label class="form-check-label" for="flexCheckDefault">
                     Kalıp <a href="javascript:;" class="text-dark font-weight-bolder"> Tanım Bilgileri</a>
                  </label>
         <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>


    
            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>
            <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>
            <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>

           <%--                <div class="text-center">
                <h5>Gerçekleşme Tanımla</h5>
            </div>--%>
                       <br />
                        <label class="form-check-label" for="flexCheckDefault">
                    Farklımı ? <a href="javascript:;" class="text-dark font-weight-bolder">Gerçekleşmeleri Tanımla</a>
                  </label>
                         <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control" placeholder="Makine Numarası"  aria-label="Email" aria-describedby="email-addon"></asp:TextBox>
                       <br />

                       <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" placeholder="Göz Sayısı" aria-label="Email" aria-describedby="email-addon"></asp:TextBox>
                       <br />
                          <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" placeholder="Çevrim Süresi" aria-label="Email" aria-describedby="email-addon"></asp:TextBox>
              <br />
                            <div>
         <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control"></asp:DropDownList>
    
  


</asp:DropDownList>

            </div>
         
                 <br />
                <div class="form-check form-check-info text-left">
                  <input class="form-check-input" type="checkbox"  value="" id="flexCheckDefault" checked>
                  
                  <label class="form-check-label" for="flexCheckDefault">
                     %10<a href="javascript:;" class="text-dark font-weight-bolder"> Sapma Oranını Bildir </a>
                  </label>
                </div>
                <div class="text-center">
        
                    <asp:Button ID="Button1" CssClass="btn bg-gradient-dark w-100 my-4 mb-2" runat="server" OnClick="Button1_Click" Text="Kaydet" />
                </div>
         
        </form>
            
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
  <!-- -------- END FOOTER 3 w/ COMPANY DESCRIPTION WITH LINKS & SOCIAL ICONS & COPYRIGHT ------- -->
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