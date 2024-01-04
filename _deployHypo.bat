:: Get around the potential issue of powershell not being set to run external scripts
PowerShell Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

:: NOTE: Be sure to remove the '-bundle' part of the id in the measure bundle
PowerShell .\_deploy.ps1 NHSNGlycemicControlHypoglycemicInitialPopulation