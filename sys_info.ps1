# Script Name: System Processes
# Author: David Armstrong
# Purpose: Demonstrate use of Get-Process, Start-Process, and Stop-Process
# Includes: Array, If conditional, For loop, and ForEach loop.

# Reference https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/start-process?view=powershell-7

### Main ###

# 1. Print to the terminal screen all active processes ordered by highest CPU time consumption at the top.
Get-Process | Sort-Object CPU -Descending

# 2. Print to the terminal screen all active processes ordered by highest Process Identification Number at the top.
Get-Process | Sort-Object id -Descending

# 3. Print to the terminal screen the top five active processes ordered by highest Working Set (WS(K)) at the top.
Get-Process | Sort-Object WorkingSet -Descending | Select-Object -First 5

# 4. Start the process Internet Explorer (iexplore.exe) and have it open https://owasp.org/www-project-top-ten/.
Start-Process -FilePath 'C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe' -ArgumentList 'https://owasp.org/www-project-top-ten/'

# 5. Start the process Internet Explorer (iexplore.exe) ten times using a for loop. Have each instance open https://owasp.org/www-project-top-ten/.
$StartEdge = "Start-Process -FilePath 'C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe' -ArgumentList 'https://owasp.org/www-project-top-ten/'"

for ($i = 1 ; $i -le 10 ; $i++)
{
    Invoke-Expression $StartEdge
    Start-Sleep -s 1
}
# 6. Close all Internet Explorer windows.
Stop-Process -Name "msedge"

# 7. Kill a process by its Process Identification Number. Choose a process whose termination won’t destabilize the system, such as Internet Explorer or MS Edge.
### FUNCTIONS ###
function KillApp {
$CloseApp = Read-Host "Please enter an application to close: "
$EdgeId = Get-Process -Name $CloseApp -ErrorAction SilentlyContinue | Select-Object id -ExpandProperty id
foreach ($Entry in $EdgeId) {
    Stop-Process -Id $Entry -ErrorAction SilentlyContinue
}}

function AskUser {
    $YesNo = Read-Host "Would you like to kill a process?"
    if (($YesNo -eq "y") -or ($YesNo -eq "yes")) {
        KillApp
}   else {
        break
}}

### MAIN ###
AskUser
### End ###