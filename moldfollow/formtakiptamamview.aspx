<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="formtakiptamamview.aspx.cs" Inherits="moldfollow.formtakiptamamview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">



    <form runat="server">

                <h2 style="background-color:slategray;color:white;text-align:right;font-weight:bold">TAMAMLANAN ARIZALAR//</h2>
      <table class="table table-striped" style="height: 265px">
          <thead class="thead-dark">

        <tr> 
            <th scope="col">ID</th>
            
  
            <th scope="col">KALIP NO</th>
          
     
             <th scope="col">YETKILI</th>
            <th scope="col">AÇIKLAMA</th>
            <th scope="col">TARIH</th>
           
            <th scope="col">DURUM</th>
            <th scope="col">SORUMLU</th>
            <th scope="col">SEÇENEKLER</th>
            <th scope="col"></th>
          

        </tr>
              </thead>

        <tbody>
            <asp:Repeater ID="Repeater2" runat="server">

                <ItemTemplate>
            
                     <tr>
                         <td><%#Eval("kalipariza_id") %></td>
                         
                         
                         
                         <td><%#Eval("kalipariza_kalipno") + " / " + Eval("urkalipad") %></td>
                          <td><%#Eval("kalipariza_upper") %></td>
                        <%-- <td><%#Eval("urkalipad ") %></td>--%>
                         <td><%#Eval("kalipariza_tip") %></td>
      
                         <td><%#Eval("kalipariza_islembitis") %></td>
                        
                         <td><%#Eval("arizasurec_ad") %></td>
                         <td><%#Eval("kalipariza_per") %></td>
                         <td>

                               <asp:HyperLink ID="HyperLink1" runat="server" CssClass=" btn btn-info glyphicon glyphicon-eye-close" Font-Bold="true"></asp:HyperLink>
                  


                         </td>
                         <td>



                     </tr>

                </ItemTemplate>

            </asp:Repeater>
        </tbody>
    </table>








    </form>
</asp:Content>
