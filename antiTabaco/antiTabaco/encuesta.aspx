<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="encuesta.aspx.vb" Inherits="antiTabaco.encuesta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script language="javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script language="javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script language="javascript" src="https://momentjs.com/downloads/moment.js"></script>
    <script language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.43/js/bootstrap-datetimepicker.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.43/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="css/w3.css" type="text/css" />
    <link rel="stylesheet" href="css/w3-theme-cyan.css">
    <title>Ingresar Espirometría</title>
</head>
<body>

    <form id="form1" runat="server">
        <div class="w3-container w3-theme w3-card">
            <h1>Encuesta &nbsp&nbsp&nbsp<asp:Button ID="btnsalir" runat="server" Text="CerrarSesion" class="w3-button w3-xlarge  w3-theme-action" >
                </asp:Button>
            </h1>
        </div>
        <div class="w3-theme-l4"><p><b>
            <asp:Label ID="lblMsg" runat="server" Visible="False" ForeColor="#FF3300"></asp:Label></b></p>
        </div>
        <asp:Panel ID="pnlCtl1" class="w3-card-4" runat="server">
            <div class="w3-theme-l5">
                <p><b>Edad</b></p>
            </div>
            <div class="form-group required">
                <div class="input-group">
                     <input class="w3-border" type="number" style="width:20%" name="edad" step="any" value="0">
                </div>
            </div>
            <div class="w3-theme-l5">
                <p><b>Sexo</b></p>
            </div>
            <div style="padding-left:5%">
                <input id="btnMale" class="w3-radio" type="radio" name="gender" value="M" checked="">
                <label>Masculino</label>
                <input id="btnFem" class="w3-radio" type="radio" name="gender" value="F">
                <label>Femenino</label>
            </div>
            <div class="w3-theme-l5">
                <p><b>Facultad</b></p>
            </div>
            <asp:DropDownList ID="cmbFacultad" runat="server">
                <asp:ListItem Selected ="True" Value="Ciencias Médicas" Text="Ciencias Médicas"></asp:ListItem>
                <asp:ListItem Value="Administración" Text="Administración"></asp:ListItem>
                <asp:ListItem Value="Jurisprudencia" Text="Jurisprudencia"></asp:ListItem>
            </asp:DropDownList>
            <div class="w3-theme-l5">
                <p><b>Raza</b></p>
            </div>
            <asp:DropDownList ID="cmbRaza" runat="server">
                <asp:ListItem Value="Caucásica" Text="Caucásica"></asp:ListItem>
                <asp:ListItem Value="Mestiza" Text="Mestiza" Selected="True" ></asp:ListItem>
                <asp:ListItem Value="Mestiza" Text="Indígena"></asp:ListItem>
            </asp:DropDownList>
            <div class="w3-theme-l4"><p><b>Preguntas</b></p></div>
            <div class="w3-theme-l5"><p>1) ¿Usted ha fumado alguna vez?</p>
                <div style="padding-left:5%">
                    <input id="chk1S" class="w3-radio" type="radio" name="chk1" value="S"  >Si &nbsp &nbsp
                     <input id="chk1N"  class="w3-radio" type="radio" name="chk1" value="N" checked="">No</div>
            </div>
            <div class="w3-theme-l5"><p>2) ¿Cuantos cigarrillos fuma al día?</p>
                <div style="padding-left:5%"><input  class="w3-radio" type="radio" name="chk2" value="1" >Entre 1 a 5&nbsp &nbsp
                <input  class="w3-radio" type="radio" name="chk2" value="2" >Entre 5 a 10&nbsp &nbsp
                <input  class="w3-radio" type="radio" name="chk2" value="3" >1 cajetilla o mas
                </div>
            </div>
            <div class="w3-theme-l5"><p>3) ¿Cuál es la razón para que usted fume?</p>
                <div style="padding-left:5%"><input  class="w3-radio" type="radio" name="chk3" value="1" >Por estrés &nbsp &nbsp
                <input  class="w3-radio" type="radio" name="chk3" value="2" >Por placer&nbsp &nbsp
                <input  class="w3-radio" type="radio" name="chk3" value="3" >Factor Social
                </div>
            </div>
            <div class="w3-theme-l5"><p>4) ¿Desde qué edad usted comenzó a fumar cigarrillos?</p>
                <div style="padding-left:5%"><input  class="w3-radio" type="radio" name="chk4" value="1"  >< 16 años &nbsp &nbsp
                <input  class="w3-radio" type="radio" name="chk4" value="2" >Entre 16 - 18 años&nbsp &nbsp
                <input  class="w3-radio" type="radio" name="chk4" value="3" >> 18 años</div>
            </div>
            <div class="w3-theme-l5"><p>5) ¿Con qué frecuencia usted presenta problemas respiratorios?</p>
               <div style="padding-left:5%"><input class="w3-radio" type="radio" name="chk5" value="1" >1 vez al año&nbsp &nbsp
                <input class="w3-radio" type="radio" name="chk5" value="2" >2 veces al año&nbsp &nbsp
                <input class="w3-radio" type="radio" name="chk5" value="3" >+ 3 veces al año</div>
            </div>
            
            <div class="w3-theme-l5"><p>6) ¿Cuál de los siguientes signos o síntomas usted ha experimentado en los últimos 3 meses? </p>
                <div style="padding-left:5%"> Tos Seca &nbsp &nbsp 
                    <input class="w3-radio" type="radio" name="chk6_1" value="S"  >Si &nbsp &nbsp
                     <input class="w3-radio" type="radio" name="chk6_1" value="N"checked="">No</div>
                <div style="padding-left:5%">Garganta irritada &nbsp &nbsp 
                    <input class="w3-radio" type="radio" name="chk6_2" value="S"  >Si &nbsp &nbsp
                     <input class="w3-radio" type="radio" name="chk6_2" value="N"checked="">No</div>
                <div style="padding-left:5%"> Disnea &nbsp &nbsp 
                    <input class="w3-radio" type="radio" name="chk6_3" value="S"  >Si &nbsp &nbsp
                     <input class="w3-radio" type="radio" name="chk6_3" value="N"checked="">No</div>
                <div style="padding-left:5%">Rinorrea &nbsp &nbsp 
                    <input class="w3-radio" type="radio" name="chk6_4" value="S"  >Si &nbsp &nbsp
                     <input class="w3-radio" type="radio" name="chk6_4" value="N"checked="">No</div>
            </div>
            <div class="w3-theme-l5"><p>7) ¿Conoce usted los riesgos para la salud que provoca el humo del tabaco a las personas a su alrededor?</p>
                <div style="padding-left:5%">
                    <input  class="w3-radio" type="radio" name="chk7" value="S">Si &nbsp &nbsp
                     <input  class="w3-radio" type="radio" name="chk7" value="N"checked="">No</div>
            </div>
            <div class="w3-theme-l5"><p>8) ¿Alguna vez usted ha intentado dejar el hábito del tabaco?</p>
                <div style="padding-left:5%">
                    <input  class="w3-radio" type="radio" name="chk8" value="S"  >Si &nbsp &nbsp
                     <input class="w3-radio" type="radio" name="chk8" value="N"checked="">No</div>
            </div>
            <div class="w3-theme-l5"><p>9) ¿Tiene usted conocimiento de guías para la deshabituación tabáquica?</p>
                <div style="padding-left:5%">
                    <input  class="w3-radio" type="radio" name="chk9" value="S"  >Si &nbsp &nbsp
                     <input  class="w3-radio" type="radio" name="chk9" value="N"checked="">No</div>
            </div>
            <div class="w3-theme-l5"><p><b>10) ¿Estaría usted dispuesto a seguir la guía para el proceso de la deshabituación tabáquica?</b></p>
                <div style="padding-left:5%">
                    <input  class="w3-radio" type="radio" name="chk10" value="S"  >Si &nbsp &nbsp
                     <input class="w3-radio" type="radio" name="chk10" value="N"checked="">No</div>
            </div>
            <div class="w3-theme-l5"><p>Comentario</p>
                <div style="padding-left:5%">
                    <asp:TextBox ID="txtComm"  class="w3-border" runat="server" TextMode="MultiLine" Height="195px" Width="100%"></asp:TextBox>
                </div>
            </div>
            <div class="w3-theme-l4 "  style ="text-align :right;">
                <asp:Button ID="btnNext" runat="server" Text="Grabar Encuesta" class="w3-button w3-xlarge  w3-theme-action" >
                </asp:Button>
            </div>
        </asp:Panel>
      </form>
</body>
</html>
