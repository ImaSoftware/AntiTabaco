<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="antiTabaco.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="css/w3.css" type="text/css" />
    <link rel="stylesheet" href="css/w3-theme-cyan.css">
    <title>Sistema ingreso datos - Bienvenido</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="w3-theme-l4"><p><b>
            <asp:Label ID="lblMsg" runat="server" Visible="False" ForeColor="Red"></asp:Label></b></p>
        </div>
        <div class="w3-theme-l5">
            <p><b>Ingrese su número de cédula</b></p>
        </div>
        <asp:TextBox ID="txtCedula" style="margin-left:5% ;width: 95%;" class="w3-input w3-border" runat="server"></asp:TextBox>
         <div class="w3-theme-l4 "  style ="text-align :right;">
            <asp:Button ID="btnIniciar" runat="server" Text="Ingresar" class="w3-button w3-xlarge  w3-theme-action" >
            </asp:Button>
        </div>
    </form>
</body>
</html>
