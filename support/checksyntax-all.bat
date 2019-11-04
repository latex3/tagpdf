echo off
setlocal enabledelayedexpansion
echo %date% %time% > pdfapilot.log
for %%f in (*.pdftex.pdf) do del %%f
for %%f in (*.luatex.pdf) do del %%f
for %%f in (*.pdf) do (
   echo ===================== >> pdfapilot.log
   echo %%f >>pdfapilot.log
   pdfapilot --kfpx -a "pdfaPilotSyntaxChecks.kfpx" %%f >> pdfapilot.log
   echo !errorlevel! %%f >>pdfapilot.log
   echo !errorlevel! %%f
)
endlocal
