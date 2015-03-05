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

set source_app_name=MobiTools-release.apk
set dest_app_name=MobileInventTori.apk
set app_dir=
set source="D:\Development\Inventory Development\PG_MobClient"
set dest_srv=ubuntu@toolsdemo.uisko.com
set dest=/opt/apache-tomcat-7.0.41/webapps/toolsmobile
set dest_dir_archive="/opt/archive/tools_mobile"
set dest_key=C:\Users\sevastia\keys\tmskeys\tmskey.ppk

echo .              ... configured!

echo 6. Copy Mobile Android Application to DEMO server ...
echo on
"C:\Program Files\PuTTY"\pscp -i %dest_key% %source%\platforms\android\ant-build\%source_app_name% %dest_srv%:
"C:\Program Files\PuTTY"\plink -ssh -i %dest_key% %dest_srv% sudo mv %source_app_name% %dest%/%dest_app_name%

REM echo 7. Start Tomcat ...
REM   ????

:exit

pause
