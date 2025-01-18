<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="moldfollow.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <table class="table table-hover">
        
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Kalıp No</th>
            <th scope="col">Personel</th>
            <th scope="col">İstasyon</th>
            <th scope="col">İşlem Başla</th>
            <th scope="col">İşlem Bitir</th>
            <th scope="col">İşlem Sınıf</th>
            <th scope="col">İşlem Sürec</th>
            <th scope="col">İşlem Açıklama</th>
            <th scope="col">İşlem Persüre</th>
            <th scope="col">İşlem Detay</th>

        </tr>

        <tbody>
            <asp:Repeater ID="Repeater1" runat="server">

                <ItemTemplate>

                     <tr>
                         <td><%#Eval("islem_id") %></td>
                         <td><%#Eval("islem_kalipno") %></td>
                         <td><%#Eval("islem_personel") %></td>
                         <td><%#Eval("islem_istasyon") %></td>
                         <td><%#Eval("islem_baslama") %></td>
                         <td><%#Eval("islem_bitirme") %></td>
                         <td><%#Eval("islem_sinif") %></td>
                         <td><%#Eval("islem_surec") %></td>
                         <td><%#Eval("islem_aciklama") %></td>
                         <td><%#Eval("islem_persure") %></td>
                         <td><%#Eval("islem_detay") %></td>
                     </tr>

                </ItemTemplate>

            </asp:Repeater>
        </tbody>
    </table>

</asp:Content>

<%--<th scope="row">1</th>--%>
