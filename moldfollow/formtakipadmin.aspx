<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="formtakipadmin.aspx.cs" Inherits="moldfollow.formtakipadmin" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

      <form runat="server">

          <dx:BootstrapGridView ID="BootstrapGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" KeyFieldName="kalipariza_id">
              <SettingsDataSecurity AllowDelete="True" AllowEdit="True" />
              <Columns>
                  <dx:BootstrapGridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                  </dx:BootstrapGridViewCommandColumn>
                  <dx:BootstrapGridViewTextColumn FieldName="kalipariza_id" ReadOnly="True" VisibleIndex="1">
                      <SettingsEditForm Visible="False" />
                  </dx:BootstrapGridViewTextColumn>
                  <dx:BootstrapGridViewTextColumn FieldName="kalipariza_per" VisibleIndex="2">
                  </dx:BootstrapGridViewTextColumn>
                  <dx:BootstrapGridViewTextColumn FieldName="kalipariza_kalipno" VisibleIndex="3">
                  </dx:BootstrapGridViewTextColumn>
                  <dx:BootstrapGridViewTextColumn FieldName="kalipariza_aciklama" VisibleIndex="4">
                  </dx:BootstrapGridViewTextColumn>
                  <dx:BootstrapGridViewDateColumn FieldName="kalipariza_baslangictar" VisibleIndex="5">
                  </dx:BootstrapGridViewDateColumn>
              </Columns>
          </dx:BootstrapGridView>



          <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Db_kaliphanetakipConnectionString %>" SelectCommand="SELECT [kalipariza_id], [kalipariza_per], [kalipariza_kalipno], [kalipariza_aciklama], [kalipariza_baslangictar] FROM [UR_KALIPARIZA] ORDER BY [kalipariza_baslangictar] DESC"></asp:SqlDataSource>



          <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>




<asp:SqlDataSource ID="SqlDataSource4" runat="server"
     ConnectionString="<%$ ConnectionStrings:Db_kaliphanetakipConnectionString %>"
         SelectCommand="SELECT [kalipariza_id], [kalipariza_per], [kalipariza_kalipno], [kalipariza_aciklama], [kalipariza_baslangictar] FROM [UR_KALIPARIZA]" 
     DeleteCommand="DELETE FROM [UR_KALIPARIZA] WHERE [kalipariza_id]=@kalipariza_id" UpdateCommand="UPDATE [UR_KALIPARIZA] SET [kalipariza_per]=@kalipariza_per, [kalipariza_kalipno]=@kalipariza_kalipno, [kalipariza_aciklama]=@kalipariza_aciklama, [kalipariza_baslangictar]=@kalipariza_baslangictar WHERE [kalipariza_id]=@kalipariza_id">
    
     <DeleteParameters>
          <asp:Parameter Name="kalipariza_id" Type="Int32" />
     </DeleteParameters>
         <UpdateParameters>
          <asp:Parameter Name="kalipariza_per" Type="String" />
          <asp:Parameter Name="kalipariza_kalipno" Type="String" />
          <asp:Parameter Name="kalipariza_aciklama" Type="String" />
          <asp:Parameter Name="kalipariza_baslangictar" Type="DateTime" />
          <asp:Parameter Name="kalipariza_id" Type="Int32" />
     </UpdateParameters>

</asp:SqlDataSource>


      </form>
</asp:Content>

