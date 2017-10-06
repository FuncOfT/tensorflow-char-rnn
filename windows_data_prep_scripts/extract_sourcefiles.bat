::@echo off
setlocal EnableDelayedExpansion

if [%1]==[/?] goto :help

:: set defaults
set source="core"
set destination="sourcefiles"
set filetype="*.cs"
set exclude="obj Properties"

:: process command line
if not [%1]==[] set source=%1
if not [%2]==[] set destination=%2
if not [%3]==[] set filetype=%3
if not [%4]==[] set exclude=%4
set exclude=%exclude:"=%

::recursively copy files that match %filetype% to the %destination% folder
robocopy %source% %destination% %filetype% /s /XD %exclude%

exit /b 0

:help
echo USAGE: %~xn0 [source] [destination] [filetype] [exclude]
echo.
echo source: path to folder where all source files exist
echo filetype: *.cs for csharp, *.java for java etc.
echo exclude: space seperated list of directories to skip (e.g obj Properties)
echo destination: folder to copy all relevant files to
