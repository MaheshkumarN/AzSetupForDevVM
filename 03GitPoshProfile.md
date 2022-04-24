# Add the following to the powershell profile and vs code powershell profile

- run the command "notepad $profile" this will show the path to where the profile will be created or existing
- Path 'C:\Users\<username>\Documents\PowerShell\Microsoft.Powershell_profile.ps1'
- Path 'C:\Users\<username>\Documents\PowerShell\Microsoft.VSCode_profile.ps1'

```powershell for Microsoft.Powershell_profile.ps1 and Microsoft.VSCode_profile.ps1
oh-my-posh prompt init pwsh --config C:\MN\MNOhMyPoshGit\mnposh.omp.json | Invoke-Expression
# oh-my-posh prompt init pwsh --config C:\MN\MNOhMyPoshGit\mnparadox.omp.json | Invoke-Expression
# oh-my-posh prompt init pwsh --config C:\Users\<yourlogingname>\AppData\Local\oh-my-posh\themes\jandedobbeleer.omp.json | Invoke-Expression

Import-Module -Name Terminal-Icons

Set-PSReadLineKeyHandler -Key Tab -Function Complete
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

# PowerShell script for winget
Register-ArgumentCompleter -Native -CommandName winget -ScriptBlock {
  param($wordToComplete, $commandAst, $cursorPosition)
  [Console]::InputEncoding = [Console]::OutputEncoding = $OutputEncoding = [System.Text.Utf8Encoding]::new()
  $Local:word = $wordToComplete.Replace('"', '""')
  $Local:ast = $commandAst.ToString().Replace('"', '""')
  winget complete --word="$Local:word" --commandline "$Local:ast" --position $cursorPosition | ForEach-Object {
    [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
  }
}

# PowerShell parameter completion shim for the dotnet CLI
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
  param($commandName, $wordToComplete, $cursorPosition)
  dotnet complete --position $cursorPosition "$wordToComplete" | ForEach-Object {
    [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
  }
}
```
