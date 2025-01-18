<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="formtakipekle.aspx.cs" Inherits="moldfollow.formtakipekle" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <form runat="server">
       <h2 style="background-color:slategray;color:white;text-align:right;font-weight:bold">KALIP ARIZA BILDIR//</h2>
            
            <div>
            <asp:Label for="DropDownList1" runat="server" Text="Label">Sorumlu</asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="urper_ad" DataValueField="urper_ad"></asp:DropDownList>
      </div>

        <br />





            <asp:Label for="ASPxGridLookup1" runat="server" Text="Label">Kalıp Numarası</asp:Label> 
        <dx:ASPxGridLookup ID="ASPxGridLookup1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" EnableTheming="True"  KeyFieldName="Kalıp No"  Theme="Metropolis" AutoGenerateColumns="False">
<GridViewProperties>
<SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>
</GridViewProperties>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Kalıp No" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Kalıp Adı" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
            </Columns>
            <clearbutton displaymode="Always">
            </clearbutton>
        </dx:ASPxGridLookup>

                    <head>
        <title>Example of a blinking text using CSS within a marquee</title>
        <style>
            .blink {
                animation: blinker 1.5s linear infinite;
                color: orange;
                font-family: sans-serif;
            }
            @keyframes blinker {
                50% {
                    opacity: 0;
                }
            }
        </style>
    </head>

    <body>
        <marquee class="blink" direction=right>KALIP NUMARASI OLMAYAN İSLEMLER KAYDEDİLEMEZ</marquee>
    </body>
        <asp:Label for="DropDownList2" runat="server" Text="Label">İşlem Öncelik</asp:Label>
        <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" DataSourceID="SqlDataSource3" DataTextField="talepacil_ad" DataValueField="talepacil_ad"></asp:DropDownList>
             <marquee class="blink" direction=right>1.Derece (STOĞU OLMAYAN)  -  2.Derece (STOĞU OLAN)</marquee>
        <br />
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Db_kaliphanetakipConnectionString %>" SelectCommand="SELECT [talepacil_id], [talepacil_ad] FROM [UR_TALEPACİL]"></asp:SqlDataSource>
         <asp:Label for="DropDownList3" runat="server" Text="Label">Talep Neden</asp:Label>
        <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control" DataSourceID="SqlDataSource4" DataTextField="talepneden_ad" DataValueField="talepneden_ad"></asp:DropDownList>

        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Db_kaliphanetakipConnectionString %>" SelectCommand="SELECT [talepneden_id], [talepneden_ad] FROM [UR_TALEPNEDEN]"></asp:SqlDataSource>

    <br />

        
        <asp:Label for="islemaciklama" runat="server" Text="Label">Arıza Açıklama</asp:Label>
        <asp:TextBox ID="islemaciklama" runat="server" CssClass="form-control"></asp:TextBox>

           
        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Visible="False"></asp:TextBox>
      
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Db_kaliphanetakipConnectionString %>" SelectCommand="SELECT [urper_ad], [urper_number] FROM [UR_PERSONEL]"></asp:SqlDataSource>
      
        <br />

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Nopeksis_V7Conn %>" SelectCommand="
Select kaynak_kisaad AS 'Kalıp No', kaynak_aciklama AS 'Kalıp Adı' From KAYNAKLAR WHERE kaynak_sinif=1 and kaynak_isletme=1 and kaynak_durum=1 "></asp:SqlDataSource>

        <br />
         <asp:Label for="islembasla" runat="server" Text="Label">Bildirim Tarihi</asp:Label>
        <asp:TextBox ID="islembasla" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>

        <br />

        <asp:Button ID="Button1" runat="server" Text="SURECI BASLAT" CssClass=" btn btn-block" OnClick="Button1_Click1" />






</form>



    
            

</asp:Content>
