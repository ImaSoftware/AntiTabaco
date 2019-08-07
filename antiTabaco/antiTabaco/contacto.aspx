<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="contacto.aspx.vb" Inherits="antiTabaco.contacto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <link rel="stylesheet" href="css/w3.css" type="text/css" />
    <link rel="stylesheet" href="css/w3-theme-cyan.css">
    <title>Contacto con Soporte</title>
</head>
<body text="haga clic aqui">
    <form id="form1" runat="server">
       <div class="w3-container w3-theme w3-card">
            <h1>Necesitas Ayuda?</h1>
        </div>
        <div class="w3-theme-l4"><p><b>
            <asp:Label ID="lblMsg" runat="server" Visible="False" ForeColor="Red"></asp:Label></b></p>
        </div>
        <div class="w3-theme-l5">
            <p><b>Consulta el video tutorial</b></p>
            <p><asp:HyperLink ID="hlink1" runat="server" NavigateUrl="https://www.youtube.com/watch?v=ilDUlyokdE4">Haga clic aqui para ver el tutorial</asp:HyperLink></p>
        </div>
       
         <div class="w3-theme-l5">
            <p><b>Envianos un mensaje (déjanos un email o celular para responderte)</b></p>
             <p>Nombres (vacío para mensajes anónimos)</p>
        </div>

        <asp:TextBox ID="txtNombres" style="width: 100%;" class="w3-input w3-border" runat="server"></asp:TextBox>
        <div class="w3-theme-l5">
            <p>Mensaje</p>
        </div>
        <asp:TextBox ID="txtmsg" runat="server" Height="142px" TextMode="MultiLine" Width="100%"></asp:TextBox>
        <div class="w3-theme-l4 "  style ="text-align :right;">
            <asp:Button ID="btnret" runat="server" Text="Regresar" class="w3-button w3-xlarge  w3-theme-action" > 
            </asp:Button>&nbsp&nbsp&nbsp
        <asp:Button ID="btnSend" runat="server" Text="Enviar Mensaje" class="w3-button w3-xlarge  w3-theme-action" > 
            </asp:Button>
            </div>
    </form>
</body>
</html>
