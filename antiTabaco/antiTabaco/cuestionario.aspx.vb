Imports System.Data.SqlClient

Public Class cuestionario
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnGenerar_Click(sender As Object, e As EventArgs) Handles btnGenerar.Click
        txtCalif.Text = ""
        pnlInicio.Visible = False
        pnlCuestionario.Visible = True
        pnlCalif.Visible = True
        pnlRes.Visible = True
        pnlRes.Style("display") = "block"
        Dim inList As String = ""
        Dim intNumbers As New List(Of Integer)
        Dim maxPreg As Integer = 583
        'extraer preguntas 
        Try
            Using conn As New SqlConnection(My.Settings.conn_BD)
                Dim cmdMax As String = String.Format("select max(id_pregunta) from preguntas_quest")
                Dim da As New SqlDataAdapter(cmdMax, conn)
                conn.Open()
                Dim resMax As New DataTable
                da.Fill(resMax)
                If resMax.Rows.Count = 1 Then
                    maxPreg = resMax.Rows(0)(0)
                End If
                Dim rand As New Random()
                If chkRandom.Checked Then
                    'Aleatorio
                    Dim salir As Boolean = False
                    Do
                        Dim numero As Integer
                        numero = rand.Next(CInt(iniPreg.Text), maxPreg)
                        Dim existe As Boolean = False
                        For Each nmr As Integer In intNumbers
                            If numero = nmr Then
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

                Dim cmdPreg As String = String.Format("select * from preguntas_quest where id_pregunta in({0})", inList)
                da = New SqlDataAdapter(cmdPreg, conn)
                Dim resPreg As New DataTable
                da.Fill(resPreg)
                If resPreg.Rows.Count > 0 Then
                    pnlCuestionario.Controls.Add(New LiteralControl("<br/>"))
                    'Recorrer preguntas y dibujar el cuestionario
                    For Each preg As DataRow In resPreg.Rows
                        'dibujar la pregunta 
                        Dim ltPreg As New LiteralControl
                        Dim ct As String = String.Format("<div name = ""preg_{1}"" class=""w3-theme-l5""><p>{0}</p>" & If(chkResp.Checked,
                                          "<div ID=""btnresp_{1}_{2}"" class=""w3-button"" onclick=""ShowResp(this.id,""N""); return false;""/>Mostrar Respuesta</div>", ""),
                                                         preg(1), preg(0), preg(2))
                        'extraer las respuestas 
                        Dim cmdRes As String = String.Format("select *, ltrim(rtrim(case when charindex(')',texto)>0 then substring(texto, charindex(')',texto) +1,len(texto)-charindex(')',texto) +1)" _
                            & " when charindex('.',texto)>0 then substring(texto, charindex('.',texto) +1,len(texto)-charindex('.',texto) +1) " _
                            & " else texto end ))texto2 from respuestas_quest where id_pregunta = {0}", preg(0))
                        da = New SqlDataAdapter(cmdRes, conn)
                        Dim resResp As New DataTable
                        da.Fill(resResp)
                        'tomar en cuenta si se pidio que sea desordenada
                        Dim listaCiclo As New List(Of Integer)
                        For i = 0 To resResp.Rows.Count - 1
                            listaCiclo.Add(i)
                        Next
                        If chkDesord.Checked Then
                            Dim r As Random = New Random()
                            For i = 0 To listaCiclo.Count - 1
                                Dim index As Integer = r.Next(i, listaCiclo.Count)
                                If i <> index Then
                                    ' swap list(i) and list(index)
                                    Dim temp As Integer = listaCiclo(i)
                                    listaCiclo(i) = listaCiclo(index)
                                    listaCiclo(index) = temp
                                End If
                            Next
                        End If
                        For i = 0 To listaCiclo.Count - 1
                            Dim resp As DataRow = resResp(listaCiclo(i))
                            'Dibujar las respuestas
                            If preg(2) = "M" Then
                                Dim textoModif As String = ""
                                If chkDesord.Checked And preg(3) <> "N" Then
                                    textoModif = resp(5)
                                Else
                                    textoModif = resp(2)
                                End If
                                'Opcion Multiple
                                ct = ct & String.Format("<div style=""padding-left: 5%"">" _
                        & "<input id=""resp_{0}_{1}"" class=""w3-radio"" type=""radio"" name=""resp_{0}"" value=""{4}""  escorrecta=""{3}"" >{2}</div>",
                                        resp(1), listaCiclo(i).ToString(), textoModif, resp(3), resp(0))
                                Else
                                    'Pregunta de escribir   
                                End If
                        Next
                        ct = ct & "<br/></div>"
                        ltPreg.Text = ct
                        pnlCuestionario.Controls.Add(ltPreg)
                    Next
                    pnlCuestionario.Controls.Add(New LiteralControl("<br/>"))
                Else
                    MsgError("Oops. Hubo un error al generar las preguntas", Me.lblMsg)
                End If
                conn.Close()
            End Using
        Catch ex As Exception
            MsgError("Error al recuperar informacion del servidor." & ex.Message, Me.lblMsg)
        End Try
    End Sub

    Protected Sub btnRet_Click(sender As Object, e As EventArgs) Handles btnRet.Click, btnRet2.Click
        Response.Redirect("cuestionario.aspx")
    End Sub
End Class