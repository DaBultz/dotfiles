Invoke-Expression (& { (zoxide init powershell | Out-String) })


Set-Alias -Name 'ls' -Value eza.exe -Option AllScope
Set-Alias -Name 'zvmup' -Value 'zvm i --zls --full master' -Option AllScope
Set-Alias -Name 'cd' -Value 'z' -Option AllScope

$env:PATH += ";~\AppData\Local\nvim-data\mason\bin"

function y {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp -Encoding UTF8
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath ([System.IO.Path]::GetFullPath($cwd))
    }
    Remove-Item -Path $tmp
}

oh-my-posh init pwsh --config ~/.oh-my-posh/config.json | Invoke-Expression
