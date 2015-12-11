$UPT_USERNAME = Get-ChildItem Env:UPTIME_USERNAME | select -expand value;
$UPT_PASSWORD = Get-ChildItem Env:UPTIME_PASSWORD | select -expand value;
$UPT_HOSTNAME = Get-ChildItem Env:UPTIME_HOSTNAME | select -expand value;
$UPT_AUTHENTICATE = Get-ChildItem Env:UPTIME_AUTHENTICATE | select -expand value;

If($UPT_AUTHENTICATE -eq "true") {
	$credential = New-Object System.Management.Automation.PsCredential($UPT_USERNAME, (ConvertTo-SecureString $UPT_PASSWORD -AsPlainText -Force))
	}

#SET WQL Query MSExchangeTransportSMTPReceive part of the monitoring
$UPT_WQL = 'SELECT Name, AveragebytesPermessage, BytesReceivedPersec, ConnectionsCurrent, MessagesReceivedPersec FROM Win32_PerfFormattedData_MSExchangeTransportSMTPReceive_MSExchangeTransportSMTPReceive WHERE Name = "_total"'

#Retrieve data using authentication or not depending on choice
If($UPT_AUTHENTICATE -eq "true")
{
	$collitems = Get-WMIObject -Credential $credential -Query $UPT_WQL -ComputerName $UPT_HOSTNAME
}
ELSE 
{
	$collitems = Get-WMIObject -Query $UPT_WQL -ComputerName $UPT_HOSTNAME
}

#list the member properties and filter out the junk
$collitems_members = $collitems | gm -membertype properties | select -expand Name | ?{@("Name","PSComputerNAme","__Class","__DERIVATION","__DYNASTY","__GENUS","__NAMESPACE","__PATH","__PROPERTY_COUNT","__RELPATH","__SERVER","__SUPERCLASS","Description","Caption","Timestamp_Object","Timestamp_PerfTime","Timestamp_Sys100NS","Frequency_Object","Frequency_PerfTime","Frequency_Sys100NS") -notcontains $_}
#run through each object and their properties
foreach ($objitem in $collitems) {
	foreach ($objmember in $collitems_members) {
		#Write-Host ("{0}({1}){2}{3}" -f $objmember,$objitem.Name,'.WMI_value ',$objitem.$objmember)
		Write-Host ("{0}{1} {2}" -f 'SMTPRecv',$objmember,$objitem.$objmember)
	}
}

#SET WQL Query for MSExchangeTransportSmtpSend bit of the monitoring
$UPT_WQL = 'SELECT Name, BytesSentPersec, ConnectionsCurrent, MessagesSentPersec FROM Win32_PerfFormattedData_MSExchangeTransportSmtpSend_MSExchangeTransportSmtpSend WHERE Name = "_total"'

#Retrieve data using authentication or not depending on choice
If($UPT_AUTHENTICATE -eq "true")
{
	$collitems = Get-WMIObject -Credential $credential -Query $UPT_WQL -ComputerName $UPT_HOSTNAME
}
ELSE 
{
	$collitems = Get-WMIObject -Query $UPT_WQL -ComputerName $UPT_HOSTNAME
}

#list the member properties and filter out the junk
$collitems_members = $collitems | gm -membertype properties | select -expand Name | ?{@("Name","PSComputerNAme","__Class","__DERIVATION","__DYNASTY","__GENUS","__NAMESPACE","__PATH","__PROPERTY_COUNT","__RELPATH","__SERVER","__SUPERCLASS","Description","Caption","Timestamp_Object","Timestamp_PerfTime","Timestamp_Sys100NS","Frequency_Object","Frequency_PerfTime","Frequency_Sys100NS") -notcontains $_}
#run through each object and their properties
foreach ($objitem in $collitems) {
	foreach ($objmember in $collitems_members) {
		#Write-Host ("{0}({1}){2}{3}" -f $objmember,$objitem.Name,'.WMI_value ',$objitem.$objmember)
		Write-Host ("{0}{1} {2}" -f 'SMTPSend',$objmember,$objitem.$objmember)
	}
}

#SET WQL Query for MSExchangeOWA bit of the monitoring
$UPT_WQL = 'SELECT Name, CurrentUsers, LogonsPersec FROM Win32_PerfFormattedData_MSExchangeOWA_MSExchangeOWA'

#Retrieve data using authentication or not depending on choice
If($UPT_AUTHENTICATE -eq "true")
{
	$collitems = Get-WMIObject -Credential $credential -Query $UPT_WQL -ComputerName $UPT_HOSTNAME
}
ELSE 
{
	$collitems = Get-WMIObject -Query $UPT_WQL -ComputerName $UPT_HOSTNAME
}

#list the member properties and filter out the junk
$collitems_members = $collitems | gm -membertype properties | select -expand Name | ?{@("Name","PSComputerNAme","__Class","__DERIVATION","__DYNASTY","__GENUS","__NAMESPACE","__PATH","__PROPERTY_COUNT","__RELPATH","__SERVER","__SUPERCLASS","Description","Caption","Timestamp_Object","Timestamp_PerfTime","Timestamp_Sys100NS","Frequency_Object","Frequency_PerfTime","Frequency_Sys100NS") -notcontains $_}
#run through each object and their properties
foreach ($objitem in $collitems) {
	foreach ($objmember in $collitems_members) {
		#Write-Host ("{0}({1}){2}{3}" -f $objmember,$objitem.Name,'.WMI_value ',$objitem.$objmember)
		Write-Host ("{0}{1} {2}" -f 'OWA',$objmember,$objitem.$objmember)
	}
}

#SET WQL Query for MSExchangeRpcClientAccess bit of the monitoring
$UPT_WQL = 'SELECT Name, RPCAveragedLatency, RPCClientsBytesRead, RPCClientsBytesWritten, RPCdispatchtaskactivethreads, RPCdispatchtaskqueuelength, RPCOperationsPersec, RPCRequests FROM Win32_PerfFormattedData_MSExchangeRpcClientAccess_MSExchangeRpcClientAccess'

#Retrieve data using authentication or not depending on choice
If($UPT_AUTHENTICATE -eq "true")
{
	$collitems = Get-WMIObject -Credential $credential -Query $UPT_WQL -ComputerName $UPT_HOSTNAME
}
ELSE 
{
	$collitems = Get-WMIObject -Query $UPT_WQL -ComputerName $UPT_HOSTNAME
}

#list the member properties and filter out the junk
$collitems_members = $collitems | gm -membertype properties | select -expand Name | ?{@("Name","PSComputerNAme","__Class","__DERIVATION","__DYNASTY","__GENUS","__NAMESPACE","__PATH","__PROPERTY_COUNT","__RELPATH","__SERVER","__SUPERCLASS","Description","Caption","Timestamp_Object","Timestamp_PerfTime","Timestamp_Sys100NS","Frequency_Object","Frequency_PerfTime","Frequency_Sys100NS") -notcontains $_}
#run through each object and their properties
foreach ($objitem in $collitems) {
	foreach ($objmember in $collitems_members) {
		#Write-Host ("{0}({1}){2}{3}" -f $objmember,$objitem.Name,'.WMI_value ',$objitem.$objmember)
		Write-Host $objmember,$objitem.$objmember
	}
}

#SET WQL Query for Assistants - Per Assistant using msexchangemailboxassistants-total
$UPT_WQL = 'SELECT Name, AverageEventProcessingTimeInSeconds, AverageEventQueueTimeInSeconds, EventsinQueue, EventsProcessed, EventsProcessedPersec FROM Win32_PerfFormattedData_MSExchangeAssistantsPerAssistant_MSExchangeAssistantsPerAssistant WHERE Name = "msexchangemailboxassistants-total"'

#Retrieve data using authentication or not depending on choice
If($UPT_AUTHENTICATE -eq "true")
{
	$collitems = Get-WMIObject -Credential $credential -Query $UPT_WQL -ComputerName $UPT_HOSTNAME
}
ELSE 
{
	$collitems = Get-WMIObject -Query $UPT_WQL -ComputerName $UPT_HOSTNAME
}

#list the member properties and filter out the junk
$collitems_members = $collitems | gm -membertype properties | select -expand Name | ?{@("Name","PSComputerNAme","__Class","__DERIVATION","__DYNASTY","__GENUS","__NAMESPACE","__PATH","__PROPERTY_COUNT","__RELPATH","__SERVER","__SUPERCLASS","Description","Caption","Timestamp_Object","Timestamp_PerfTime","Timestamp_Sys100NS","Frequency_Object","Frequency_PerfTime","Frequency_Sys100NS") -notcontains $_}
#run through each object and their properties
foreach ($objitem in $collitems) {
	foreach ($objmember in $collitems_members) {
		#Write-Host ("{0}({1}){2}{3}" -f $objmember,$objitem.Name,'.WMI_value ',$objitem.$objmember)
		Write-Host ("{0}{1} {2}" -f 'ApA_',$objmember,$objitem.$objmember)
	}
}

#SET WQL Query for Assistants - Per Database using msexchangemailboxassistants-total
$UPT_WQL = 'SELECT Name, AverageEventProcessingTimeInseconds, AverageMailboxProcessingTimeInseconds, Eventsinqueue, MailboxesProcessed, MailboxesprocessedPersec FROM Win32_PerfFormattedData_MSExchangeAssistantsPerDatabase_MSExchangeAssistantsPerDatabase WHERE Name = "msexchangemailboxassistants-total"'

#Retrieve data using authentication or not depending on choice
If($UPT_AUTHENTICATE -eq "true")
{
	$collitems = Get-WMIObject -Credential $credential -Query $UPT_WQL -ComputerName $UPT_HOSTNAME
}
ELSE 
{
	$collitems = Get-WMIObject -Query $UPT_WQL -ComputerName $UPT_HOSTNAME
}

#list the member properties and filter out the junk
$collitems_members = $collitems | gm -membertype properties | select -expand Name | ?{@("Name","PSComputerNAme","__Class","__DERIVATION","__DYNASTY","__GENUS","__NAMESPACE","__PATH","__PROPERTY_COUNT","__RELPATH","__SERVER","__SUPERCLASS","Description","Caption","Timestamp_Object","Timestamp_PerfTime","Timestamp_Sys100NS","Frequency_Object","Frequency_PerfTime","Frequency_Sys100NS") -notcontains $_}
#run through each object and their properties
foreach ($objitem in $collitems) {
	foreach ($objmember in $collitems_members) {
		#Write-Host ("{0}({1}){2}{3}" -f $objmember,$objitem.Name,'.WMI_value ',$objitem.$objmember)
		Write-Host ("{0}{1} {2}" -f 'ApDB_',$objmember,$objitem.$objmember)
}
	}