@echo off

REM The script does not accept parameters

set app_dir=toolsmobile
set source="D:\Development\Inventory Development\PG_MobClient\www\js\settings"
set dest_srv=ubuntu@toolsdemo.uisko.com
set dest=/opt/apache-tomcat-7.0.41
set dest_dir_archive="/opt/archive/tools_mobile"
set dest_key=C:\Users\sevastia\keys\tmskeys\tmskey.ppk

echo .              ... configured!



echo 5. Copy Mobile Application to DEMO server ...


"C:\Program Files\PuTTY"\pscp -i %dest_key% -r %source%\* %dest_srv%:
"C:\Program Files\PuTTY"\plink -ssh -i %dest_key% %dest_srv% sudo mv *.js %dest%/webapps/%app_dir%/js/settings



:exit

pause
