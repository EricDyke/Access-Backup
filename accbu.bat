@echo off
setlocal EnableDelayedExpansion

:: Loop through each item in backup list [file, backup_dir]
for /f "usebackq tokens=1-4 delims=," %%a in ("%~dp0%\accbu_list.csv") do (
		set filedir=%%~pa
		set filename=%%~na
		
		::Choose correct lock extension
		if %%~xa ==.accdb set "lext=.laccdb"
		if %%~xa ==.mdb set "lext=.ldb"
			
		set lockfile=!filedir!!filename!!lext!
				
		::Check lock file (is open)
		if exist !lockfile! (

			::Get modified time and re-write for automatic sort by name			
			set filedate=%%~ta
			set filedate=!filedate:~6,4!_!filedate:~0,2!_!filedate:~3,2!_!filedate:~17,2!!filedate:~11,5!
			::remove ':'
			set filedate=!filedate::=!
			
		 	set buName=!filedate!_!filename!%%~xa
		 	set buFilepath=%%b!buName!
		 	
		 	::backup if DNE (naming convention prevents backing up non-modified files)
			if not exist !buFilepath! (		
				echo source: %%a
				echo dest: !buFilepath!
				echo.
				copy "%%a" "!buFilepath!"
			)
		)
)