REM @echo off


set jdk_home="C:\Program Files\Java\jdk1.7.0_67"

set source="D:\Development\Inventory Development\workspace_ClientsDevelopment\ResourceConverterTMSBased"
set dest="D:\Development\Inventory Development\PG_MobClient\www\js\i18n"


del %dest%\resource_EN.js
del %dest%\resource_FI.js
del %dest%\resource_ET.js
del %dest%\resource_RU.js


%jdk_home%\bin\native2ascii -encoding utf8 %source%\resource_EN.txt %dest%\resource_EN.js
%jdk_home%\bin\native2ascii -encoding utf8 %source%\resource_FI.txt %dest%\resource_FI.js
%jdk_home%\bin\native2ascii -encoding utf8 %source%\resource_ET.txt %dest%\resource_ET.js
%jdk_home%\bin\native2ascii -encoding utf8 %source%\resource_RU.txt %dest%\resource_RU.js


del %source%\resource_EN.txt
del %source%\resource_FI.txt
del %source%\resource_ET.txt
del %source%\resource_RU.txt



pause
