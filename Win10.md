### Disassembler0

```powershell
$url = 'https://raw.githubusercontent.com/mkropat/PSSnippets/master/Setup/Win10/Set-Win10Config.ps1'
$presetUrl = 'https://raw.githubusercontent.com/mkropat/dotfiles/master/win10-presets.txt'
(New-Object Net.WebClient).DownloadString($url) | Out-File "$env:TEMP\$(Split-Path -Leaf $url)"
& "$env:TEMP\$(Split-Path -Leaf $url)" -PresetUrl $presetUrl
```

### Software

```powershell
$software= @"
7zip
ag
cyberduck
firefox
git
googlechrome
jq
libreoffice-fresh
linqpad5
putty
steam
spotify
synctrayzor
vlc
"@

$url = 'https://raw.githubusercontent.com/mkropat/PSSnippets/master/Setup/Win10/Install-Software.ps1'
(New-Object Net.WebClient).DownloadString($url) | Out-File "$env:TEMP\$(Split-Path -Leaf $url)"
& "$env:TEMP\$(Split-Path -Leaf $url)" -Software ($software -split "`n")
```

### AutoHotkey

```powershell
$url = 'https://raw.githubusercontent.com/mkropat/PSSnippets/master/Setup/Win10/Install-AhkScript.ps1'
(New-Object Net.WebClient).DownloadString($url) | Out-File "$env:TEMP\$(Split-Path -Leaf $url)"
& "$env:TEMP\$(Split-Path -Leaf $url)" -ScriptUrl 'https://raw.githubusercontent.com/mkropat/dotfiles/master/mlk.ahk'
```

### Vim

```powershell
$vimrc = 'https://raw.githubusercontent.com/mkropat/dotfiles/master/.vimrc'
$plugins = @"
bling/vim-airline
ctrlpvim/ctrlp.vim
justinmk/vim-gtfo
mileszs/ack.vim
mkropat/vim-dwiw2015
PProvost/vim-ps1
tpope/vim-sensible
tpope/vim-sleuth
"@

$url = 'https://raw.githubusercontent.com/mkropat/PSSnippets/master/Setup/Dev/Install-Vim.ps1'
(New-Object Net.WebClient).DownloadString($url) | Out-File "$env:TEMP\$(Split-Path -Leaf $url)"
& "$env:TEMP\$(Split-Path -Leaf $url)" -Plugins ($plugins -split "`n") -VimrcUrl $vimrc
```
