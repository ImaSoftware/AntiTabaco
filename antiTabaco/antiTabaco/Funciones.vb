Imports System
Imports System.Text.RegularExpressions
Imports System.Collections.Generic
Imports System.Net.Security
Imports System.Security.Cryptography.X509Certificates
Imports System.Net
Imports System.Linq
Imports System.Text
Imports System.Threading.Tasks

Module Funciones
    Sub MsgError(ByVal msg As String, ByRef lblMsg As WebControls.Label)
        lblMsg.Visible = True
        lblMsg.Text = msg
    End Sub
    Public Class mailSender
        Public ClaveMail As String
        Public DireccionMail As String
        Public EnableSSl As Boolean
        Public Puerto As Integer
        Private _SMTPServer As String
        Public ReadOnly Property SMTPServer As String
            Get
                Return _SMTPServer
            End Get
        End Property
        Public Sub New(ByVal Mail As String, ByVal clave As String, ByVal ServidorSMTP As String, ByVal puertoDefecto As Integer, ByVal SSL As Boolean)
            DireccionMail = Mail
            ClaveMail = clave
            _SMTPServer = ServidorSMTP
            EnableSSl = SSL
            Puerto = puertoDefecto
        End Sub
        Public Function EnviarMensaje(ByVal Destinatario As String, ByVal mensaje As String, ByVal Asunto As String, Optional ByVal adjunto As System.Net.Mail.Attachment = Nothing) As Boolean
            Dim res As New List(Of String)
            res.Add(Destinatario)
            Dim adj As New List(Of System.Net.Mail.Attachment)
            If Not IsNothing(adjunto) Then
                adj.Add(adjunto)
            End If
            Return EnviarMensaje(res, mensaje, Asunto, adj)
        End Function
        Public Shared Function IsValidEmail(ByVal email As String) As Boolean
            If Not String.IsNullOrEmpty(email) Then
                'Compruebo si el formato de la dirección es correcto.
                Dim re As Regex = New Regex("^(?("")("".+?(?<!\\)""@)|(([0-9a-z]((\.(?!\.))|[-!#\$%&'\*\+/=\?\^`\{\}\|~\w])*)(?<=[0-9a-z])@))" &
                "(?(\[)(\[(\d{1,3}\.){3}\d{1,3}\])|(([0-9a-z][-\w]*[0-9a-z]*\.)+[a-z0-9][\-a-z0-9]{0,22}[a-z0-9]))$")
                Dim m As Match = re.Match(email)
                Return m.Captures.Count <> 0
            Else
                Return False
            End If
        End Function
        Public Function EnviarMensaje(ByVal ListaDestinatarios As List(Of String), ByVal mensaje As String, ByVal Asunto As String, Optional ByVal adjuntos As List(Of System.Net.Mail.Attachment) = Nothing) As Boolean
            Dim miCorreo As New System.Net.Mail.MailMessage()
            miCorreo.IsBodyHtml = True
            miCorreo.From = New System.Net.Mail.MailAddress(DireccionMail) 'mail desde donde se envía
            For Each mail As String In ListaDestinatarios
                miCorreo.To.Add(mail) 'mail del destinatario
            Next
            miCorreo.Subject = Asunto 'Asunto
            miCorreo.Body = mensaje
            miCorreo.IsBodyHtml = True
            miCorreo.Priority = System.Net.Mail.MailPriority.Normal 'Prioridad
            If Not IsNothing(adjuntos) Then
                For Each adj As System.Net.Mail.Attachment In adjuntos
                    miCorreo.Attachments.Add(adj)
                Next
            End If
            'no modificar las siguientes lineas ya qye corresponden a la coniguracion del server smtp de microsoft (windows live)
            Dim smtp As New System.Net.Mail.SmtpClient()
            smtp.Host = SMTPServer
            smtp.Port = Puerto '465
            smtp.EnableSsl = EnableSSl
            'estas lineas pueden o no ser necesarias pero las puse por una validacion que no avanzaba
            System.Net.ServicePointManager.ServerCertificateValidationCallback =
              Function(a As Object,
              cert As System.Security.Cryptography.X509Certificates.X509Certificate,
              chain As System.Security.Cryptography.X509Certificates.X509Chain,
              sslPolicyErrors As System.Net.Security.SslPolicyErrors) True
            ' para las credenciales debo pasarle la cuenta y la clave desde donde se envía
            smtp.Credentials = New System.Net.NetworkCredential(DireccionMail, ClaveMail)
            Try
                smtp.Send(miCorreo)
                Return True
            Catch ex As Exception
                Return False
            End Try
        End Function
    End Class
End Module
