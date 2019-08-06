<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="espirometria.aspx.vb" Inherits="antiTabaco.espirometria" %>

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
            <h1>Espirometria</h1>
        </div>
        <div class="w3-theme-l4"><p><b>
            <asp:Label ID="lblMsg" runat="server" Text="" Visible="False">
            </asp:Label></b></p>
        </div>
        <asp:Panel ID="pnlCtl1" class="w3-card-4" runat="server">
            <div class="w3-theme-l4"><p><b>Datos Generales</b></p></div>
            <div class="w3-theme-l5">
                <p><b>Fecha</b></p>
            </div>
            <div class="form-group required">
                <div class="input-group">
                    <asp:TextBox ID="dtfecha" style="font-size:40px;margin-left:5%;width: 95%;height:auto;" class="w3-input w3-border form-control datepickNow"  runat="server" required></asp:TextBox>
                    <div class="input-group-addon"></div>
                </div>
            </div>
            <div class="w3-theme-l5">
                <p><b>Nombre</b></p>
            </div>
            <asp:TextBox ID="txtNombre" style="margin-left:5% ;width: 95%;" class="w3-input w3-border" runat="server"></asp:TextBox>
            <div class="w3-theme-l5">
                <p><b>Fecha de Nacimiento</b></p>
            </div>
            <div class="form-group required">
                <div class="input-group">
                    <asp:TextBox ID="dtNace" style="font-size:40px;margin-left:5%; top: 0px; left: 0px;width: 95%;height:auto;" class="w3-input w3-border w3-rest form-control datepickNace"  runat="server" required></asp:TextBox>
                    <div class="input-group-addon"></div>
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
                <p><b>Provincia</b></p>
            </div>
            <asp:DropDownList ID="cmbProvincia" runat="server">
                <asp:ListItem Value="Azuay" Text="Azuay"></asp:ListItem>
                <asp:ListItem Value="Bolívar" Text="Bolívar"></asp:ListItem>
                <asp:ListItem Value="Cañar" Text="Cañar"></asp:ListItem>
                <asp:ListItem Value="Carchi" Text="Carchi"></asp:ListItem>
                <asp:ListItem Value="Chimborazo" Text="Chimborazo"></asp:ListItem>
                <asp:ListItem Value="Cotopaxi" Text="Cotopaxi"></asp:ListItem>
                <asp:ListItem Value="El Oro" Text="El Oro"></asp:ListItem>
                <asp:ListItem Value="Esmeraldas" Text="Esmeraldas"></asp:ListItem>
                <asp:ListItem Value="Galápagos" Text="Galápagos"></asp:ListItem>
                <asp:ListItem Value="Guayas" Text="Guayas" Selected ="True"></asp:ListItem>
                <asp:ListItem Value="Imbabura" Text="Imbabura"></asp:ListItem>
                <asp:ListItem Value="Loja" Text="Loja"></asp:ListItem>
                <asp:ListItem Value="Los Ríos" Text="Los Ríos"></asp:ListItem>
                <asp:ListItem Value="Manabí" Text="Manabí"></asp:ListItem>
                <asp:ListItem Value="Morona Santiago" Text="Morona Santiago"></asp:ListItem>
                <asp:ListItem Value="Napo" Text="Napo"></asp:ListItem>
                <asp:ListItem Value="Orellana" Text="Orellana"></asp:ListItem>
                <asp:ListItem Value="Pichincha" Text="Pichincha"></asp:ListItem>
                <asp:ListItem Value="Santa Elena" Text="Santa Elena"></asp:ListItem>
                <asp:ListItem Value="Santo Domingo de los Tsáchilas" Text="Santo Domingo de los Tsáchilas"></asp:ListItem>
                <asp:ListItem Value="Sucumbíos" Text="Sucumbíos"></asp:ListItem>
                <asp:ListItem Value="Tungurahua" Text="Tungurahua"></asp:ListItem>
                <asp:ListItem Value="Zamora Chinchipe" Text="Zamora Chinchipe"></asp:ListItem>
            </asp:DropDownList>
            <div class="w3-theme-l4"><p><b>Criterios de Exclusion</b></p></div>
            <div class="w3-theme-l5"><p>¿Tuvo desprendimiento de la retina o una operación (cirugía) de los ojos, tórax o abdomen, en los últimos 3 meses?</p>
                <div style="padding-left:5%">
                    <input id="chk1S" class="w3-radio" type="radio" name="chk1" value="S"  >Si &nbsp &nbsp
                     <input id="chk1N"  class="w3-radio" type="radio" name="chk1" value="N"checked="">No</div>
            </div>
            <div class="w3-theme-l5"><p>¿Ha tenido algún ataque cardíaco o infarto al corazón en los últimos 3 meses?</p>
                <div style="padding-left:5%"><input id="chk2S" class="w3-radio" type="radio" name="chk2" value="S" >Si&nbsp &nbsp
                <input id="chk2N" class="w3-radio" type="radio" name="chk2" value="N" checked="">No</div>
            </div>
            <div class="w3-theme-l5"><p>¿has estado hospitalizado(a) por cualquier otro problema del corazón en los últimos 3 meses?</p>
                <div style="padding-left:5%"><input id="chk3S" class="w3-radio" type="radio" name="chk3" value="S" checked="">Si &nbsp &nbsp
                <input id="chk3N" class="w3-radio" type="radio" name="chk3" value="N" checked="">No</div>
            </div>
            <div class="w3-theme-l5"><p>¿Está usando medicamentos para la tuberculosis, en este momento?</p>
                <div style="padding-left:5%"><input id="chk4S" class="w3-radio" type="radio" name="chk4" value="S" >Si &nbsp &nbsp
                <input id="chk4N" class="w3-radio" type="radio" name="chk4" value="N" checked="">No</div>
            </div>
            <div class="w3-theme-l5"><p>En caso de ser mujer. ¿Está usted embarazada actualmente?</p>
               <div style="padding-left:5%"><input id="chk5S" class="w3-radio" type="radio" name="chk5" value="S" >Si&nbsp &nbsp
                <input id="chk5N" class="w3-radio" type="radio" name="chk5" value="N" checked="">No</div>
            </div>
            <div class="w3-theme-l4"><p><b>Para ser llenado por el profesional que realiza la prueba</b></p></div>
            <div class="w3-theme-l5"><p>HEMOPTISIS</p>
                <div style="padding-left:5%">
                    <input id="chk6S" class="w3-radio" type="radio" name="chk6" value="S"  >Si &nbsp &nbsp
                     <input id="chk6N"  class="w3-radio" type="radio" name="chk6" value="N"checked="">No</div>
            </div>
            <div class="w3-theme-l5"><p>PNEUMOTORAX</p>
                <div style="padding-left:5%">
                    <input id="chk7S" class="w3-radio" type="radio" name="chk7" value="S"  >Si &nbsp &nbsp
                     <input id="chk7N"  class="w3-radio" type="radio" name="chk7" value="N"checked="">No</div>
            </div>
            <div class="w3-theme-l5"><p>TRAQUEOSTOMIA</p>
                <div style="padding-left:5%">
                    <input id="chk8S" class="w3-radio" type="radio" name="chk8" value="S"  >Si &nbsp &nbsp
                     <input id="chk8N"  class="w3-radio" type="radio" name="chk8" value="N"checked="">No</div>
            </div>
            <div class="w3-theme-l5"><p>SONDA PLEURAL</p>
                <div style="padding-left:5%">
                    <input id="chk9S" class="w3-radio" type="radio" name="chk9" value="S"  >Si &nbsp &nbsp
                     <input id="chk9N"  class="w3-radio" type="radio" name="chk9" value="N"checked="">No</div>
            </div>
            <div class="w3-theme-l5"><p><b>ANEURISMAS CEREBRAL, ABDOMEN, TORAX</b></p>
                <div style="padding-left:5%">
                    <input id="chk10S" class="w3-radio" type="radio" name="chk10" value="S"  >Si &nbsp &nbsp
                     <input id="chk10N"  class="w3-radio" type="radio" name="chk10" value="N"checked="">No</div>
            </div>
            <div class="w3-theme-l5"><p>EMBOLIA PULMONAR</p>
                <div style="padding-left:5%">
                    <input id="chk11S" class="w3-radio" type="radio" name="chk11" value="S"  >Si &nbsp &nbsp
                     <input id="chk11N"  class="w3-radio" type="radio" name="chk11" value="N"checked="">No</div>
            </div>
            <div class="w3-theme-l5"><p>INFARTO RECIENTE</p>
                <div style="padding-left:5%">
                    <input id="chk12S" class="w3-radio" type="radio" name="chk12" value="S"  >Si &nbsp &nbsp
                     <input id="chk12N"  class="w3-radio" type="radio" name="chk12" value="N"checked="">No</div>
            </div>
            <div class="w3-theme-l5"><p>INESTABILIDAD CV</p>
                <div style="padding-left:5%">
                    <input id="chk13S" class="w3-radio" type="radio" name="chk13" value="S"  >Si &nbsp &nbsp
                     <input id="chk13N"  class="w3-radio" type="radio" name="chk13" value="N"checked="">No</div>
            </div>
            <div class="w3-theme-l5"><p>FIEBRE, NAUSEA, VOMITO</p>
                <div style="padding-left:5%">
                    <input id="chk14S" class="w3-radio" type="radio" name="chk14" value="S"  >Si &nbsp &nbsp
                     <input id="chk14N"  class="w3-radio" type="radio" name="chk14" value="N"checked="">No</div>
            </div>
            <div class="w3-theme-l5"><p>EMBARAZO AVANZADO</p>
                <div style="padding-left:5%">
                    <input id="chk15S" class="w3-radio" type="radio" name="chk15" value="S"  >Si &nbsp &nbsp
                     <input id="chk15N"  class="w3-radio" type="radio" name="chk15" value="N"checked="">No</div>
            </div>
            <div class="w3-theme-l5"><p>EMBARAZO COMPLICADO</p>
                <div style="padding-left:5%">
                    <input id="chk16S" class="w3-radio" type="radio" name="chk16" value="S"  >Si &nbsp &nbsp
                    <input id="chk16N"  class="w3-radio" type="radio" name="chk16" value="N"checked="">No</div>
            </div>
            <div class="w3-theme-l4 "  style ="text-align :right;">
                <asp:Button ID="btnNext1" runat="server" Text="Siguiente" class="w3-button w3-xlarge  w3-theme-action" >
                </asp:Button>
            </div>
            <script>
                $(document).ready(function () {
                $('.datepickNow').datetimepicker({
                    format: 'DD/MM/YYYY HH:mm'
                });
                $('.datepickNace').datetimepicker({
                    format: 'DD/MM/YYYY'
                });
                }); 
            </script>
        </asp:Panel>
        <asp:Panel ID="pnlCtl2" class="w3-card-4" runat="server" Visible="False">
            <div class="w3-theme-l4"><p><b>Preguntas para todos los entrevistados que no tienen los criterios de exclusion y que por lo tanto deben hacer la espirometría</b></p></div>
            <div class="w3-theme-l5"><p>¿Tuvo una infección respiratoria (resfriado), en las últimas 3 semanas?</p>
                <div style="padding-left:5%">
                    <input id="chk_2_1S" class="w3-radio" type="radio" name="chk_2_1" value="S"  >Si &nbsp &nbsp
                    <input id="chk_2_1N"  class="w3-radio" type="radio" name="chk_2_1" value="N"checked="">No
                </div>
            </div>
            <div class="w3-theme-l5"><p>¿Tuvo infección en el oído en las últimas 3 semanas?</p>
                <div style="padding-left:5%">
                    <input id="chk_2_2S" class="w3-radio" type="radio" name="chk_2_2" value="S"  >Si &nbsp &nbsp
                    <input id="chk_2_2N"  class="w3-radio" type="radio" name="chk_2_2" value="N"checked="">No
                </div>
            </div>
            <div class="w3-theme-l5"><p>¿Usó aerosoles (sprays inhalados) o nebulizaciones con broncodilatadores, en las últimas 3 horas?</p>
                <div style="padding-left:5%">
                    <input id="chk_2_3S" class="w3-radio" type="radio" name="chk_2_3" value="S"  >Si &nbsp &nbsp
                    <input id="chk_2_3N"  class="w3-radio" type="radio" name="chk_2_3" value="N"checked="">No
                </div>
            </div>
            <div class="w3-theme-l5"><p>¿Ha usado algún medicamento broncodilatador toma en las últimas 8 horas?</p>
                <div style="padding-left:5%">
                    <input id="chk_2_4S" class="w3-radio" type="radio" name="chk_2_4" value="S"  >Si &nbsp &nbsp
                    <input id="chk_2_4N"  class="w3-radio" type="radio" name="chk_2_4" value="N"checked="">No
                </div>
            </div>
            <div class="w3-theme-l5"><p>¿Fumó (cualquier tipo de cigarro), en las últimas dos horas?</p>
                <div style="padding-left:5%">
                    <input id="chk_2_5S" class="w3-radio" type="radio" name="chk_2_5" value="S"  >Si &nbsp &nbsp
                    <input id="chk_2_5N"  class="w3-radio" type="radio" name="chk_2_5" value="N"checked="">No
                </div>
            </div>
            <div class="w3-theme-l5"><p>¿Realizó algún ejercicio físico fuerte (como gimnasia, caminata o trotar), en la última hora?</p>
                <div style="padding-left:5%">
                    <input id="chk_2_6S" class="w3-radio" type="radio" name="chk_2_6" value="S"  >Si &nbsp &nbsp
                    <input id="chk_2_6N"  class="w3-radio" type="radio" name="chk_2_6" value="N"checked="">No
                </div>
            </div>
            <div class="w3-theme-l5"><p>¿Comió en la última hora?</p>
                <div style="padding-left:5%">
                    <input id="chk_2_7S" class="w3-radio" type="radio" name="chk_2_7" value="S"  >Si &nbsp &nbsp
                    <input id="chk_2_7N"  class="w3-radio" type="radio" name="chk_2_7" value="N"checked="">No
                </div>
            </div>
            <div class="w3-theme-l4"><p><b>Datos físicos del paciente</b></p></div>
            <div class="w3-theme-l5"><p>Altura</p>
                <div style="padding-left:5%">
                    <input id="altura"  class="w3-border" type="number" style="width:20%" name="altura" value="160">&nbsp &nbsp cm
                </div>
            </div>
            <div class="w3-theme-l5"><p>Peso</p>
                <div style="padding-left:5%">
                    <input id="peso"  class="w3-border" type="number" style="width:20%" name="peso" value="60">&nbsp &nbsp Kg
                </div>
            </div>
            <div class="w3-theme-l5"><p>Origen étnico</p>
                <div style="padding-left:5%">
                    <input id="chk_EtniaS" class="w3-radio" type="radio" name="chk_Etnia" value="C"  >Caucásico &nbsp &nbsp
                    <input id="chk_EtniaN"  class="w3-radio" type="radio" name="chk_Etnia" value="N" checked="">No Caucásico
                </div>
            </div>
            <div class="w3-theme-l5"><p>Fumador</p>
                <div style="padding-left:5%">
                    <input id="chk_fumaS" class="w3-radio" type="radio" name="chk_fuma" value="S"  >Si Fuma &nbsp &nbsp
                    <input id="chk_fumaN"  class="w3-radio" type="radio" name="chk_fuma" value="N" checked="">No Fuma
                </div>
            </div>
            <div class="w3-theme-l4"><p><b>Valores Espirometría</b></p></div>
            <div class="w3-theme-l5"><p>FVC</p>
                <div style="padding-left:5%">
                    <input id="FVC"  class="w3-border" type="number" style="width:20%" name="FVC" value="0">&nbsp  ml
                </div>
            </div>
            <div class="w3-theme-l5"><p>FEV1</p>
                <div style="padding-left:5%">
                    <input id="FEV1"  class="w3-border" type="number" style="width:20%" name="FEV1" value="0">&nbsp  ml
                </div>
            </div>
            <div class="w3-theme-l5"><p>PEF</p>
                <div style="padding-left:5%">
                    <input id="PEF"  class="w3-border" type="number" style="width:20%" name="PEF" value="0">&nbsp  ml
                </div>
            </div>
            <div class="w3-theme-l4 "  style ="text-align :right;">
                <asp:Button ID="btnNext2" runat="server" Text="Terminar" class="w3-button w3-xlarge  w3-theme-action" >
                </asp:Button>
            </div>
        </asp:Panel>
    </form>
</body>
</html>
