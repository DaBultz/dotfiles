Invoke-Expression (& { (zoxide init powershell --cmd cd | Out-String) })


Set-Alias -Name 'ls' -Value eza.exe -Option AllScope
Set-Alias -Name 'zvmup' -Value 'zvm i --zls --full master' -Option AllScope

$env:PATH += ";~\AppData\Local\nvim-data\mason\bin"

oh-my-posh init pwsh --config ~/.oh-my-posh/config.json | Invoke-Expression
