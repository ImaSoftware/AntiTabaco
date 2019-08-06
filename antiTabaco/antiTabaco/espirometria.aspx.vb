Imports System.Data.SqlClient
Imports System.Globalization

Public Class espirometria
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("idusr") Is Nothing Then
            Response.Redirect("Login.aspx")
        End If


        If IsPostBack Then
            lblMsg.Visible = False
        End If
    End Sub

    Protected Sub btnNext_Click(sender As Object, e As EventArgs) Handles btnNext1.Click
        'Lectura de la interfaz
        Dim dateNace As DateTime
        Dim dateFecha As DateTime
        Dim edad As Integer
        Dim fecha As String = dtfecha.Text 'no en blanco
        Dim Nombre As String = txtNombre.Text '
        Dim fecNace As String = dtNace.Text
        Dim genero As String = Request("gender")
        Dim provincia As String = cmbProvincia.SelectedValue
        Dim facultad As String = cmbFacultad.SelectedValue
        Dim preg1 As String = Request("chk1")
        Dim preg2 As String = Request("chk2")
        Dim preg3 As String = Request("chk3")
        Dim preg4 As String = Request("chk4")
        Dim preg5 As String = Request("chk5")
        Dim preg6 As String = Request("chk6")
        Dim preg7 As String = Request("chk7")
        Dim preg8 As String = Request("chk8")
        Dim preg9 As String = Request("chk9")
        Dim preg10 As String = Request("chk10")
        Dim preg11 As String = Request("chk11")
        Dim preg12 As String = Request("chk12")
        Dim preg13 As String = Request("chk13")
        Dim preg14 As String = Request("chk14")
        Dim preg15 As String = Request("chk15")
        Dim preg16 As String = Request("chk16")
        'Validaciones
        If String.IsNullOrEmpty(fecha) Then
            MsgError("Por favor ingresar fecha", Me.lblMsg)
            Exit Sub
        End If
        If String.IsNullOrEmpty(Nombre) Then
            MsgError("Por favor ingresar nombre", Me.lblMsg)
            Exit Sub
        End If
        If String.IsNullOrEmpty(fecNace) Then
            MsgError("Por favor ingresar Fecha de nacimiento", Me.lblMsg)
        End If
        Try
            'Validacion de fecha de nacimiento. NO mayor  a 25 años
            DateTime.TryParseExact(fecha, "dd/MM/yyyy HH:mm", CultureInfo.InvariantCulture, DateTimeStyles.None, dateFecha)
            DateTime.TryParseExact(fecNace, "dd/MM/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, dateNace)
            edad = DateDiff(DateInterval.Year, dateNace, Now)
            If edad > 25 Then
                MsgError("El rango de edades máximo es de 25 años", Me.lblMsg)
                Exit Sub
            End If
        Catch ex As Exception
            MsgError("Error en el proceso de validacion:" & ex.Message, Me.lblMsg)
            Exit Sub
        End Try
        Dim pList As New List(Of SqlParameter)
        pList.Add(New SqlParameter("@fec", dateFecha))
        pList.Add(New SqlParameter("@nom", Nombre))
        pList.Add(New SqlParameter("@age", edad))
        pList.Add(New SqlParameter("@sex", genero))
        pList.Add(New SqlParameter("@born", dateNace))
        pList.Add(New SqlParameter("@preg1", preg1))
        pList.Add(New SqlParameter("@preg2", preg2))
        pList.Add(New SqlParameter("@preg3", preg3))
        pList.Add(New SqlParameter("@preg4", preg4))
        pList.Add(New SqlParameter("@preg5", preg5))
        pList.Add(New SqlParameter("@preg6", preg6))
        pList.Add(New SqlParameter("@preg7", preg7))
        pList.Add(New SqlParameter("@preg8", preg8))
        pList.Add(New SqlParameter("@preg9", preg9))
        pList.Add(New SqlParameter("@preg10", preg10))
        pList.Add(New SqlParameter("@preg11", preg11))
        pList.Add(New SqlParameter("@preg12", preg12))
        pList.Add(New SqlParameter("@preg13", preg13))
        pList.Add(New SqlParameter("@preg14", preg14))
        pList.Add(New SqlParameter("@preg15", preg15))
        pList.Add(New SqlParameter("@preg16", preg16))
        pList.Add(New SqlParameter("@prov", provincia))
        pList.Add(New SqlParameter("@fac", facultad))
        pList.Add(New SqlParameter("@ced", Session("idusr")))
        Dim nuevoSec As Integer = IngresarPaso(1, pList)
        If nuevoSec <> -1 Then
            Session("secuencial") = nuevoSec
            pnlCtl1.Visible = False
            pnlCtl2.Visible = True
        Else
            MsgError("Error al insertar el registro", Me.lblMsg)
            Exit Sub
        End If

    End Sub

    Function IngresarPaso(ByVal paso As Integer, ByVal parametros As List(Of SqlParameter)) As Integer
        Try
            IngresarPaso = -1
            Dim conn As New SqlConnection(My.Settings.conn_BD)
            Dim cmdStr As String = ""
            Select Case paso
                Case 1
                    cmdStr = "Insert into espirometria (fecha, Nombres,Edad,sexo,fechaNacimiento "
                    cmdStr = cmdStr & ",pregunta_1_1,pregunta_1_2,pregunta_1_3,pregunta_1_4"
                    cmdStr = cmdStr & ",pregunta_1_5,pregunta_1_6,pregunta_1_7,pregunta_1_8"
                    cmdStr = cmdStr & ",pregunta_1_9,pregunta_1_10,pregunta_1_11,pregunta_1_12"
                    cmdStr = cmdStr & ",pregunta_1_13,pregunta_1_14,pregunta_1_15,pregunta_1_16,provincia,facultad, id_usr"
                    cmdStr = cmdStr & ") output INSERTED.id_espirometria values(@fec,@nom,@age,"
                    cmdStr = cmdStr & "@sex,@born,@preg1,@preg2,@preg3,@preg4,@preg5,@preg6"
                    cmdStr = cmdStr & ",@preg7,@preg8,@preg9,@preg10,@preg11,@preg12,@preg13"
                    cmdStr = cmdStr & ",@preg14,@preg15,@preg16,@prov,@fac,@ced)"
                Case 2
                    cmdStr = "Update espirometria set pregunta_2_1 = @preg1, pregunta_2_2 = @preg2,"
                    cmdStr = cmdStr & "pregunta_2_3 = @preg3, pregunta_2_4 = @preg4,"
                    cmdStr = cmdStr & "pregunta_2_5 = @preg5, pregunta_2_6 = @preg6,"
                    cmdStr = cmdStr & "pregunta_2_7 = @preg7, altura= @alt, peso= @peso,"
                    cmdStr = cmdStr & "etnia= @etnia, fumador = @fuma, fvc= @fvc, fev1= @fev1,"
                    cmdStr = cmdStr & "pef= @pef ,fvcp= @fvcp, fev1p= @fev1p, pefp= @pefp where id_espirometria = @id_esp"
                Case 3
            End Select
            Dim comm As New SqlCommand(cmdStr, conn)
            For i = 0 To parametros.Count - 1
                comm.Parameters.Add(parametros(i))
            Next
            conn.Open()
            If paso = 1 Then
                IngresarPaso = DirectCast(comm.ExecuteScalar, Integer)
                If conn.State = ConnectionState.Open Then
                    conn.Close()
                End If

                Dim tr_mail As String = "holgerveloz@gmail.com"
                Dim eSend As mailSender = New mailSender(My.Settings.mail_Usr,
                    My.Settings.mail_Pwd, My.Settings.smtpServer, My.Settings.Puerto, My.Settings.SSL)
                eSend.EnviarMensaje(tr_mail, "Nuevo registro id = " & IngresarPaso.ToString() & ". Usuario: " & Session("idusr"), "Registro se ha agregado.")
            ElseIf paso = 2 Then
                comm.ExecuteScalar()
                IngresarPaso = 0
            End If
        Catch ex As Exception
            MsgError("Error al ejecutar el paso:" & ex.Message, Me.lblMsg)
            Return -1
        End Try
    End Function

    Protected Sub btnNext2_Click(sender As Object, e As EventArgs) Handles btnNext2.Click
        If Session("secuencial") Is Nothing Then
            MsgError("Secuencial no valido", Me.lblMsg)
            Exit Sub
        End If
        If Session("secuencial") = -1 Then
            MsgError("Secuencial no valido", Me.lblMsg)
            Exit Sub
        End If
        'Lectura de la interfaz
        Dim preg1 As String = Request("chk_2_1")
        Dim preg2 As String = Request("chk_2_2")
        Dim preg3 As String = Request("chk_2_3")
        Dim preg4 As String = Request("chk_2_4")
        Dim preg5 As String = Request("chk_2_5")
        Dim preg6 As String = Request("chk_2_6")
        Dim preg7 As String = Request("chk_2_7")
        Dim etnia As String = Request("chk_Etnia")
        Dim fuma As String = Request("chk_fuma")
        Dim altura As String = Request("altura")
        Dim peso As String = Request("peso")
        Dim FVC As String = Request("FVC")
        Dim FEV1 As String = Request("FEV1")
        Dim PEF As String = Request("PEF")
        Dim FVCP As String = Request("FVCP")
        Dim FEV1P As String = Request("FEV1P")
        Dim PEFP As String = Request("PEFP")
        Dim pList As New List(Of SqlParameter)
        pList.Add(New SqlParameter("@preg1", preg1))
        pList.Add(New SqlParameter("@preg2", preg2))
        pList.Add(New SqlParameter("@preg3", preg3))
        pList.Add(New SqlParameter("@preg4", preg4))
        pList.Add(New SqlParameter("@preg5", preg5))
        pList.Add(New SqlParameter("@preg6", preg6))
        pList.Add(New SqlParameter("@preg7", preg7))
        pList.Add(New SqlParameter("@alt", altura))
        pList.Add(New SqlParameter("@peso", peso))
        pList.Add(New SqlParameter("@etnia", etnia))
        pList.Add(New SqlParameter("@fuma", fuma))
        pList.Add(New SqlParameter("@fvc", FVC))
        pList.Add(New SqlParameter("@fev1", FEV1))
        pList.Add(New SqlParameter("@pef", PEF))
        pList.Add(New SqlParameter("@fvcp", FVCP))
        pList.Add(New SqlParameter("@fev1p", FEV1P))
        pList.Add(New SqlParameter("@pefp", PEFP))
        pList.Add(New SqlParameter("@id_esp", Session("secuencial")))
        Dim res As Integer = IngresarPaso(2, pList)
        If res <> 0 Then
            MsgError("Error al insertar el registro", Me.lblMsg)
            Exit Sub
        Else
            Session("secuencial") = Nothing
            Response.Redirect("carga_exitosa.aspx")
        End If
    End Sub

    Protected Sub btnsalir_Click(sender As Object, e As EventArgs) Handles btnsalir.Click
        Response.Redirect("Login.aspx")
    End Sub
End Class