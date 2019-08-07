<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Registrar.aspx.vb" Inherits="antiTabaco.Registrar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <link rel="stylesheet" href="css/w3.css" type="text/css" />
    <link rel="stylesheet" href="css/w3-theme-cyan.css">
    <title>Registro de usuario</title>
</head>
<body>
    <form id="form1" runat="server">
          <div class="w3-container w3-theme w3-card">
            <h1>Registro de Usuarios</h1>
        </div>
        <div class="w3-theme-l4"><p><b>
            <asp:Label ID="lblMsg" runat="server" Visible="False" ForeColor="Red"></asp:Label></b></p>
        </div>
        <div class="w3-theme-l5">
            <p><b>Cédula</b></p>
        </div>
        <asp:TextBox ID="txtCedula" style="margin-left:5% ;width: 95%;" class="w3-input w3-border" runat="server"></asp:TextBox>
         <div class="w3-theme-l5">
            <p><b>Nombres</b></p>
        </div>
        <asp:TextBox ID="txtNombres" style="margin-left:5% ;width: 95%;" class="w3-input w3-border" runat="server"></asp:TextBox>
 <div class="w3-theme-l5">
            <p><b>Numero celular para contacto (Whatsapp o llamadas)</b></p>
        </div>
        <asp:TextBox ID="txtCelu" style="margin-left:5% ;width: 95%;" class="w3-input w3-border" runat="server"></asp:TextBox>
         <div class="w3-theme-l5">
            <p><b>E-mail</b></p>
        </div>
        <asp:TextBox ID="txtemail" style="margin-left:5% ;width: 95%;" class="w3-input w3-border" runat="server"></asp:TextBox>
         <div class="w3-theme-l4 "  style ="text-align :right;">
             <asp:Button ID="btnLogin" runat="server" Text="Iniciar Sesion" class="w3-button w3-xlarge  w3-theme-action" > 
            </asp:Button>&nbsp &nbsp &nbsp
            <asp:Button ID="btnGuardar" runat="server" Text="Crear cuenta" class="w3-button w3-xlarge  w3-theme-action" >
            </asp:Button>
        </div>
    </form>
</body>
</html>
