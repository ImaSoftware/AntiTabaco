Imports System.Data.SqlClient

Public Class cuestionario
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnGenerar_Click(sender As Object, e As EventArgs) Handles btnGenerar.Click
        pnlInicio.Visible = False
        pnlCuestionario.Visible = True
        Dim inList As String = ""
        Dim intNumbers As New List(Of Integer)
        'extraer preguntas 
        Dim rand As New Random()
        If chkRandom.Checked Then
            'Aleatorio
            Dim salir As Boolean = False
            Do
                Dim numero As Integer
                numero = rand.Next(CInt(iniPreg.Text), 583)
                Dim existe As Boolean = False
                For Each nmr As Integer In intNumbers
                    If numero = existe Then
                        existe = True
                        Exit For
                    End If
                Next
                If Not existe Then
                    intNumbers.Add(numero)
                End If
                If intNumbers.Count = CInt(noPreg.Text) Then
                    salir = True
                End If
            Loop Until salir
            For i As Integer = 0 To intNumbers.Count - 1
                inList = inList & If(i = 0, "", ",") & intNumbers(i)
            Next

        Else
            For i As Integer = 0 To CInt(noPreg.Text) - 1
                inList = inList & If(i = 0, "", ",") & CStr(CInt(iniPreg.Text) + i)
            Next
        End If
        Try
            Using conn As New SqlConnection(My.Settings.conn_BD)
                Dim cmdPreg As String = String.Format("select * from preguntas_quest where id_pregunta in({0})", inList)
                Dim da As New SqlDataAdapter(cmdPreg, conn)
                conn.Open()
                Dim resPreg As New DataTable
                da.Fill(resPreg)
                If resPreg.Rows.Count > 0 Then
                    'Recorrer preguntas y dibujar el cuestionario
                    For Each preg As DataRow In resPreg.Rows
                        'dibujar la pregunta 
                        Dim ltPreg As New LiteralControl
                        Dim ct As String = String.Format("<div class=""w3-theme-l5""><p>{0}</p><div ID=""btnresp_{1}_{2}"" class=""w3-btnh"" onclick=""return false;""></div>", preg(1), preg(0), preg(2))
                        'extraer las respuestas 
                        Dim cmdRes As String = String.Format("select * from respuestas_quest where id_pregunta = {0}", preg(0))
                        da = New SqlDataAdapter(cmdRes, conn)
                        Dim resResp As New DataTable
                        da.Fill(resResp)
                        For i = 0 To resResp.Rows.Count - 1
                            Dim resp As DataRow = resResp(i)
                            'Dibujar las respuestas
                            If preg(2) = "M" Then
                                'Opcion Multiple
                                ct = ct & String.Format("<div style=""padding-left: 5%"">" _
                        & "<input id=""resp_{0}_{1}"" class=""w3-radio"" type=""radio"" name=""resp_{0}"" value=""0"" escorrecta=""{3}"" >{2}</div>",
                                        resp(1), i.ToString(), resp(2), resp(3))
                            Else
                                'Pregunta de escribir   
                            End If
                        Next
                        ct = ct & "</div>"
                        ltPreg.Text = ct
                        pnlCuestionario.Controls.Add(ltPreg)
                    Next


                Else
                    MsgError("Oops. Hubo un error al generar las preguntas", Me.lblMsg)
                End If
                conn.Close()
            End Using
        Catch ex As Exception
            MsgError("Error al recuperar informacion del servidor." & ex.Message, Me.lblMsg)
        End Try
    End Sub


End Class