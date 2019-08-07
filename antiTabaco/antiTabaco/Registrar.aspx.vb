Imports System.Data.SqlClient

Public Class Registrar
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.lblMsg.Visible = False
    End Sub

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        Response.Redirect("Login.aspx")
    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click
        Dim no_cedula As String = txtCedula.Text
        Dim nombres As String = txtNombres.Text
        Dim celu As String = txtCelu.Text
        Dim email As String = txtemail.Text
        Dim idRegistro As Integer = 0
        'Validaciones
        'No vacio
        If String.IsNullOrEmpty(no_cedula.Trim()) Then
            MsgError("Debe Ingresar el número de cédula", lblMsg)
            Exit Sub
        End If
        If String.IsNullOrEmpty(nombres.Trim()) Then
            MsgError("Debe Ingresar sus nombres", lblMsg)
            Exit Sub
        End If
        If String.IsNullOrEmpty(celu.Trim()) Then
            MsgError("Debe ingresar un numero de celular", lblMsg)
            Exit Sub
        End If
        If String.IsNullOrEmpty(email.Trim()) Then
            MsgError("Debe Ingresar el email", lblMsg)
            Exit Sub
        End If
        'Cedula no numérica 
        If Not IsNumeric(no_cedula.Trim) Then
            MsgError("Solo se permiten valores numéricos para la cedula", lblMsg)
            Exit Sub
        End If
        'Prepara query
        Try
            Dim cmdStr As String = "Insert into cedulas (cedula,nombres, nocontacto, email) output INSERTED.id_Usr VALUES(@ced, @nom, @celu, @mail);"
            Dim conn As New SqlConnection(My.Settings.conn_BD)
            Dim comm As New SqlCommand(cmdStr, conn)
            comm.Parameters.Add(New SqlParameter("@ced", no_cedula))
            comm.Parameters.Add(New SqlParameter("@nom", nombres))
            comm.Parameters.Add(New SqlParameter("@celu", celu))
            comm.Parameters.Add(New SqlParameter("@mail", email))
            conn.Open()
            idRegistro = DirectCast(comm.ExecuteScalar, Integer)
            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If
            Dim tr_mail As String = "holgerveloz@gmail.com"
            Dim eSend As mailSender = New mailSender(My.Settings.mail_Usr,
                My.Settings.mail_Pwd, My.Settings.smtpServer, My.Settings.Puerto, My.Settings.SSL)
            Dim mailbody As String = String.Format("Nuevo registro id = {0}. Cedula: {1}. Nombres: {2}. Celular: {3}. Email: {4}", idRegistro.ToString, no_cedula, nombres, celu, email)
            eSend.EnviarMensaje(tr_mail, mailbody, "Registro de nuevo usuario")
            MsgError("Nuevo usuario ha sido ingresado. Haga clic en Iniciar Sesion", lblMsg)
        Catch ex As Exception
            If ex.Message.Contains("duplicate") Then
                MsgError("Numero de cédula ya ha sido registrado", lblMsg)
            Else
                MsgError("Error al insertar nuevo usuario: " & ex.Message, lblMsg)
            End If
            Dim eSend As mailSender = New mailSender(My.Settings.mail_Usr,
                My.Settings.mail_Pwd, My.Settings.smtpServer, My.Settings.Puerto, My.Settings.SSL)
            eSend.EnviarMensaje("holgerveloz@gmail.com", "Eror: " & ex.Message, "Intento fallido")
            Exit Sub
        End Try


    End Sub
End Class