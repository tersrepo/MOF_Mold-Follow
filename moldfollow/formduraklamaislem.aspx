<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="formduraklamaislem.aspx.cs" Inherits="moldfollow.formduraklamaislem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

        <form id="Form2" runat="server">

            <h2 style="background-color:black;color:white;text-align:right;font-weight:bold">DURAKLAMA NEDENI//</h2>
                    <br />
        <br />
                    <br />
      
       

        

            <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="durusacik_neden" DataValueField="durusacik_neden"></asp:DropDownList>


            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Db_kaliphanetakipConnectionString %>" SelectCommand="SELECT [durusacik_neden] FROM [KT_DURUSNEDEN]"></asp:SqlDataSource>
                    <br />
        <br />


            <asp:Button ID="Button1" runat="server" Text="ISLEMI DURAKLAT" CssClass="btn btn-block" OnClick="Button1_Click" />



    
        <asp:TextBox ID="TextBox1" runat="server" Height="22px" Width="128px" Visible="False"></asp:TextBox>
        <br />
        <br />
        <asp:TextBox ID="TextBox2" runat="server" Visible="False"></asp:TextBox>
        <br />
        <br />
        <asp:TextBox ID="TextBox3" runat="server" Visible="False"></asp:TextBox>
        <br />
        <br />
        <asp:TextBox ID="TextBox4" runat="server" Visible="False"></asp:TextBox>
        <br />
        <asp:TextBox ID="TextBox5" runat ="server" Visible="False"></asp:TextBox>
        <br />
        <asp:TextBox ID="TextBox6" runat="server" Visible="False"></asp:TextBox>
        <br />
        <asp:TextBox ID="TextBox7" runat="server" Visible="False"></asp:TextBox>
            <asp:TextBox ID="TextBox8" runat="server" Visible="False"></asp:TextBox>
        <br />
    </form>
           






          

</asp:Content>

