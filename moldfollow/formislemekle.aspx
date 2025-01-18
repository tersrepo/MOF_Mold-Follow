<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="formislemekle.aspx.cs" Inherits="moldfollow.formislemekle" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <form id="Form1" runat="server">

        <div class="form-group">

            <h2 style="background-color:black;color:white;text-align:right;font-weight:bold">YENI ISLEM TANIMLA//</h2>
            
            <div></div>
            <asp:Label for="DropDownList1" runat="server" Text="Label">Personel Sec</asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>

        <div>
        </div>

        <asp:Label for="ASPxGridLookup1" runat="server" Text="Label">Kalıp Numarası [Kalıp Numarası Seçilmeyen İşlemler Kaydedilemez]</asp:Label>
        <div>

            <dx:ASPxGridLookup ID="ASPxGridLookup1" runat="server" CssClass="form-control" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="Kalıp No" Theme="Metropolis" EnableTheming="True">
                <GridViewProperties>
                    <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>
                </GridViewProperties>
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="Kalıp No" ReadOnly="true" VisibleIndex="0" Width="30px">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Kalıp Adı" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                </Columns>
                <ClearButton DisplayMode="Always">
                </ClearButton>
            </dx:ASPxGridLookup>
            <br />
        </div>

        <asp:Label for="DropDownList2" runat="server" Text="Label">İşlem Sınıfı</asp:Label>
        <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control"></asp:DropDownList>
        <div>
            <br />
        </div>

        <asp:Label for="DropDownList5" runat="server" Text="Label">Makina Grubu</asp:Label>
        <asp:DropDownList ID="DropDownList5" runat="server" CssClass="form-control" AutoPostBack="True" DataSourceID="istasyongrupds" DataTextField="anamak_ad" DataValueField="anamak_id"></asp:DropDownList>
        <asp:SqlDataSource ID="istasyongrupds" runat="server" ConnectionString="<%$ ConnectionStrings:anagrupbgl %>" SelectCommand="SELECT * FROM [KT_ANAMAKİNA] ORDER BY [anamak_id]"></asp:SqlDataSource>
        <div>
            <br />
        </div>

        <asp:Label for="DropDownList7" runat="server" Text="Label">Makina</asp:Label>
        <asp:DropDownList ID="DropDownList7" runat="server" CssClass="form-control" DataSourceID="makineds" DataTextField="mak_isim" DataValueField="mak_id"></asp:DropDownList>
        <asp:SqlDataSource ID="makineds" runat="server" ConnectionString="<%$ ConnectionStrings:anagrupbgl %>" SelectCommand="SELECT [mak_id], [mak_isim] FROM [KT_MAKINATIP] WHERE ([mak_grup] = @mak_grup) ORDER BY [mak_isim]">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList5" Name="mak_grup" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <div>
            <br />
        </div>

        <asp:Label for="DropDownList3" runat="server" Text="Label">İşlem Detay</asp:Label>
        <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control"></asp:DropDownList>
        <div>
            <br />

        </div>

        <asp:Label for="islemaciklama" runat="server" Text="Label">İşlem Açıklama</asp:Label>
        <asp:TextBox ID="islemaciklama" runat="server" CssClass="form-control"></asp:TextBox>
        <div>
             <br />

        </div>
            
            &nbsp;<asp:Button ID="Button1" runat="server" Text="SÜRECİ BASLAT" CssClass=" btn btn-block" OnClick="Button1_Click" />
            
            <br />
   
    

        <asp:Label for="hesaplanansure" runat="server" Text="Hesaplanan Süre" Visible="False"></asp:Label>
        <asp:TextBox ID="hesaplanansure" runat="server" CssClass="form-control" Visible="False"></asp:TextBox>
        <div>

            <br />
 
        </div>

        <asp:Label for="islembasla" runat="server" Text="Baslama Saat" Visible="False"></asp:Label>
        <asp:TextBox ID="islembasla" runat="server" CssClass="form-control" Visible="False"></asp:TextBox>

        <div>

            <br />

        </div>

        <asp:Label for="islembitir" runat="server" Text="Bitirme Saat" Visible="False"></asp:Label>
        <asp:TextBox ID="islembitir" runat="server" CssClass="form-control" Visible="False"></asp:TextBox>
        <div>
            <br />
        </div>

        <asp:Label for="islemsurec" runat="server" Text="Surec" Visible="False"></asp:Label>
        <asp:TextBox ID="islemsurec" runat="server" CssClass="form-control" Visible="False"></asp:TextBox>

        <div>

            <br />

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MikroDB_V16_SA20ConnectionString %>" SelectCommand="SELECT       RIGHT(pro_kodu,3) AS 'Kalıp No',pro_adi as 'Kalıp Adı'
                                 FROM            dbo.PROJELER ORDER BY pro_kodu DESC"></asp:SqlDataSource>




            <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
            <asp:TextBox ID="TextBox2" runat="server" Visible="False"></asp:TextBox>


            <br />

        </div>
        


    </form>




</asp:Content>
