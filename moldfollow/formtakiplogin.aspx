<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="formtakiplogin.aspx.cs" Inherits="moldfollow.formtakiplogin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style>
        table {
            
            border-collapse: collapse;
            width: 100%;
        }
        td, th {
          /*  border: 1px solid #dddddd;*/
            text-align: left;
            padding: 8px;
        }
        .form-control {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            box-sizing: border-box;
            border: 2px solid #ccc;
            border-radius: 1px;
        }
        .btn {
            width: 100%;
            background-color: orange;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: orangered;
        }
        .error {
            color: orange;
        }
        .container {
            background-color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
    </style>
</head>
<body>
    <div class="container">
        <form id="form1" runat="server">
            <div>
             
                <table>
                    <tr>
                        <td style="color:orange;">Kullanıcı</td>
                        <td><asp:TextBox ID="txtUsername" CssClass="form-control" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                      <td style="color:orange;">Şifre</td>
                        <td><asp:TextBox ID="txtPassword" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><asp:Button ID="btnLogin" CssClass="btn" runat="server" Text="Giris" OnClick="btnLogin_Click" /></td>
                    </tr>
                </table>
                <asp:Label ID="lblMessage" CssClass="error" runat="server"></asp:Label>
            </div>
        </form>
    </div>
</body>
</html>

