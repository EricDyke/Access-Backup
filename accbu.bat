@echo off
setlocal EnableDelayedExpansion
:: Copy access databases only if open to stash a backup
::RGA and Vibroplating

:: RGA
set wipLockFile="C:\Users\E_Dyke\Documents\Clients\rGa\Paradox\l86.ldb"
set wipFile="C:\Users\E_Dyke\Documents\Clients\rGa\Paradox\l86.mdb"
set backupPath="M:\clients\Richard Gabriel\Access Dev\Backups"
set backupName="L86.mdb"

::Check for lock file (is open)
if exist !wipLockFile! (
	
	::Get modified time and re-write for automatic sort by name
	for %%a in (!wipFile!) do set wipDate=%%~ta
	set wipDate=!wipDate:~6,4!_!wipDate:~0,2!_!wipDate:~3,2!_!wipDate:~17,2!!wipDate:~11,5!

	::Add modified timestamp to name of file (remove ':' and extra `"`)
	set backupName=!wipDate::=!_!backupName:"=!

	::Generate full path
	set fullbackupPath="!backupPath:"=!\!backupName:"=!"
	
	::backup if DNE
	if not exist  !fullbackupPath! (		
		copy !wipFile! !fullbackupPath!
	)
)

::VIBRO
set wipLockFile="C:\Users\E_Dyke\Documents\Clients\Vibroplating\Vibroplating.laccdb"
set wipFile="C:\Users\E_Dyke\Documents\Clients\Vibroplating\Vibroplating.accdb"
set backupPath="M:\clients\Vibro plating\Database Dev\Dev Backups"
set backupName="Vibroplating.accdb"

::Check for lock file (is open)
if exist !wipLockFile! (
	
	::Get modified time and re-write for automatic sort by name
	for %%a in (!wipFile!) do set wipDate=%%~ta
	set wipDate=!wipDate:~6,4!_!wipDate:~0,2!_!wipDate:~3,2!_!wipDate:~17,2!!wipDate:~11,5!

	::Add modified timestamp to name of file (remove ':' and extra `"`)
	set backupName=!wipDate::=!_!backupName:"=!

	::Generate full path
	set fullbackupPath="!backupPath:"=!\!backupName:"=!"
	
	::backup if DNE
	if not exist  !fullbackupPath! (		
		copy !wipFile! !fullbackupPath!
	)
)