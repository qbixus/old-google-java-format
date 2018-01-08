@echo off
setlocal ENABLEDELAYEDEXPANSION
set theTOOL=..\tools\google-java-format-1.6-SNAPSHOT-all-deps.jar

if "%1" NEQ "l" (
	""%0"" l | java -jar "%theTOOL%" -r -a-p -s

) else (
	for /F %%i in ('dir /S /B pom.xml') do (
		dir /S /B "%%~pi\src\*.java"
	)
)
