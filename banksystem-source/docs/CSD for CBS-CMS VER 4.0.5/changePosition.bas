Attribute VB_Name = "ChangePosition"
Sub ChangePositions(Frm_name As Form, frmWidth As Integer)
'Procedure to Change Controls Position in a Form to English or Arabic
Dim i As Integer
'    Frm_name.Hide
    For i = 0 To Frm_name.Controls.Count - 1
        On Error Resume Next
        If TypeOf Frm_name.Controls(i) Is TextBox Then
            If Frm_name.Controls(i).tag <> "" Then
               Frm_name.Controls(i).Left = Val(Frm_name.Controls(i).tag) - (Frm_name.Controls(i).Left + Frm_name.Controls(i).Width)
            Else
               Frm_name.Controls(i).Left = frmWidth - (Frm_name.Controls(i).Left + Frm_name.Controls(i).Width)
            End If
        ElseIf TypeOf Frm_name.Controls(i) Is Label Then
            If Frm_name.Controls(i).tag <> "" Then
                Frm_name.Controls(i).Left = Val(Frm_name.Controls(i).tag) - (Frm_name.Controls(i).Left + Frm_name.Controls(i).Width)
            Else
                Frm_name.Controls(i).Left = frmWidth - (Frm_name.Controls(i).Left + Frm_name.Controls(i).Width)
            End If
            If Frm_name.Controls(i).Alignment <> 2 Then
                 If UserLang = ARABIC Then
                    Frm_name.Controls(i).Alignment = 1
                 Else
                    Frm_name.Controls(i).Alignment = 0
                 End If
            End If
        ElseIf TypeOf Frm_name.Controls(i) Is Frame Then
            If Frm_name.Controls(i).tag <> "" Then
                Frm_name.Controls(i).Left = Val(Frm_name.Controls(i).tag) - (Frm_name.Controls(i).Left + Frm_name.Controls(i).Width)
            Else
                Frm_name.Controls(i).Left = frmWidth - (Frm_name.Controls(i).Left + Frm_name.Controls(i).Width)
            End If
        ElseIf TypeOf Frm_name.Controls(i) Is CheckBox Then
            If Frm_name.Controls(i).tag <> "" Then
                Frm_name.Controls(i).Left = Val(Frm_name.Controls(i).tag) - (Frm_name.Controls(i).Left + Frm_name.Controls(i).Width)
            Else
                Frm_name.Controls(i).Left = frmWidth - (Frm_name.Controls(i).Left + Frm_name.Controls(i).Width)
            End If
        ElseIf TypeOf Frm_name.Controls(i) Is OptionButton Then
            If Frm_name.Controls(i).tag <> "" Then
                Frm_name.Controls(i).Left = Val(Frm_name.Controls(i).tag) - (Frm_name.Controls(i).Left + Frm_name.Controls(i).Width)
            Else
                Frm_name.Controls(i).Left = frmWidth - (Frm_name.Controls(i).Left + Frm_name.Controls(i).Width)
            End If
        ElseIf TypeOf Frm_name.Controls(i) Is CommandButton Then
            If Frm_name.Controls(i).tag <> "" Then
                Frm_name.Controls(i).Left = Val(Frm_name.Controls(i).tag) - (Frm_name.Controls(i).Left + Frm_name.Controls(i).Width)
            Else
                Frm_name.Controls(i).Left = frmWidth - (Frm_name.Controls(i).Left + Frm_name.Controls(i).Width)
            End If
        ElseIf TypeOf Frm_name.Controls(i) Is ComboBox Then
'            Frm_name.Controls(i).Left = frmWidth - (Frm_name.Controls(i).Left + Frm_name.Controls(i).Width)
            If Frm_name.Controls(i).tag <> "" Then
                Frm_name.Controls(i).Left = Val(Frm_name.Controls(i).tag) - (Frm_name.Controls(i).Left + Frm_name.Controls(i).Width)
            Else
                Frm_name.Controls(i).Left = frmWidth - (Frm_name.Controls(i).Left + Frm_name.Controls(i).Width)
            End If
        ElseIf TypeOf Frm_name.Controls(i) Is Shape Then
            Frm_name.Controls(i).Left = frmWidth - (Frm_name.Controls(i).Left + Frm_name.Controls(i).Width)
        ElseIf TypeOf Frm_name.Controls(i) Is MSFlexGrid Then
           If Frm_name.Controls(i).tag <> "" Then
               Frm_name.Controls(i).Left = Val(Frm_name.Controls(i).tag) - (Frm_name.Controls(i).Left + Frm_name.Controls(i).Width)
           Else
               Frm_name.Controls(i).Left = frmWidth - (Frm_name.Controls(i).Left + Frm_name.Controls(i).Width)
           End If
        ElseIf TypeOf Frm_name.Controls(i) Is ListBox Then
            If Frm_name.Controls(i).tag <> "" Then
                Frm_name.Controls(i).Left = Val(Frm_name.Controls(i).tag) - (Frm_name.Controls(i).Left + Frm_name.Controls(i).Width)
            Else
                Frm_name.Controls(i).Left = frmWidth - (Frm_name.Controls(i).Left + Frm_name.Controls(i).Width)
            End If
'        ElseIf TypeOf Frm_name.Controls(i) Is Image Then
'            If Frm_name.Controls(i).tag <> "" Then
'                Frm_name.Controls(i).Left = Val(Frm_name.Controls(i).tag) - (Frm_name.Controls(i).Left + Frm_name.Controls(i).Width)
'            Else
'                Frm_name.Controls(i).Left = frmWidth - (Frm_name.Controls(i).Left + Frm_name.Controls(i).Width)
'            End If
        End If
    Next i
'    Frm_name.Show
End Sub
