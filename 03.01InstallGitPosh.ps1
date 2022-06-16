# Run this command on both Powershell for installing the scripts and module
Set-ExecutionPolicy Bypass -scope CurrentUser -Force

# Setting Powershell for Git
Install-Module -Name Terminal-Icons -Repository PSGallery -Force
Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck

