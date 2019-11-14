<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="cuestionario.aspx.vb" Inherits="antiTabaco.cuestionario" EnableViewStateMac="false" EnableEventValidation="false" %>

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
    <%--<link rel="stylesheet" href="css/w3-theme-cyan.css">--%>
    <link id="MyStyleSheet" rel="stylesheet" type="text/css" runat="server" />
    <title>Estudia y vencerás!</title>
    <script type="text/javascript" >
        function ShowResp(btn_id, muestra) {
            var res = btn_id.split("_");
            var idPreg = res[1];
            var tpPreg = res[2];
            var x = document.getElementsByName("resp_" + idPreg);
            var i;
            for (i = 0; i < x.length; i++) {
                if (tpPreg == "M") {
                    if (x[i].getAttribute("escorrecta") == "S") {
                        if (x[i].parentElement.style.backgroundColor == "") {
                            x[i].parentElement.style.backgroundColor = "Chartreuse";
                        } else {
                            if (muestra != "S") {
                                x[i].parentElement.style.backgroundColor = "";
                            }   
                        }
                    } else {
                        if (x[i].checked) {
                            if (x[i].parentElement.style.backgroundColor == "") {
                                 x[i].parentElement.style.backgroundColor = "Red" ;
                            } else {
                                if (muestra != "S") {
                                    x[i].parentElement.style.backgroundColor = "";
                                } 
                            }
                        }
                    }
                }
            }
            return false;
        }
        function calificar() {
            var calif = 0;
            document.getElementById("txtCalif").value = "";
            var equiv = "";
            var x = document.querySelectorAll('[name^=preg_]')
            var i; var j;
            for (i = 0; i < x.length; i++) {
                var numPreg = x[i].getAttribute("name").split("_")[1];
                var idBtn ="btnresp_" + numPreg + "_M"
                ShowResp(idBtn,"S");
                var y = document.getElementsByName("resp_" + numPreg);
                for (j = 0; j < y.length; j++) {
                    if (y[j].getAttribute("escorrecta") == "S") {
                        if (y[j].checked) {
                            calif = calif + 1;
                        } else {
                            equiv = equiv + (equiv.length == 0 ? "" : ",") + numPreg;
                        }
                    }  
                }
            }
            document.getElementById("pnlRes").style.display = "block";
            document.getElementById("txtCalif").value = calif.toString() + "/" + x.length.toString();
            document.getElementById("equivField").value = equiv;
        }
    </script>
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
                <p><b>Desde la pregunta:</b>&nbsp&nbsp&nbsp<asp:TextBox ID="iniPreg" class="w3-border" type="number"  name="iniPreg" step="1" value="1" runat="server"></asp:TextBox></p>
            </div>
            <br />
            <div class="w3-theme-l5">
                <p><b>Aleatorio:</b>&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="chkRandom" CssClass="w3-check" runat="server" /></p>
            </div>
             <div class="w3-theme-l5">
                <p><b>Ver la Respuesta:</b>&nbsp&nbsp&nbsp<asp:CheckBox ID="chkResp" CssClass="w3-check" runat="server" Checked="True" /></p>
            </div>
            <div class="w3-theme-l5">
                <p><b>Desordenar Respuestas</b>&nbsp&nbsp&nbsp<asp:CheckBox ID="chkDesord" CssClass="w3-check" runat="server" Checked="True" /></p>
            </div>
            <div class="w3-theme-l5">
                <p><asp:Button ID="btnGenerar" class="w3-button"  runat="server" Text="Generar Examen" /></p>
            </div>
        </asp:Panel>
        <asp:Panel ID="pnlCuestionario" class="w3-container w3-theme w3-card w3-animate-right" runat="server" Visible="False">
            <p><asp:Button ID="btnRet" class="w3-button" runat="server" Text="Regresar"  /></p>
        </asp:Panel>
        <asp:Panel ID="pnlCalif" class="w3-theme-l5" runat="server" Visible="False">
            <p><asp:Button ID="btnCalif" class="w3-button" runat="server" Text="Calificar" Width="100%" OnClientClick="calificar();return false;" /></p>
        </asp:Panel>
        <asp:Panel ID="pnlRes" class="w3-container w3-theme w3-card w3-animate-right" runat="server" style="display:none">
            <div class="w3-theme-l5">
                <p><b>Tu calificacion es:</b>&nbsp&nbsp&nbsp<asp:TextBox ID="txtCalif" class="w3-border"  name="calif"  runat="server" ></asp:TextBox></p>
                <p><asp:Button ID="btnRet2" class="w3-button" runat="server" Text="Regresar"  /></p>
                <asp:HiddenField ID="equivField" runat="server" />
            </div>
        </asp:Panel>
    </form>
</body>
</html>
