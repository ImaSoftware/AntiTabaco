Public Class contacto
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblMsg.Visible = False
    End Sub

    Protected Sub btnSend_Click(sender As Object, e As EventArgs) Handles btnSend.Click
        If String.IsNullOrEmpty(txtmsg.Text.Trim) Then
            MsgError("Mensaje vacío", lblMsg)
            Exit Sub
        End If
        Try
            Dim eSend As mailSender = New mailSender(My.Settings.mail_Usr,
               My.Settings.mail_Pwd, My.Settings.smtpServer, My.Settings.Puerto, My.Settings.SSL)
            eSend.EnviarMensaje("holgerveloz@gmail.com", txtmsg.Text, "Mensaje Ayuda " & txtNombres.Text)
            MsgError("Mensaje ha sido enviado. Gracias!!!", lblMsg)
        Catch ex As Exception
            MsgError("Error: " & ex.Message, lblMsg)
            Exit Sub
        End Try

    End Sub

    Protected Sub btnret_Click(sender As Object, e As EventArgs) Handles btnret.Click
        Response.Redirect("Login.aspx")
    End Sub
End Class