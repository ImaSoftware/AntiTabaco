Imports System.Data.SqlClient

Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("idusr") = Nothing
        Session("nameusr") = Nothing
        lblMsg.Visible = False

    End Sub

    Protected Sub btnIniciar_Click(sender As Object, e As EventArgs) Handles btnIniciar.Click
        IniciarSesion()
    End Sub
    Sub IniciarSesion()
        Try
            Using conn As New SqlConnection(My.Settings.conn_BD)
                Dim cmdStr As String = "Select * from cedulas where cedula = @ced "
                Dim da As New SqlDataAdapter(cmdStr, conn)
                da.SelectCommand.Parameters.Add(New SqlParameter("@ced", txtCedula.Text))
                conn.Open()
                Dim resquery As New DataTable
                da.Fill(resquery)
                If resquery.Rows.Count > 0 Then
                    Session("idusr") = txtCedula.Text
                    Session("nameusr") = resquery.Rows(0).Item("Nombre")
                    Response.Redirect("espirometria.aspx")
                Else
                    MsgError("Su identificación no se encuentra registrada. Contacte al administrador", Me.lblMsg)
                End If
                conn.Close()
            End Using

        Catch ex As Exception
            MsgError("Error al recuperar informacion del servidor." & ex.Message, Me.lblMsg)
        End Try
    End Sub
End Class