#This script is for adding existing users to either existing groups or creating a group 
#to add the user to.

#Main
$userinp = Read-Host "Would you like to create a new group? "
If (($userinp -eq "Y") -or ($userinp -eq "Y")) {
    
    #Create a new group
    $newgrp = Read-Host "Please enter the name of the new group"
    New-ADGroup -Name $newgrp -SamAccountName Subs -GroupCategory Security -GroupScope Global -DisplayName $newgrp -Path "DC=corp,DC=ops301,DC=com"

  }  Else {

  'Ok, a new group will not be created.'
}


echo "Let's gather information for the group addition"
$grpname = Read-Host "Please enter the group name: "
$username = Read-Host "Please enter the user name: "

$guid = Get-ADUser -Identity $username | Select-Object "ObjectGUID" | Format-Table -HideTableHeaders | Out-String

#Find group guid
$subguid = Get-ADGroup -Filter {Name -like $grpname} | Select "ObjectGUID" | Format-Table -HideTableHeaders | Out-String

#Add existing users to this group
Add-ADGroupMember -Identity $subguid -Members $guid

#Check to see if the group exists
Get-ADGroupMember $subguid