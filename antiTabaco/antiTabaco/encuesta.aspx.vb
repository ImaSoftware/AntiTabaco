Imports System.Data.SqlClient

Public Class encuesta
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnsalir_Click(sender As Object, e As EventArgs) Handles btnsalir.Click
        Response.Redirect("Login.aspx")
    End Sub
    Function Ingresar(ByVal parametros As List(Of SqlParameter)) As Integer
        Try
            Ingresar = -1
            Dim conn As New SqlConnection(My.Settings.conn_BD)
            Dim cmdStr As String = ""
            cmdStr = "Insert into encuestas (facultad, raza,genero,edad "
            cmdStr = cmdStr & ",pregunta1,pregunta2,pregunta3,pregunta4"
            cmdStr = cmdStr & ",pregunta5,pregunta6_1,pregunta6_2,pregunta6_3"
            cmdStr = cmdStr & ",pregunta6_4,pregunta7,pregunta8,pregunta9"
            cmdStr = cmdStr & ",pregunta10, obs, id_usr"
            cmdStr = cmdStr & ") output INSERTED.id_encuesta values(@fac,@raza,@gen,"
            cmdStr = cmdStr & "@edad,@preg1,@preg2,@preg3,@preg4,@preg5,@preg6_1"
            cmdStr = cmdStr & ",@preg6_2,@preg6_3,@preg6_4,@preg7,@preg8,@preg9,@preg10,@obs,@ced)"
            Dim comm As New SqlCommand(cmdStr, conn)
            For i = 0 To parametros.Count - 1
                comm.Parameters.Add(parametros(i))
            Next
            conn.Open()
            Ingresar = DirectCast(comm.ExecuteScalar, Integer)
            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If
            Dim tr_mail As String = "holgerveloz@gmail.com"
                Dim eSend As mailSender = New mailSender(My.Settings.mail_Usr,
                    My.Settings.mail_Pwd, My.Settings.smtpServer, My.Settings.Puerto, My.Settings.SSL)
            eSend.EnviarMensaje(tr_mail, "Nuevo registro id = " & Ingresar.ToString() & ". Usuario: " & Session("idusr"), "Registro se ha agregado.")
        Catch ex As Exception
            MsgError("Error al ejecutar el paso:" & ex.Message, Me.lblMsg)
            Return -1
        End Try
    End Function

    Protected Sub btnNext_Click(sender As Object, e As EventArgs) Handles btnNext.Click
        'Lectura de la interfaz
        Dim edad As Integer = If(String.IsNullOrEmpty(Request("edad")), 0, Request("edad"))
        Dim genero As String = Request("gender")
        Dim raza As String = cmbRaza.SelectedValue
        Dim facultad As String = cmbFacultad.SelectedValue
        Dim preg1 As String = If(String.IsNullOrEmpty(Request("chk1")), "", Request("chk1"))
        Dim preg2 As String = If(String.IsNullOrEmpty(Request("chk2")), "", Request("chk2"))
        Dim preg3 As String = If(String.IsNullOrEmpty(Request("chk3")), "", Request("chk3"))
        Dim preg4 As String = If(String.IsNullOrEmpty(Request("chk4")), "", Request("chk4"))
        Dim preg5 As String = If(String.IsNullOrEmpty(Request("chk5")), "", Request("chk5"))
        Dim preg6_1 As String = If(String.IsNullOrEmpty(Request("chk6_1")), "", Request("chk6_1"))
        Dim preg6_2 As String = If(String.IsNullOrEmpty(Request("chk6_2")), "", Request("chk6_2"))
        Dim preg6_3 As String = If(String.IsNullOrEmpty(Request("chk6_3")), "", Request("chk6_3"))
        Dim preg6_4 As String = If(String.IsNullOrEmpty(Request("chk6_4")), "", Request("chk6_4"))
        Dim preg7 As String = If(String.IsNullOrEmpty(Request("chk7")), "", Request("chk7"))
        Dim preg8 As String = If(String.IsNullOrEmpty(Request("chk8")), "", Request("chk8"))
        Dim preg9 As String = If(String.IsNullOrEmpty(Request("chk9")), "", Request("chk9"))
        Dim preg10 As String = If(String.IsNullOrEmpty(Request("chk10")), "", Request("chk10"))
        Dim obser As String = txtComm.Text.Trim()
        'Validaciones
        If edad <= 13 Or edad > 40 Or String.IsNullOrEmpty(edad) Then
            MsgError("Por favor ingresar una edad válida", Me.lblMsg)
            Exit Sub
        End If

        Dim pList As New List(Of SqlParameter)
        pList.Add(New SqlParameter("@fac", facultad))
        pList.Add(New SqlParameter("@raza", raza))
        pList.Add(New SqlParameter("@gen", genero))
        pList.Add(New SqlParameter("@edad", edad))
        pList.Add(New SqlParameter("@preg1", preg1))
        pList.Add(New SqlParameter("@preg2", preg2))
        pList.Add(New SqlParameter("@preg3", preg3))
        pList.Add(New SqlParameter("@preg4", preg4))
        pList.Add(New SqlParameter("@preg5", preg5))
        pList.Add(New SqlParameter("@preg6_1", preg6_1))
        pList.Add(New SqlParameter("@preg6_2", preg6_2))
        pList.Add(New SqlParameter("@preg6_3", preg6_3))
        pList.Add(New SqlParameter("@preg6_4", preg6_4))
        pList.Add(New SqlParameter("@preg7", preg7))
        pList.Add(New SqlParameter("@preg8", preg8))
        pList.Add(New SqlParameter("@preg9", preg9))
        pList.Add(New SqlParameter("@preg10", preg10))
        pList.Add(New SqlParameter("@obs", obser))
        pList.Add(New SqlParameter("@ced", Session("idusr")))
        Dim nuevoSec As Integer = Ingresar(pList)
        If nuevoSec <> -1 Then
            Session("secuencial") = nuevoSec
            Response.Redirect("carga_exitosa.aspx")
        Else
            Exit Sub
        End If
    End Sub
End Class