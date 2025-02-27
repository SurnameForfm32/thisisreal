' Create a new instance of the WScript Shell object
Set objShell = CreateObject("WScript.Shell")

' Create a new instance of the HTMLFile object to access the clipboard
Set objHTML = CreateObject("htmlfile")
Set clipboardText = objHTML.ParentWindow.ClipboardData.GetData("text")

' Open Notepad
objShell.Run "notepad.exe", 1, True

' Wait for Notepad to open
WScript.Sleep 500

' Send the clipboard text to Notepad
objShell.SendKeys clipboardText

' Wait for the text to be pasted
WScript.Sleep 500

' Save the file as "rattybatty.txt"
objShell.SendKeys "^s" ' Ctrl+S to save
WScript.Sleep 500
objShell.SendKeys "rattybatty.txt"
WScript.Sleep 500
objShell.SendKeys "{ENTER}" ' Press Enter to confirm save
WScript.Sleep 500

' Close Notepad
objShell.SendKeys "%{F4}" ' Alt+F4 to close Notepad

' Release the objects
Set objShell = Nothing
Set objHTML = Nothing
Set clipboardText = Nothing
