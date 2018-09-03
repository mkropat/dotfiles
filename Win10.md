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
