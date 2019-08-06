<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="carga_exitosa.aspx.vb" Inherits="antiTabaco.carga_exitosa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="css/w3.css" type="text/css" />
    <link rel="stylesheet" href="css/w3-theme-cyan.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="w3-container w3-theme w3-card">
            <h1>EnHoraBuena</h1>
        </div>
        <asp:Panel ID="pnlCtl1" class="w3-card-4" runat="server">
            <div class="w3-theme-l4"><p>La carga se realizó exitosamente. clic en el boton para ingresar una nueva espirometría</p></div>
            <div class="w3-theme-l4 "  style ="text-align :right;">
                <asp:Button ID="btnLogout" runat="server" Text="Cerrar Sesion" class="w3-button w3-xlarge  w3-theme-action" >
                </asp:Button>
                <asp:Button ID="btnVolver" runat="server" Text="Nueva Espirometría" class="w3-button w3-xlarge  w3-theme-action" >
                </asp:Button>
            </div>
        </asp:Panel>
    </form>
</body>
</html>
