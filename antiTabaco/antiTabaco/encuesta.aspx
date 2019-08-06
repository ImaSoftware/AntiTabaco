<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="encuesta.aspx.vb" Inherits="antiTabaco.encuesta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Ingrese la encuesta</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <label class="w3-text-teal"><b>Facultad</b></label>
        <input id="txtfacultad" class="w3-input w3-border w3-light-grey" type="text">
         <label class="w3-text-teal"><b>Raza</b></label>
        <select id="cmbraza" class="w3-select" name="option">
          <option value="" selected>Mestizo</option>
          <option value="1">Caucásico</option>
          <option value="2">Indígena</option>
          <option value="3">Otros</option>
        </select>
        <label class="w3-text-teal"><b>Genero</b></label>
        <input class="w3-radio" type="radio" name="genero" value="M" checked>
        <label>M</label>
        <input class="w3-radio" type="radio" name="genero" value="F">
        <label >F</label><br>
        <label class="w3-text-teal"><b>¿Usted ha fumado alguna vez? </b></label>
        <input id="chkFuma" class="w3-check" type="checkbox" checked="checked">
    </form>
</body>
</html>
