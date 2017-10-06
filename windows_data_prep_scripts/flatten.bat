@echo off
setlocal EnableDelayedExpansion

if [%1]==[/?] goto :help

:: set defaults
set source="sourcefiles"
set output="flattened_sourcefiles.txt"
set filetype="*.cs"

:: process command line
if not [%1]==[] set source=%1
if not [%2]==[] set output=%2
if not [%3]==[] set filetype=%3

:: iterate over files that match filetype and append the content to the output file
for /R %source% %%f in (%filetype%) do (
    type "%%f" >> %output%
)

exit /b 0

:help
echo USAGE: %~xn0 [source] [output] [filetype]
echo.
echo source: path to parent source folder
echo output: filepath to output file (ANSI format) results are appended if file exists
echo filetype: "*.cs" for csharp, "*.java" for java etc.
