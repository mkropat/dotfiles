### AutoHotkey

```powershell
$url = 'https://raw.githubusercontent.com/mkropat/PSSnippets/master/Setup/Win10/Install-AhkScript.ps1'
(New-Object Net.WebClient).DownloadString($url) | Out-File "$env:TEMP\$(Split-Path -Leaf $url)"
& "$env:TEMP\$(Split-Path -Leaf $url)" -ScriptUrl 'https://raw.githubusercontent.com/mkropat/dotfiles/master/mlk.ahk'
```
