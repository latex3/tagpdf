echo off
setlocal enabledelayedexpansion
echo %date% %time% > pdfapilot.log
   echo ===================== >> pdfapilot.log
   echo %1 >>pdfapilot.log
   pdfapilot --kfpx -a "pdfaPilotSyntaxChecks.kfpx" %1 >> pdfapilot.log
   echo !errorlevel! %1 >>pdfapilot.log
   echo !errorlevel! %1
)
endlocal
