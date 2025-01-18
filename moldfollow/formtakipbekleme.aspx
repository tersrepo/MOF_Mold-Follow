<%@ Page Title="" Language="C#" MasterPageFile="~/Site4.Master" AutoEventWireup="true" CodeBehind="formtakipbekleme.aspx.cs" Inherits="moldfollow.formtakipbekleme" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <form runat="server">
            <h2 style="background-color:slategray;color:white;text-align:right;font-weight:bold">YENI ARIZA BILDIRIMLERI//</h2>
      <table class="table table-striped">
          <thead class="thead-dark">

        <tr> 
            <th scope="col">ID</th>
            <th scope="col">SORUMLU</th>
            <th scope="col">KALIP NO</th>
            <th scope="col">ACİLİYET</th>
            <th scope="col">TİP</th>
          
           
           <%-- <th scope="col">DETAY</th>--%>
           <%-- <th scope="col">AÇIKLAMA</th>--%>
            <th scope="col">BİLDİRİM</th>
            <th scope="col">OLUŞTURMA</th>
            <th scope="col">DURUM</th>
            <th scope="col">SIRAYA AL</th>
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
                           <td><%#Eval("kalipariza_down") %></td>
                           <td><%#Eval("kalipariza_downer") %></td>
                           <td><%#Eval("kalipariza_per") %></td>
                        <%-- <td><%#Eval("urkalipad ") %></td>--%>
                         <td><%#Eval("kalipariza_aciklama") %></td>
                       <%--  <td><%#Eval("detay_aciklama") %></td>--%>
                      <%--   <td><%#Eval("islem_aciklama") %></td>--%>
                         <td><%#Eval("kalipariza_baslangictar") %></td>
                    <%--     <td><%#Eval("arizasurec_ad") %></td>--%>
                         <td>
                                <%--<asp:HyperLink NavigateUrl='<%#"formduraklamaislem.aspx?kalipariza_id="+Eval("kalipariza_id") %>' ID="HyperLink3" runat="server" CssClass=" btn btn-info glyphicon glyphicon-pause"></asp:HyperLink>--%>
                             <asp:HyperLink NavigateUrl='<%#"formtakip.aspx?kalipariza_id="+Eval("kalipariza_id") %>' ID="HyperLink1" runat="server" CssClass=" btn btn-warning 	glyphicon glyphicon-cog" Font-Bold="true"></asp:HyperLink>
               

                         </td>
                         <td>
                
                     </tr>

                </ItemTemplate>

            </asp:Repeater>
        </tbody>
    </table>






    </form>

</asp:Content>
