' Created by Justin Acevedo 2014 for batch PPT conversions

Sub BatchSave()
' Opens each PPT in the target folder and saves as PPT97-2003 format

    Dim sFolder As String
    Dim sPresentationName As String
    Dim oPresentation As Presentation

    ' Get the foldername:

    sFolder = InputBox("Folder containing PPT files to process", "Folder")

    If sFolder = "" Then
        Exit Sub
    End If

    ' Make sure the folder name has a trailing backslash
    If Right$(sFolder, 1) <> "\" Then
        sFolder = sFolder & "\"
    End If

    ' Are there PPT files there?
    If Len(Dir$(sFolder & "*.PPT")) = 0 Then
        MsgBox "Bad folder name or no PPT files in folder."
        Exit Sub
    End If

    ' Open and save the presentations
    sPresentationName = Dir$(sFolder & "*.PPT")
    While sPresentationName <> ""
        Set oPresentation = Presentations.Open(sFolder & sPresentationName, , , False)
        Call oPresentation.SaveAs(sFolder & "N_" & sPresentationName, ppSaveAsPresentation)
        oPresentation.Close
        ' New presentation is now saved as N_originalname.ppt
        ' Now let's rename them - comment out the next couple lines
        '   if you don't want to do this
        ' Original.PPT to Original.PPT.OLD
        Name sFolder & sPresentationName As sFolder & sPresentationName & ".OLD"
        ' N_Original.PPT to Original.PPT
        Name sFolder & "N_" & sPresentationName As sFolder & sPresentationName
        sPresentationName = Dir$()
    Wend

    MsgBox "DONE"

End Sub
