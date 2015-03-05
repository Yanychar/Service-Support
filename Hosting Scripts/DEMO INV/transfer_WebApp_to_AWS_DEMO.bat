@echo off

REM The script does not accept parameters

echo   Bat file to deploy created WAR file in the TEST AMAZON environment
echo     1. Configuration
echo     2. Validate tools.war existence
echo     3. Stop Tomcat
echo     5. Backup locally existing WAR (5 last WAR)
echo     6. Delete TMS directory
echo     7. Copy WAR file from local
echo     8. Start Tomcat


echo 1. Configuration...

set app_dir=toolsmobile
set source="D:\Development\Inventory Development\PG_MobClient\www"
set dest_srv=ubuntu@toolsdemo.uisko.com
set dest=/opt/apache-tomcat-7.0.41
set dest_dir_archive="/opt/archive/tools_mobile"
set dest_key=C:\Users\sevastia\keys\tmskeys\tmskey.ppk

echo .              ... configured!


echo 2. Validate Web application existence
IF NOT EXIST %source%  (
  echo Directory '%source%' was not found. Deployment failed!
  goto exit
)


echo 3. Stop Tomcat ...
REM "C:\Program Files\PuTTY"\plink -ssh -i %dest_key% %dest_srv% "sudo %dest%/bin/shutdown.sh"


echo 4. Remove old content ...
"C:\Program Files\PuTTY"\plink -ssh -i %dest_key% %dest_srv% sudo rm %dest%/webapps/%app_dir%/index.html
"C:\Program Files\PuTTY"\plink -ssh -i %dest_key% %dest_srv% sudo rm -r %dest%/webapps/%app_dir%/css
"C:\Program Files\PuTTY"\plink -ssh -i %dest_key% %dest_srv% sudo rm -r %dest%/webapps/%app_dir%/img
"C:\Program Files\PuTTY"\plink -ssh -i %dest_key% %dest_srv% sudo rm -r %dest%/webapps/%app_dir%/js


echo 5. Copy Mobile Application to DEMO server ...

"C:\Program Files\PuTTY"\pscp -i %dest_key% %source%\index.html %dest_srv%:
"C:\Program Files\PuTTY"\plink -ssh -i %dest_key% %dest_srv% sudo mv index.html %dest%/webapps/%app_dir%

"C:\Program Files\PuTTY"\pscp -i %dest_key% -r %source%\css %dest_srv%:
"C:\Program Files\PuTTY"\plink -ssh -i %dest_key% %dest_srv% sudo mv css %dest%/webapps/%app_dir%

"C:\Program Files\PuTTY"\pscp -i %dest_key% -r %source%\img %dest_srv%:
"C:\Program Files\PuTTY"\plink -ssh -i %dest_key% %dest_srv% sudo mv img %dest%/webapps/%app_dir%

"C:\Program Files\PuTTY"\pscp -i %dest_key% -r %source%\js %dest_srv%:
"C:\Program Files\PuTTY"\plink -ssh -i %dest_key% %dest_srv% sudo mv js %dest%/webapps/%app_dir%


echo 6. Start Tomcat ...
echo START TOMCAT shall be done manually!!!

:exit

pause
