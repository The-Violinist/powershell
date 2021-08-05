Get-EventLog -LogName System -After (Get-Date).AddDays(-1) | Out-File -FilePath .\last_24.txt # C:\Users\Violinist\Desktop\last_24.txt
Get-EventLog -LogName System -EntryType Error | Out-File -FilePath .\errors.txt
Get-EventLog -LogName System -InstanceID 16
Get-EventLog -LogName System -Newest 20

$FormatEnumerationLimit = -1
$Events = Get-EventLog -LogName System -Newest 500
$Events | Group-Object -Property Source | Format-Table -AutoSize -Wrap