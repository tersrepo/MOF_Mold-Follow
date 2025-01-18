<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="formduraklamalar.aspx.cs" Inherits="moldfollow.formduraklamalar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <h2 style="background-color:black;color:white;text-align:right;font-weight:bold">DURAKLATILAN ISLEMLER//</h2>

        <table class="table table-hover">

        <tr>
            <th scope="col">ID</th>
            <th scope="col">PERSONEL</th>
            <th scope="col">İŞLEM SINIF</th>
            <th scope="col">KALIP NO</th>
            <th scope="col">İSTASYON</th>
    <%--        <th scope="col">BAŞLAMA</th>--%>
            <th scope="col">BİTİRME</th>
            <th scope="col">SÜRE</th>
          <%--  <th scope="col">AÇIKLAMA</th>
            <th scope="col">ÇALIŞMA SÜRESİ</th>--%>
            <th scope="col">SEÇENEKLER</th>
          

        </tr>

        <tbody>
            <asp:Repeater ID="Repeater1" runat="server">

                <ItemTemplate>

                     <tr>
                         <td><%#Eval("islem_id") %></td>
                         <td><%#Eval("per_ad") %></td>
                         <td><%#Eval("surectip_ad") %></td>
                         <td><%#Eval("islem_kalipno") %></td>
                         <td><%#Eval("mak_isim") %></td>
                        <%-- <td><%#Eval("islem_baslama") %></td>--%>
                         <td><%#Eval("islem_bitirme") %></td>
                 <%--        <td><%#Eval("detay_aciklama") %></td>
                         <td><%#Eval("islem_aciklama") %></td>--%>
                         <td><%#Eval("islem_saat") +" -MIN" %></td>

                         <td>
                             <asp:HyperLink NavigateUrl='<%#"formtamamdetay.aspx?islem_id="+Eval("islem_id") %>'  ID="HyperLink1" runat="server" CssClass=" btn btn-info glyphicon glyphicon-eye-open" Font-Bold="true"></asp:HyperLink>
                             <asp:HyperLink NavigateUrl='<%#"formtimezone.aspx?islem_id="+Eval("islem_id") %>'  ID="HyperLink2" runat="server" CssClass=" btn btn-warning glyphicon 	glyphicon glyphicon-play"></asp:HyperLink>
     
                  


                         </td>



                     </tr>

                </ItemTemplate>

            </asp:Repeater>
        </tbody>
    </table>



</asp:Content>

