#Write the output of the last 24 hours of system logs to a file:
#Get-EventLog -LogName System -After (Get-Date).AddDays(-1) | Out-File -FilePath .\last_24.txt # C:\Users\Violinist\Desktop\last_24.txt

#Get-EventLog -LogName System -EntryType Error | Out-File -FilePath .\errors.txt
#Get-EventLog -LogName System -InstanceID 16
#Get-EventLog -LogName System -Newest 20

#Get-EventLog -LogName System -Newest 500 | Group-Object -Property Source | Format-Table -AutoSize -Wrap
#Same thing, but using a variable
#$Events = Get-EventLog -LogName System -Newest 500
#$Events | Group-Object -Property Source | Format-Table -AutoSize -Wrap

#Portions of commands can be stored as variables then run using Invoke-Expression

$DesktopPath = [Environment]::GetFolderPath("Desktop")
$ErrPath = Join-Path -Path $DesktopPath -ChildPath errors.txt
$LastPath = Join-Path -Path $DesktopPath -ChildPath last_24.txt
$BaseCmd = "Get-EventLog -LogName System "
$Last24 = "-After (Get-Date).AddDays(-1) | Out-File -FilePath $LastPath"
$New20 = "-Newest 20"
$ErrEntry = "-EntryType Error | Out-File -FilePath $ErrPath"
$Inst16 = "-InstanceID 16"
$Source500 = "-Newest 500 | Group-Object -Property Source | Format-Table -AutoSize -Wrap"

#Putting the variables in an array then looping through.
$log_cmd=$Last24,$New20,$ErrEntry,$Inst16,$Source500
foreach ($log_req in $log_cmd) {
  Invoke-Expression $BaseCmd$log_req;
 }