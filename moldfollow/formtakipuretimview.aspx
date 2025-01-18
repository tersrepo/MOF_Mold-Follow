<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="formtakipuretimview.aspx.cs" Inherits="moldfollow.formtakipuretimview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <form runat="server">
          <h2 style="background-color:slategray;color:white;text-align:right;font-weight:bold">BEKLEYEN ISLEMLER//</h2>
      <table class="table table-striped">
          <thead class="thead-dark">

        <tr> 
            <th scope="col">ID</th>
            <th scope="col">SORUMLU</th>
            <th scope="col">KALIP NO</th>
          
           
           <%-- <th scope="col">DETAY</th>--%>
           <%-- <th scope="col">AÇIKLAMA</th>--%>
            <th scope="col">BİLDİRİM</th>
            <th scope="col">OLUŞTURMA</th>
            <th scope="col">DURUM</th>
   <%--         <th scope="col">SEÇENEKLER</th>--%>
            <th scope="col"></th>
          

        </tr>
              </thead>

        <tbody>
            <asp:Repeater ID="Repeater1" runat="server">

                <ItemTemplate>
            
                     <tr>
                         <td><%#Eval("kalipariza_id") %></td>
                         <td><%#Eval("kalipariza_per") %></td>
                         
                         <td><%#Eval("kalipariza_kalipno") + " / " + Eval("urkalipad") %></td>
                        <%-- <td><%#Eval("urkalipad ") %></td>--%>
                         <td><%#Eval("kalipariza_aciklama") %></td>
                       <%--  <td><%#Eval("detay_aciklama") %></td>--%>
                      <%--   <td><%#Eval("islem_aciklama") %></td>--%>
                         <td><%#Eval("kalipariza_baslangictar") %></td>
                         <td><%#Eval("arizasurec_ad") %></td>
                         <td>

                     </tr>

                </ItemTemplate>     


            </asp:Repeater>
        </tbody>
    </table>






    </form>






    </form>




</asp:Content>
