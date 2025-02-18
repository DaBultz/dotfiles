Invoke-Expression (& { (zoxide init powershell --cmd cd | Out-String) })

Set-Alias -Name 'ls' -Value eza.exe

oh-my-posh init pwsh --config ~/.oh-my-posh/config.json | Invoke-Expression
