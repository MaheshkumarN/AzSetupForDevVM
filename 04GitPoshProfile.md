# Add the following to the powershell profile and vs code powershell profile

- run the command "notepad $profile" this will show the path to where the profile will be created or existing
- Path 'C:\Users\<username>\Documents\PowerShell\Microsoft.Powershell_profile.ps1'
- Path 'C:\Users\<username>\Documents\PowerShell\Microsoft.VSCode_profile.ps1'

```powershell for Microsoft.Powershell_profile.ps1 and Microsoft.VSCode_profile.ps1
$global:DefaultUser = [System.Environment]::UserName
Import-Module posh-git
Import-Module oh-my-posh
Import-Module -Name Terminal-Icons
Import-Module Get-ChildItemColor

Set-PoshPrompt -Theme paradox
#Set-PoshPrompt -Theme sorin
#Set-PoshPrompt -Theme agnoster
#Set-PoshPrompt -Theme agnosterplus
#Set-PoshPrompt -Theme jandedobbeleer

Set-PSReadLineKeyHandler -Key Tab -Function Complete
Set-PSReadlineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History

Set-Alias l Get-ChildItemColor -Option AllScope
Set-Alias ls Get-ChildItemColorFormatWide -Option AllScope
Set-Alias dir Get-ChildItemColorFormatWide -Option AllScope

# PowerShell parameter completion shim for the dotnet CLI
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
    param($commandName, $wordToComplete, $cursorPosition)
        dotnet complete --position $cursorPosition "$wordToComplete" | ForEach-Object {
           [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
}
```
