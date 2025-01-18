<%@ Page Title="" Language="C#" MasterPageFile="~/Site4.Master" AutoEventWireup="true" CodeBehind="formtakipsiraupdate.aspx.cs" Inherits="moldfollow.formtakipsiraupdate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <form runat="server">
        
            <h2 style="background-color:black;color:white;text-align:right;font-weight:bold">ARIZA NEDENI//</h2>
                    <br />
        <br />
                    <br />
        <asp:Label for="islemaciklama2" runat="server" Text="Label">Arıza Tipi</asp:Label>

                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="arizatespit_ad" DataValueField="arizatespit_ad"></asp:DropDownList>

             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Db_kaliphanetakipConnectionString %>" SelectCommand="SELECT [arizatespid_id], [arizatespit_ad] FROM [UR_ARIZATESPIT]"></asp:SqlDataSource>

             <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" Enabled="False" Visible="False"></asp:TextBox>
            <br />

         <asp:Label for="islemaciklama" runat="server" Text="Label">Arıza Sebebi</asp:Label>
            <br />
        <asp:TextBox ID="islemaciklama" runat="server" CssClass="form-control"></asp:TextBox>
                     <br />

        <br />
                    <br />
              <asp:Button ID="Button1" runat="server" Text="ONAYLA" CssClass="btn btn-block" OnClick="Button1_Click" />

     





        <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>

        <asp:TextBox ID="TextBox2" runat="server" Visible="False"></asp:TextBox>

        <asp:TextBox ID="TextBox3" runat="server" Visible="False"></asp:TextBox>










    </form>


</asp:Content>
