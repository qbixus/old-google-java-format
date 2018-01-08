@echo off
setlocal ENABLEDELAYEDEXPANSION
set theTOOL=..\tools\google-java-format-1.6-SNAPSHOT-all-deps.jar

if "%1" NEQ "l" (
	""%0"" l | java -jar "%theTOOL%" -r -a-p -s

) else (
	for /F "tokens=1,*" %%i in ('git status --short *.java') do (
		if "%%i" EQU "R" (
			for /F "delims=> tokens=1,*" %%a in ("%%j") do (
				echo %%b
			)
		) else if "%%i" EQU "RM" (
			for /F "delims=> tokens=1,*" %%a in ("%%j") do (
				echo %%b
			)

		) else if "%%i" NEQ "D" (
			echo %%j
		)
	)
)
