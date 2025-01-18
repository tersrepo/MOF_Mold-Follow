<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="formdevamedenislem.aspx.cs" Inherits="moldfollow.formdevamedenislem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <h2 style="background-color:black;color:white;text-align:right;font-weight:bold">DEVAM EDEN ISLEMLER//</h2>
      <table class="table table-striped">
          <thead class="thead-dark">

        <tr> 
            <th scope="col">ID</th>
            <th scope="col">PERSONEL</th>
            <th scope="col">İŞLEM SINIF</th>
            <th scope="col">KALIP NO</th>
            <th scope="col">İSTASYON</th>
           <%-- <th scope="col">DETAY</th>--%>
           <%-- <th scope="col">AÇIKLAMA</th>--%>
            <th scope="col">BAŞLANGIÇ</th>
            <th scope="col">SEÇENEKLER</th>
            <th scope="col"></th>
          

        </tr>
              </thead>

        <tbody>
            <asp:Repeater ID="Repeater1" runat="server">

                <ItemTemplate>

                     <tr>
                         <td><%#Eval("islem_id") %></td>
                         <td><%#Eval("per_ad") %></td>
                         <td><%#Eval("surectip_ad") %></td>
                         <td><%#Eval("islem_kalipno") %></td>
                         <td><%#Eval("mak_isim") %></td>
                       <%--  <td><%#Eval("detay_aciklama") %></td>--%>
                      <%--   <td><%#Eval("islem_aciklama") %></td>--%>
                         <td><%#Eval("islem_baslama") %></td>
                         <td>
                                <asp:HyperLink NavigateUrl='<%#"formduraklamaislem.aspx?islem_id="+Eval("islem_id") %>' ID="HyperLink3" runat="server" CssClass=" btn btn-info glyphicon glyphicon-pause"></asp:HyperLink>
                             <asp:HyperLink NavigateUrl='<%#"formguncellemeislem.aspx?islem_id="+Eval("islem_id") %>' ID="HyperLink1" runat="server" CssClass=" btn btn-warning glyphicon glyphicon-ok" Font-Bold="true"></asp:HyperLink>
                          
                         <%--    <asp:HyperLink ID="HyperLink4" runat="server" CssClass="btn btn-info" > <> </asp:HyperLink>--%>
                   <%--          <asp:HyperLink NavigateUrl='<%#"formislemsil.aspx?islem_id="+Eval("islem_id") %>' ID="HyperLink2" runat="server" CssClass="btn btn-danger glyphicon glyphicon-trash"></asp:HyperLink>--%>
                  


                         </td>
                         <td>
                            <asp:HyperLink NavigateUrl='<%#"formislemsil.aspx?islem_id="+Eval("islem_id") %>' ID="HyperLink4" runat="server" CssClass="btn btn-danger glyphicon glyphicon-trash" Font-Bold="true"></asp:HyperLink></td>




                     </tr>

                </ItemTemplate>

            </asp:Repeater>
        </tbody>
    </table>

</asp:Content>
