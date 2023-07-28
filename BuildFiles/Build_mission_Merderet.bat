@echo off
title VIO-BECTI-IFA3.Merderet Mission gets created

set gitpath="F:\GitReps\Arma3_CTI_IFA3"
set buildpath="D:\Tausch\Programmierung\VIO-BECTI\VIO-BECTI-IFA3"
::set buildpath="C:\Users\loewi\Documents\Arma 3 - Other Profiles\dukee\mpmissions\VIO-BECTI-IFA3"

::echo Datum wird erstellt
::set YYYY=%date:~-4%
::set MM=%date:~-7,2%
::set DD=%date:~-10,2%
::set hr=%time:~0,2%
::if "%hr:~0,1%" == " " SET hr=0%hr:~1,1%
::set min=%time:~3,2%
::set sek=%time:~6,2%

set mapname="Merderet"
set missionfloder="VIO-BECTI-SPE_IFA3.I44_%mapname%"
echo aktuelle Mission wird erstellt unter: "buildpath\%missionfloder%"
echo copy Client folder
xcopy "%gitpath%\IFA3-BECTI.mapname\Client" "%buildpath%\%missionfloder%\Client" /E /Y /I
echo copy Common folder
xcopy "%gitpath%\IFA3-BECTI.mapname\Common" "%buildpath%\%missionfloder%\Common" /E /Y /I
echo copy Igiload folder
xcopy "%gitpath%\IFA3-BECTI.mapname\IgiLoad" "%buildpath%\%missionfloder%\IgiLoad" /E /Y /I
echo copy RSC files
xcopy "%gitpath%\IFA3-BECTI.mapname\RSC\Pictures" "%buildpath%\%missionfloder%\RSC\Pictures" /E /Y /I
xcopy "%gitpath%\IFA3-BECTI.mapname\RSC\Sounds" "%buildpath%\%missionfloder%\RSC\Sounds" /E /Y /I
copy "%gitpath%\IFA3-BECTI.mapname\RSC\Debriefing.hpp" "%buildpath%\%missionfloder%\RSC\Debriefing.hpp"
copy "%gitpath%\IFA3-BECTI.mapname\RSC\Dialogs.hpp" "%buildpath%\%missionfloder%\RSC\Dialogs.hpp"
copy "%gitpath%\IFA3-BECTI.mapname\RSC\Game.hpp" "%buildpath%\%missionfloder%\RSC\Game.hpp"
copy "%gitpath%\IFA3-BECTI.mapname\RSC\Notifications.hpp" "%buildpath%\%missionfloder%\RSC\Notifications.hpp"
copy "%gitpath%\IFA3-BECTI.mapname\RSC\Parameters_smallMap.hpp" "%buildpath%\%missionfloder%\RSC\Parameters.hpp"
copy "%gitpath%\IFA3-BECTI.mapname\RSC\Resources.hpp" "%buildpath%\%missionfloder%\RSC\Resources.hpp"
copy "%gitpath%\IFA3-BECTI.mapname\RSC\Sounds.hpp" "%buildpath%\%missionfloder%\RSC\Sounds.hpp"
copy "%gitpath%\IFA3-BECTI.mapname\RSC\Styles.hpp" "%buildpath%\%missionfloder%\RSC\Styles.hpp"
copy "%gitpath%\IFA3-BECTI.mapname\RSC\Titles.hpp" "%buildpath%\%missionfloder%\RSC\Titles.hpp"
echo copy Server folder
xcopy "%gitpath%\IFA3-BECTI.mapname\Server" "%buildpath%\%missionfloder%\Server" /E /Y /I
echo copy VAM folder
xcopy "%gitpath%\IFA3-BECTI.mapname\VAM_GUI" "%buildpath%\%missionfloder%\VAM_GUI" /E /Y /I
echo copy main files
copy "%gitpath%\IFA3-BECTI.mapname\briefing.sqf" "%buildpath%\%missionfloder%\briefing.sqf"
copy "%gitpath%\IFA3-BECTI.mapname\debug_diag.sqf" "%buildpath%\%missionfloder%\debug_diag.sqf"
copy "%gitpath%\IFA3-BECTI.mapname\description.ext" "%buildpath%\%missionfloder%\description.ext"
copy "%gitpath%\IFA3-BECTI.mapname\init.sqf" "%buildpath%\%missionfloder%\init.sqf"
copy "%gitpath%\IFA3-BECTI.mapname\mission_%mapname%.sqm" "%buildpath%\%missionfloder%\mission.sqm"
copy "%gitpath%\IFA3-BECTI-Thumpnails\IFA3-BECTI-%mapname%Small.jpg" "%buildpath%\%missionfloder%\VIO_BECTI.jpg"
copy "%gitpath%\IFA3-BECTI.mapname\WFpostprocess.sqf" "%buildpath%\%missionfloder%\WFpostprocess.sqf"
copy "%gitpath%\IFA3-BECTI.mapname\stringtable.xml" "%buildpath%\%missionfloder%\stringtable.xml"

echo pause