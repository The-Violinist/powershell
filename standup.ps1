Set-NetFirewallRule -DisplayGroup "File And Printer Sharing" -Enabled True -Profile Any

# Enable all profiles in Windows Defender
Set-NetFirewallProfile -All -Enabled True
# Allow all incoming ICMP packets using  ICMPv4
New-NetFirewallRule -DisplayName “Allow inbound ICMPv4” -Direction Inbound -Protocol ICMPv4

# Enable Remote management
Enable-PSRemoting -Force
Set-Item WSMan:\localhost\Client\TrustedHosts *
Restart-Service WinRM

# Remove bloatware
Get-AppxPackage -Name "Microsoft.MicrosoftStickyNotes" | Remove-AppxPackage
# Enable Hyper-V
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
# Disable SMBv1