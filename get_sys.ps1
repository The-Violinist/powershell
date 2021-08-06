#Write the output of the last 24 hours of system logs to a file:
#Get-EventLog -LogName System -After (Get-Date).AddDays(-1) | Out-File -FilePath .\last_24.txt # C:\Users\Violinist\Desktop\last_24.txt

#Get-EventLog -LogName System -EntryType Error | Out-File -FilePath .\errors.txt
#Get-EventLog -LogName System -InstanceID 16
#Get-EventLog -LogName System -Newest 20

Get-EventLog -LogName System -Newest 500 | Group-Object -Property Source | Format-Table -AutoSize -Wrap
#Same thing, but using a variable
#$Events = Get-EventLog -LogName System -Newest 500
#$Events | Group-Object -Property Source | Format-Table -AutoSize -Wrap

#Portions of commands can be stored as variables then run using Invoke-Expression
$Var1 = "Get-EventLog -LogName System "
$Var2 = "-Newest 20"
Invoke-Expression $Var1$Var2
Invoke-Expression $Var1"-Newest 20"