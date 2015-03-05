REM @echo off


set jdk_home="C:\Program Files\Java\jdk1.7.0_67"

set source="D:\Development\Inventory Development\workspace_InventoryServer\InventoryServer"
set dest="D:\Development\Inventory Development\workspace_InventoryServer\InventoryServer\src\com\c2point\tools\ui\resources"


%jdk_home%\bin\native2ascii -encoding utf8 %source%\WebResources_en_FI.properties %dest%\WebResources_en_FI.properties
%jdk_home%\bin\native2ascii -encoding utf8 %source%\WebResources_et_FI.properties %dest%\WebResources_et_FI.properties
%jdk_home%\bin\native2ascii -encoding utf8 %source%\WebResources_fi_FI.properties %dest%\WebResources_fi_FI.properties
%jdk_home%\bin\native2ascii -encoding utf8 %source%\WebResources_ru_FI.properties %dest%\WebResources_ru_FI.properties


pause
