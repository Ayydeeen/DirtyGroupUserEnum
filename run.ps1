Get-ADGroup -filter * | sort-object name|select-object name | export-csv C:\Temp\groups.csv

gc C:\Temp\Groups.csv | % {$_ -replace '"',""} | out-file C:\Temp\Groupsq.csv -Fo -En ascii

get-content C:\Temp\groupsq.csv | foreach {Add-Content -path C:\temp\test3.txt -Value $_ ; Get-AdGroupMember -identity $_ | Select Name >> C:\Temp\test3.txt }
