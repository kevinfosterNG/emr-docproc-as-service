============================================
= File descriptions
============================================
AutoLogon.exe – SysInternals App that setups auto logon
ODPRestart.ps1 – Powershell Script, makes sure the ODP process(es) are running and start them if they crash
ODPStart.exe/.ahk – AutoHotKey Script, if the app has generated 250 docs, it will restart app,  if the average time to complete goes over 25 seconds, it will restart the app, if any popups pop up, it will hit ok on them and hits the start button every 5 seconds.
Startup.bat – Set to Task Scheduler  to run on logon, Starts Powershell Script and AHK script


============================================
= Instructions
============================================
1.) Copy each file into c:\scripts\ on the machine that will run the document generation
  NOTE:  NextGen needs to be installed here
2.) Run the Autologon.exe to create the service.  The account will need to have read/write access to the DocSaved path
3.) Create a windows task scheduler entry to run the Startup.bat to run on logon.


============================================
= Security
============================================
If you are weary of random executable files you got from the internet, I understand.  
You can download the Autologon executable directly from Microsoft here:  https://technet.microsoft.com/en-us/sysinternals/autologon
You can download Autohotkey and compile the source code file ODPStart.ahk yourself.  Download Autohotkey from here:  https://autohotkey.com/download/ and use the AHK to EXE converter