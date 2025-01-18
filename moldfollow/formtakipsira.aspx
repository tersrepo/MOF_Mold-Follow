<%@ Page Title="" Language="C#" MasterPageFile="~/Site4.Master" AutoEventWireup="true" CodeBehind="formtakipsira.aspx.cs" Inherits="moldfollow.formtakipsira" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <form runat="server">

         <h2 style="background-color:black;color:white;text-align:right;font-weight:bold">İŞLEME ALINAN ARIZALAR//</h2>
      <table class="table table-striped" style="height: 265px">
          <thead class="thead-dark">

        <tr> 
            <th scope="col">ID</th>
            <th scope="col">SORUMLU</th>
  
            <th scope="col">KALIP NO</th>
          

            <th scope="col">BİLDİRİM</th>
            <th scope="col">İŞLEME ALINMA</th>
           <%-- <th scope="col">DURUM</th>--%>
            <th scope="col">İŞLEMİ TAMAMLA</th>
            <th scope="col"></th>
          

        </tr>
              </thead>

        <tbody>
            <asp:Repeater ID="Repeater2" runat="server">

                <ItemTemplate>
            
                     <tr>
                         <td><%#Eval("kalipariza_id") %></td>
                         <td><%#Eval("kalipariza_per") %></td>
                         
                         
                         <td><%#Eval("kalipariza_kalipno") + " / " + Eval("urkalipad") %></td>
            
                         <td><%#Eval("kalipariza_aciklama") %></td>
 
                         <td><%#Eval("kalipariza_islemtar") %></td>
 
                         <td>

                             <asp:HyperLink NavigateUrl='<%#"formtakipsiraupdate.aspx?kalipariza_id="+Eval("kalipariza_id") %>' ID="HyperLink1" runat="server" CssClass=" btn btn-success glyphicon glyphicon-ok" Font-Bold="true"></asp:HyperLink>
 

                         </td>
                         <td>

                     </tr>

                </ItemTemplate>

            </asp:Repeater>
        </tbody>
    </table>













    </form>
</asp:Content>
