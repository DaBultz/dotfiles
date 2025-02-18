Invoke-Expression (& { (zoxide init powershell --cmd cd | Out-String) })

Set-Alias -Name 'ls' -Value eza.exe
Set-Alias -Name 'zvmup' -Value 'zvm i --zls --full master'

oh-my-posh init pwsh --config ~/.oh-my-posh/config.json | Invoke-Expression
