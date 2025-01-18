<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HedefMiktar.aspx.cs" Inherits="moldfollow.HedefMiktar" %>

<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            background-color: #f0f0f0;
            font-family: Arial, sans-serif;
            color: #333;
        }

        h3 {
            color: #333;
        }

        #content {
            margin: 20px;
        }

        #ddlFilter {
            margin-bottom: 20px;
            font-size: 18px;
            padding: 10px;
            border: 2px solid #333; 
            border-radius: 5px; 
        }

        #GridView1 {
            border-collapse: collapse;
            width: 100%;
            text-align: center;
        }

        #GridView1 th {
            background-color: #333;
            color: white;
            padding: 10px;
        }

        #GridView1 td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        #GridView1 tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        #GridView1 tr:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
    <form runat="server">
        <div id="content">
            <h3>MONTAJ PANEL</h3>

             <asp:TextBox ID="txtSelectedDate" runat="server" TextMode="Date" placeholder="yyyy-MM-dd"></asp:TextBox>

            <asp:TextBox ID="txtEndDate" runat="server" TextMode="Date" placeholder="yyyy-MM-dd"></asp:TextBox>


            <br />
             <br />
            <br />

            <asp:DropDownList ID="ddlFilter" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlFilter_SelectedIndexChanged">
                <asp:ListItem Text="NGR" Value="NGR" />
                <asp:ListItem Text="FLATÖR" Value="FLATÖR" />
                <asp:ListItem Text="NGR2" Value="NGR-2" />
                <asp:ListItem Text="SÜZGEÇ PRESİ" Value="SÜZGEÇ PRESİ" />
                <asp:ListItem Text="FLT-2" Value="FLT-2" />
                <asp:ListItem Text="SIFON_BANDI" Value="SIFON_BANDI" />
            </asp:DropDownList>

         

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" >
           
 <Columns>
                <asp:BoundField DataField="KAYNAK" HeaderText="Kaynak" />
                <asp:BoundField DataField="IS_EMRI_NO" HeaderText="İş Emri No" />
               <asp:BoundField DataField="BASLANGIC_TARIH" HeaderText="Başlangıç Tarihi" SortExpression="BASLANGIC_TARIH" DataFormatString="{0:dd.MM.yyyy}" />
      
<%--                <asp:BoundField DataField="BASBITIS_TARIH" HeaderText="Bitiş Tarihi" SortExpression="BASBITIS_TARIH" DataFormatString="{0:dd.MM.yyyy}"  />--%>
       <%--         <asp:BoundField DataField="isemri_stokkodu" HeaderText="İş Emri Stok Kodu" />--%>
                <asp:BoundField DataField="sto_isim" HeaderText="Stok İsim" />
                <asp:BoundField DataField="SAAT_FARKI" HeaderText="Çalışılan Saat" />
                <asp:BoundField DataField="SAN_FARKI" HeaderText="İş Süresi" />
                <asp:BoundField DataField="durus" HeaderText="Durus Süresi" />
                <asp:BoundField DataField="Saniye" HeaderText="Gercek Süre" />
                <asp:BoundField DataField="goz_sayisi" HeaderText="Hedef Üretim" />
                <asp:BoundField DataField="GERCEKLESME_ADET" HeaderText="Gerceklesen Adet" />
                <asp:BoundField DataField="PROSES_PERSONEL_SAYISI" HeaderText="Proses Personel" />
        <%--        <asp:BoundField DataField="gerceklesme_personelsayisi" HeaderText="Gerceklesen Personel" DataFormatString="{0:0.0}" />--%>

                <asp:BoundField DataField="cevrim_suresi" HeaderText="Çevrim Süresi" />
            <%--    <asp:BoundField DataField="ROLLO" HeaderText="ROLL" />--%>
           
                <asp:BoundField DataField="Formul2" HeaderText="Formul2" />
    
            </Columns>
            </asp:GridView>
        </div>

    <script type="text/javascript">
        function showCalendar(txtBoxID, calID) {
            var txtBox = document.getElementById(txtBoxID);
            var cal = document.getElementById(calID);

            cal.style.position = "absolute";
            cal.style.display = (cal.style.display == "block" ? "none" : "block");
            cal.style.left = (txtBox.offsetLeft) + "px";
            cal.style.top = (txtBox.offsetTop + txtBox.offsetHeight) + "px";

            return false;
        }
    </script>
        

     
    </form>

    </body>
</html>
