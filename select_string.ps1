### VARIABLES ###
# Create the file path for the output file
$DesktopPath = [Environment]::GetFolderPath("Desktop")
$file_path = Join-Path -Path $DesktopPath -ChildPath network_report.txt
$file_path

### FUNCTIONS ###
function find_ip {
# Find the address strings from the output file
$ipconfig = Select-String -Path $file_path -Pattern 'ipv4' -AllMatches
    foreach ($line in $ipconfig) {
        if ($line -match "\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b") { 
        $matches[0]
}}}

function create_delete {
# Create a log of all the network interface information
    ipconfig /all | Out-File -FilePath $file_path
    find_ip
    Remove-Item -Path $file_path
}

### MAIN ###
create_delete
### END ###