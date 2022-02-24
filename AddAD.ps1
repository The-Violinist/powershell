#New user example
#David Armstrong
#09-09-2020
#Adding a new user to ADAC using Powershell
#Variables
$Name = "Franz Ferdinand"
$Given = "Franz"
$Sur = "Ferdinand"
$Job = "TPS Reporting Lead"
$Dept = "TPS Department"
$Company = "Globex"
$Country = "US"
$State = "OR"
$City = "Springfield"
$email = "ferdi@globexnuclear.com"
#Main
New-ADUser -Name $Name -GivenName $Given -Surname $Sur -EmailAddress $email -Department $Dept -Company $Company -Country $Country -State $State -City $City -Title $Job
#End