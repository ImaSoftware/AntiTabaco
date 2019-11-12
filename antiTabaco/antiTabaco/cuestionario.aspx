<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="cuestionario.aspx.vb" Inherits="antiTabaco.cuestionario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" href="imagenes/dab.png">
    <script language="javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script language="javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script language="javascript" src="https://momentjs.com/downloads/moment.js"></script>
    <script language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.43/js/bootstrap-datetimepicker.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.43/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="css/w3_1.css" type="text/css" />
    <link id="MyStyleSheet" rel="stylesheet" type="text/css" runat="server" />
    <title>Estudia y vencerás!</title>
</head>
<body>
    <form id="Form1" runat="server">
        <div class="w3-theme-l4"><p><b>
            <asp:Label ID="lblMsg" runat="server" Visible="False" ForeColor="#FF3300"></asp:Label></b></p>
        </div>
        <asp:Panel ID="pnlInicio" class="w3-container w3-theme w3-card" runat="server">
            <h1>Simulador de Examen Legislación Laboral</h1>
            <b>SALMOS 43:1</b>
            <p class="result-wrap">
                Hazme justicia, oh Dios, y defiende mi causa contra una nación impía;  líbrame del hombre engañoso e injusto.</p>
            <br />
            <div class="w3-theme-l5">
                <p><b>Numero de Preguntas:</b>&nbsp&nbsp&nbsp<asp:TextBox ID="noPreg" class="w3-border" type="number"  name="noPreg" step="1" value="10" runat="server" ></asp:TextBox></p>
            </div>
            <br />
            <div class="w3-theme-l5">
                <p><b>Aleatorio:</b>&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="chkRandom" runat="server" />
                    &nbsp;&nbsp;&nbsp;
                    <b>Desde la pregunta:</b>&nbsp&nbsp&nbsp<asp:TextBox ID="iniPreg" class="w3-border" type="number"  name="iniPreg" step="1" value="1" runat="server"></asp:TextBox>
                </p>
            </div>
             <div class="w3-theme-l5">
                <p><b>Ver la Respuesta:</b>&nbsp&nbsp&nbsp<asp:CheckBox ID="chkResp" runat="server" />
                 </p>
            </div>
            <div class="w3-theme-l5">
                <p><asp:Button ID="btnGenerar" runat="server" Text="Generar Examen" /></p>
            </div>
        </asp:Panel>
        <asp:Panel ID="pnlCuestionario" class="w3-container w3-theme w3-card w3-animate-right" runat="server" Visible="False">

        </asp:Panel>
        <asp:Panel ID="pnlRes" class="w3-container w3-theme w3-card w3-animate-right" runat="server" Visible="False">

        </asp:Panel>
    </form>
</body>
</html>
