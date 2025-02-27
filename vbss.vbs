' Create a new instance of the WScript Shell object
Set objShell = CreateObject("WScript.Shell")

' Create a new instance of the HTMLFile object to access the clipboard
Set objHTML = CreateObject("htmlfile")
clipboardText = objHTML.ParentWindow.ClipboardData.GetData("text")

' Check if clipboardText is empty
If IsNull(clipboardText) Or clipboardText = "" Then
    MsgBox "Clipboard is empty. Exiting script.", vbExclamation, "Error"
    WScript.Quit
End If

' Open Notepad
objShell.Run "notepad.exe"
WScript.Sleep 1000 ' Give Notepad enough time to open

' Paste the clipboard text into Notepad
objShell.SendKeys "^v"
WScript.Sleep 500

' Save the file as "rattybatty.txt"
objShell.SendKeys "^s" ' Ctrl+S to save
WScript.Sleep 500
objShell.SendKeys "rattybatty.txt"
WScript.Sleep 500
objShell.SendKeys "{ENTER}" ' Press Enter to confirm save
WScript.Sleep 1000

' Close Notepad
objShell.SendKeys "%{F4}" ' Alt+F4 to close Notepad
WScript.Sleep 500

' Release the objects
Set objShell = Nothing
Set objHTML = Nothing
