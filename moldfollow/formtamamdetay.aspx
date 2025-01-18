<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="formtamamdetay.aspx.cs" Inherits="moldfollow.formtamamdetay" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <h2 style="background-color:black;color:white;text-align:right;font-weight:bold">ISLEM DETAY//</h2>



    <form id="form1" runat="server">

         <h4 style="background-color:ghostwhite;color:black;text-align:center;font-weight:bold">BLOK
        </h4>
            <div>

                   <br />
        </div>
        <asp:Label for="İşlem ID" runat="server" Text="İşlem ID" Visible="False"></asp:Label>
        <asp:TextBox ID="id" runat="server" CssClass="form-control-static" Visible="False" ></asp:TextBox>
       
        <asp:Label for="Personel" runat="server" Text="Personel" Visible="False"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control-static" Visible="False" ></asp:TextBox>

        <asp:Label for="Kalıp Numarası" runat="server" Text="Kalıp Numarası" Visible="False"></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control-static" Visible="False" ></asp:TextBox>
    
       
        <div>

                   <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="islem_id" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" Height="48px" Width="1069px">
                       <Columns>
                           <asp:BoundField DataField="islem_kalipno" HeaderText="  -KALIP NO" SortExpression="islem_kalipno" />
                           <asp:BoundField DataField="per_ad" HeaderText="PERSONEL" SortExpression="per_ad" />
                           <asp:BoundField DataField="islem_id" HeaderText="ISLEM NO" InsertVisible="False" ReadOnly="True" SortExpression="islem_id" />
                       </Columns>
                       <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                       <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                       <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                       <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                       <SortedAscendingCellStyle BackColor="#F7F7F7" />
                       <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                       <SortedDescendingCellStyle BackColor="#E5E5E5" />
                       <SortedDescendingHeaderStyle BackColor="#242121" />
                   </asp:GridView>

                   <br />
        </div>
        <h4 style="background-color:ghostwhite;color:black;text-align:center;font-weight:bold">ZAMANLAMA
        </h4>

            <div>

                   <br />
        </div>
        <asp:Label for="Başlama Tarihi" runat="server" Text="Başlama" Visible="False"></asp:Label>
        <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control-static" Visible="False"></asp:TextBox>

        <asp:Label for="islemaciklama" runat="server" Text="Bitirme" Visible="False"></asp:Label>
        <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control-static" Visible="False"></asp:TextBox>

        <asp:Label for="islemaciklama" runat="server" Text="Toplam Süre" Visible="False"></asp:Label>
        <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control-static" TextMode="Number" Visible="False"></asp:TextBox>
         <br />
         <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="Black" GridLines="Horizontal" Height="48px" Width="1069px">
             <Columns>
                 <asp:BoundField DataField="islem_baslama" HeaderText="-BASLANGIC" SortExpression="islem_baslama" />
                 <asp:BoundField DataField="islem_persure" HeaderText="TOPLAM / DAK" SortExpression="islem_persure" />
                 <asp:BoundField DataField="islem_bitirme" HeaderText="SONLANDIRMA" SortExpression="islem_bitirme" />
             </Columns>
             <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
             <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
             <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
             <SortedAscendingCellStyle BackColor="#F7F7F7" />
             <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
             <SortedDescendingCellStyle BackColor="#E5E5E5" />
             <SortedDescendingHeaderStyle BackColor="#242121" />
         </asp:GridView>
         <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Db_kaliphanetakipConnectionString %>" SelectCommand="SELECT [islem_baslama], [islem_persure], [islem_bitirme] FROM [KT_ISLEMLER] WHERE ([islem_id] = @islem_id)">
             <SelectParameters>
                 <asp:ControlParameter ControlID="id" Name="islem_id" PropertyName="Text" Type="Int32" />
             </SelectParameters>
         </asp:SqlDataSource>
         <br />
        <h4 style="background-color:ghostwhite;color:black;text-align:center;font-weight:bold">DURUSLAR
        </h4>

         <div>

                   <br />
                   <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="Horizontal" Width="1069px" Height="48px">
                       <Columns>
                           <asp:BoundField DataField="durus_neden" HeaderText="-DURUS NEDEN" SortExpression="durus_neden" />
                           <asp:BoundField DataField="durus_min" HeaderText="DURUS DAKIKA" SortExpression="durus_min" />
                           <asp:BoundField DataField="durus_date" HeaderText="DURUS TARIH" SortExpression="durus_date" />
                       </Columns>
                       <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                       <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                       <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                       <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                       <SortedAscendingCellStyle BackColor="#F7F7F7" />
                       <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                       <SortedDescendingCellStyle BackColor="#E5E5E5" />
                       <SortedDescendingHeaderStyle BackColor="#242121" />
                   </asp:GridView>
                   <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Db_kaliphanetakipConnectionString %>" SelectCommand="SELECT [durus_neden], [durus_min], [durus_date] FROM [KT_DURUSLAR] WHERE ([durus_islemid] = @durus_islemid)">
                       <SelectParameters>
                           <asp:ControlParameter ControlID="id" Name="durus_islemid" PropertyName="Text" Type="Int32" />
                       </SelectParameters>
                   </asp:SqlDataSource>
        </div>

          <h4 style="background-color:ghostwhite;color:black;text-align:center;font-weight:bold">ISLEM ACIK</h4>
     

        <asp:Label for="İşlem Sınıf" runat="server" Text="Label">İşlem Sınıfı</asp:Label>
        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
        <div>
               <br />
        </div>

    

        <asp:Label for="İstasyon" runat="server" Text="Label">Tanımlı İstasyon</asp:Label>
        <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
        <div>
               <br />
        </div>

   

        <asp:Label for="islemaciklama" runat="server" Text="Label">Detay Açıklama</asp:Label>
        <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control"></asp:TextBox>
        <div>

        <br />
        </div>

        <asp:Label for="islemaciklama" runat="server" Text="Label">İşlem Açıklama</asp:Label>
        <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control"></asp:TextBox>
        <div>
            <br />
        </div>
        <h4 style="background-color:ghostwhite;color:black;text-align:center;font-weight:bold">MALIYET ORNEKLEM</h4>

        <div>

        <asp:Label for="islemaciklama" runat="server" Text="Gider / MIN" ID="Label1"></asp:Label>
        <asp:TextBox ID="TextBox10" runat="server" CssClass="form-control"></asp:TextBox>

        <asp:Label for="islemaciklama" runat="server" Text="Sarf Maliyet" ID="Label2"></asp:Label>
        <asp:TextBox ID="TextBox11" runat="server" CssClass="form-control"></asp:TextBox>

        <asp:Label for="islemaciklama" runat="server" Text="Label" ID="Label3">Ekipman</asp:Label>
        <asp:TextBox ID="TextBox12" runat="server" CssClass="form-control"></asp:TextBox>

        <asp:Label for="islemaciklama" runat="server" Text="Label" ID="Label4">Toplam Gider</asp:Label>
        <asp:TextBox ID="TextBox13" runat="server" CssClass="form-control"></asp:TextBox>
             <asp:Table ID="Table1" runat="server" Height="20px" Width="58px">
            </asp:Table>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Db_kaliphanetakipConnectionString %>" SelectCommand="	 SELECT KT_ISLEMLER.islem_kalipno, KT_PERSONEL.per_ad, KT_ISLEMLER.islem_id FROM KT_ISLEMLER INNER JOIN KT_PERSONEL ON KT_ISLEMLER.islem_personel = KT_PERSONEL.per_id WHERE (KT_ISLEMLER.islem_id = @islem_id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="id" Name="islem_id" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
             <br />
            </div>


            <asp:Button ID="Button1" runat="server" CssClass=" btn btn-danger  " Text="con-print" />

        <br />
            </div>

       


    </form>



    </form>



</asp:Content>
