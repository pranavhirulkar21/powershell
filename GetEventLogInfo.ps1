$num = Read-Host "
1. View all available event logs on the system.
2. View events from a specific event log.
3. View events from a specific source.
4. View events within a specific time range.
5. View events with a specific event ID.
6. View events based on a specific entry type.
"

switch ($num) {
1 {
Get-EventLog -List
}

2 {
$logName = Read-Host "Enter the name of the event log (e.g., Application, System)"
Get-EventLog -LogName $logName
}

3 {
$source = Read-Host "Enter the name of the event source"
Get-EventLog | Where-Object {$_.Source -eq $source}
}

4 {
$startTime = Read-Host "Enter the start time (e.g., 'MM/dd/yyyy hh:mm:ss')"
$endTime = Read-Host "Enter the end time (e.g., 'MM/dd/yyyy hh:mm:ss')"
Get-EventLog -After $startTime -Before $endTime
}

5 {
$eventID = Read-Host "Enter the event ID"
Get-EventLog -InstanceId $eventID
}

6 {
$entryType = Read-Host "Enter the entry type (e.g., Error, Warning, Information)"
Get-EventLog -EntryType $entryType
}

default { Write-Output "Invalid Input!" }
}
