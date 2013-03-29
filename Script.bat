@ECHO off
setlocal enabledelayedexpansion
COLOR 0A
IF (%1)==(0) goto skipme
IF (%1) neq () goto adbi
ECHO -------------------------------------------------------------------------- >> APK-Multi-Tool.log
ECHO ^|%date% -- %time%^| >> APK-Multi-Tool.log
ECHO -------------------------------------------------------------------------- >> APK-Multi-Tool.log
Script 0 2>> APK-Multi-Tool.log
:error
:skipme
cd "%~dp0"
mode con:cols=105 lines=50
CLS
set usrc=9
set resusrc=0
set dec=0
set capp=None
set heapy=1024
set jar=0
java -version 
IF errorlevel 1 goto errjava
"%~dp0other\adb.exe" version 
IF errorlevel 1 goto erradb
set /A count=0
FOR %%F IN (place-apk-here-for-modding/*.apk) DO (
set /A count+=1
set tmpstore=%%~nF%%~xF
)
IF %count%==1 (set capp=%tmpstore%)
:skipme2
CLS
ECHO ***************************************************************************************
ECHO *                              APKTOOL MULTI-TOOLS                                    *
ECHO ***************************************************************************************
ECHO *                    Written By Gerald Wayne Baggett Jr {Raziel23x                    *
ECHO ***************************************************************************************
ECHO *                           Website: http://apkmultitool.com                          *
ECHO ***************************************************************************************
ECHO *           Empowering you to Do Your BEST where ever the path may lead you           *
ECHO ***************************************************************************************
ECHO *  Whether you're doing basic image editing or editing the smali or XML files, on     *
ECHO *  average u have to use (Brut.all or JF's smali/baksmali) awesome tool to extract    *
ECHO *  the apk, edit it, then sign the apk and then adb push/install it. This process is  * 
ECHO *  quite tiresome if you are testing a method that needs fine tweaking.               *
ECHO ***************************************************************************************
ECHO *  This script should make the process a LOT smoother.                                *
ECHO *  There is an option of compiling/signing/installing all in one step                 *
ECHO ***************************************************************************************
ECHO *  Special Thanks:                                                                    *
ECHO ***************************************************************************************
ECHO *  Goes to Daneshm90 the Original Writer of Apk Manager                               *
ECHO *  Goes to Brut.all for his awesome tool.                                             *
ECHO *  Goes to iBotPeaches for his awesome updates to Brut.all awesome tool.              *
ECHO *  Goes to JF for of course, smali/baksmali                                           *
ECHO ***************************************************************************************
ECHO *  Private Testes Special Thanks:                                                     *
ECHO ***************************************************************************************
ECHO *  Windows Testers:                                                                   *
ECHO ***************************************************************************************
ECHO *  Goes to Purian23                                                                   *
ECHO ***************************************************************************************
PAUSE
CLS
:restart
IF %dec%==0 (set decs=Sources and Resources Files)
IF %dec%==1 (set decs=Source Files only)
IF %dec%==2 (set decs=Resource Files only)
IF %dec%==3 (set decs=Raw Format Only)
cd "%~dp0"
set menunr=GARBAGE
CLS
ECHO  *******************************************************************************************
ECHO ^* Compression-Level: %usrc% ^* Resources.arsc Compression-Level: %resusrc% ^* Heap Size: %heapy%mb ^*  
ECHO  *******************************************************************************************
ECHO ^* Decompile : %decs% ^* Current-App: %capp% ^*
ECHO  *******************************************************************************************
ECHO                                                    HTTP://APKMULTITOOL.COM
ECHO  *******************************************************************************************
ECHO  * 0. IMAGE EDITING                                                                        *
ECHO  *    This feature allows you to edit images without the need to decompile the apk         *
ECHO  *    files making simple image changes such as icones and basic image editing             *
ECHO  *******************************************************************************************
ECHO  * 1. CODE EDITING                                                                         *
ECHO  *    This feature not only allows eding of the images it also allows you to edit          *
ECHO  *    the sourcecode of the select apk to make actual code changes                         *
ECHO  *******************************************************************************************
ECHO  * 2. ROM THEME PORTER                                                                     *
ECHO  *    This feature allows you to port entire themes from one rom to another                *
ECHO  *    without the need to resign the apk files making fast easy rom theme ports            *
ECHO  *******************************************************************************************
ECHO  * 3.  BATCH OPERATIONS                                                                    *
ECHO  *     This feature allows you to do many apk files at the same time for mass file editing *
ECHO  *     as well as the ability to compile multiple files at the same time                   *
ECHO  *******************************************************************************************
ECHO  * 4.  SETUP OPERATIONS                                                                    *
ECHO  *     This Feature allows you to setup this tool if this is the first time you are using  *
ECHO  *     this application to setup the folders required to be able to edit the apk files.    *
ECHO  *     This feature also allows you to install needed system files like updating your      *
ECHO  *     Frameworks-res and other system dependencies required to decompile system apps      *
ECHO  *******************************************************************************************
ECHO  * Tools Stuff                                                                             *
ECHO  *******************************************************************************************
ECHO  * a.   Clean Files/Folders                                                                *
ECHO  * b.   Select compression level for apk's                                                 *
ECHO  * c.   Select compression level for Resources.arsc                                        *
ECHO  * d.   Set Max Memory Size (Only use IF getting stuck at decompiling/compiling)           *
ECHO  * e.   Read Log                                                                           *
ECHO  * f.   Set current project                                                                *
ECHO  * g.   About / Tips / Debug Section                                                       *
ECHO  * h.   Switch decompile mode (Allows you to pick to fully decompile the APK's or JAR's    *
ECHO  *      or to just decompile Sources or just the Resources or do a raw dump allowing you   *
ECHO  *      to just edit the normal images)                                                    *
ECHO  * i.   Donations                                                                          *
ECHO  *      I would personally like to thank you for your superior generosity and kindness if  * 
ECHO  *      you are one of those droid loving fans donating to the site to help keep us going. *
ECHO  *      We hope to continue growing and for development to keep getting bigger and bigger  *
ECHO  *      as time goes on. Until then, Hope to see you around Have a great day               *
ECHO  * 00.   Quit                                                                              *
ECHO  *******************************************************************************************
SET /P menunr=Please make your decision:
IF %menunr%==0 (goto MENU00)
IF %menunr%==1 (goto MENU01)
IF %menunr%==2 (goto MENU02)
IF %menunr%==3 (goto MENU03)
IF %menunr%==4 (goto sysset)
IF %menunr%==a (goto cleanp)
IF %menunr%==b (goto usrcomp)
IF %menunr%==c (goto resusrcomp)
IF %menunr%==d (goto heap)
IF %menunr%==e (goto logr)
IF %menunr%==f (goto filesel)
IF %menunr%==g (goto about)
IF %menunr%==h (goto switchc)
IF %menunr%==i (goto dotome)
IF %menunr%==00 (goto quit)
:WHAT
ECHO You went crazy and entered something that wasnt part of the menu options
PAUSE
goto restart
:MENU00
set menunr=GARBAGE1
CLS
ECHO  *******************************************************************************************
ECHO ^* Compression-Level: %usrc% ^* Resources.arsc Compression-Level: %resusrc% ^* Heap Size: %heapy%mb ^*  
ECHO  *******************************************************************************************
ECHO ^* Decompile : %decs% ^* Current-App: %capp% ^*
ECHO  *******************************************************************************************
ECHO  *                                 HTTP://APKMULTITOOL.COM                                 *
ECHO  *******************************************************************************************
ECHO  * Simple Tasks Such As Image Editing                                                      *
ECHO  *******************************************************************************************
ECHO  * 0.   Adb pull                                                                           *
ECHO  * 1.   Extract apk                                                                        *
ECHO  * 2.   Optimize images inside                                                             *
ECHO  * 3.   Zip apk                                                                            *
ECHO  * 4.   Sign apk with Testkeys (Dont do this IF its a system apk)                          *
ECHO  * 5.   Zipalign apk (Do once apk is created/signed) Install apk (Dont do this IF          *
ECHO  *      system apk, do adb push)                                                           *
ECHO  * 6.   Install apk (Dont do this IF     system apk, do adb push)                          *
ECHO  * 7.   Zip / Sign / Install apk (All in one step)                                         *
ECHO  * 8.   Adb push (Only for system apk)                                                     *
ECHO  * 9.   Main Menu                                                                          *
ECHO  *******************************************************************************************
ECHO  * Tools Stuff                                                                             *
ECHO  *******************************************************************************************
ECHO  * a.   Clean Files/Folders                                                                *
ECHO  * b.   Select compression level for apk's                                                 *
ECHO  * c.   Select compression level for Resources.arsc                                        *
ECHO  * d.   Set Max Memory Size (Only use IF getting stuck at decompiling/compiling)           *
ECHO  * e.   Read Log                                                                           *
ECHO  * f.   Set current project                                                                *
ECHO  * g.   About / Tips / Debug Section                                                       *
ECHO  * h.   Switch decompile mode (Allows you to pick to fully decompile the APK's or JAR's    *
ECHO  *      or to just decompile Sources or just the Resources or do a raw dump allowing you   *
ECHO  *      to just edit the normal images)                                                    *
ECHO  * i.   Donations                                                                          *
ECHO  *      I would personally like to thank you for your superior generosity and kindness if  * 
ECHO  *      you are one of those droid loving fans donating to the site to help keep us going. *
ECHO  *      We hope to continue growing and for development to keep getting bigger and bigger  *
ECHO  *      as time goes on. Until then, Hope to see you around! Have a great day!"            *
ECHO  * 00.   Quit                                                                              *
ECHO  *******************************************************************************************
SET /P menunr=Please make your decision:
IF %menunr%==0 (goto ap)
IF %menunr%==1 (goto ex)
IF %menunr%==2 (goto opt)
IF %menunr%==3 (goto zip)
IF %menunr%==4 (goto stki)
IF %menunr%==5 (goto zipa)
IF %menunr%==6 (goto ins)
IF %menunr%==7 (goto alli)
IF %menunr%==8 (goto apu)
IF %menunr%==9 (goto restart)
IF %menunr%==a (goto cleanp)
IF %menunr%==b (goto usrcomp)
IF %menunr%==c (goto resusrcomp)
IF %menunr%==d (goto heap)
IF %menunr%==e (goto logr)
IF %menunr%==f (goto filesel)
IF %menunr%==g (goto about)
IF %menunr%==h (goto switchc)
IF %menunr%==i (goto dotome)
IF %menunr%==00 (goto quit)
IF %capp%==None goto noproj
:WHAT
ECHO You went crazy and entered something that wasnt part of the menu options
PAUSE
goto MENU00
:MENU01
set menunr=GARBAGE2
CLS
ECHO  *******************************************************************************************
ECHO ^* Compression-Level: %usrc% ^* Resources.arsc Compression-Level: %resusrc% ^* Heap Size: %heapy%mb ^*  
ECHO  *******************************************************************************************
ECHO ^* Decompile : %decs% ^* Current-App: %capp% ^*
ECHO  *******************************************************************************************
ECHO  *                                 HTTP://APKMULTITOOL.COM                                 *
ECHO  *******************************************************************************************
ECHO  * Advanced Tasks Such As Code Editing                                                     *
ECHO  *******************************************************************************************
ECHO  * 1.   Decompile apk                                                                      *
ECHO  * 2.   Decompile apk (with dependencies)(For proprietary rom apks)                        *
ECHO  * 3.   Compile System APK files                                                           *
ECHO  * 4.   Compile Non-System APK Files                                                       *
ECHO  * 5.   Sign apk with Android Market supported Key                                         *
ECHO  * 6.   Install apk                                                                        *
ECHO  * 7.   Compile apk / Sign apk / Install apk (Non-System Apps Only)                        *
ECHO  * 8.   Main Menu                                                                          *
ECHO  *******************************************************************************************
ECHO  * Tools Stuff                                                                             *
ECHO  *******************************************************************************************
ECHO  * a.   Clean Files/Folders                                                                *
ECHO  * b.   Select compression level for apk's                                                 *
ECHO  * c.   Select compression level for Resources.arsc                                        *
ECHO  * d.   Set Max Memory Size (Only use IF getting stuck at decompiling/compiling)           *
ECHO  * e.   Read Log                                                                           *
ECHO  * f.   Set current project                                                                *
ECHO  * g.   About / Tips / Debug Section                                                       *
ECHO  * h.   Switch decompile mode (Allows you to pick to fully decompile the APK's or JAR's    *
ECHO  *      or to just decompile Sources or just the Resources or do a raw dump allowing you   *
ECHO  *      to just edit the normal images)                                                    *
ECHO  * i.   Donations                                                                          *
ECHO  *      I would personally like to thank you for your superior generosity and kindness if  * 
ECHO  *      you are one of those droid loving fans donating to the site to help keep us going. *
ECHO  *      We hope to continue growing and for development to keep getting bigger and bigger  *
ECHO  *      as time goes on. Until then, Hope to see you around! Have a great day!"            *
ECHO  * 00.   Quit                                                                              *
ECHO  *******************************************************************************************
SET /P menunr=Please make your decision:

IF %menunr%==1 (goto de)
IF %menunr%==2 (goto ded)
IF %menunr%==3 (goto syscom)
IF %menunr%==4 (goto nonsyscom)
IF %menunr%==5 (goto apksignerkey)
IF %menunr%==6 (goto ins)
IF %menunr%==7 (goto all)
IF %menunr%==8 (goto restart)
IF %menunr%==a (goto cleanp)
IF %menunr%==b (goto usrcomp)
IF %menunr%==c (goto resusrcomp)
IF %menunr%==d (goto heap)
IF %menunr%==e (goto logr)
IF %menunr%==f (goto filesel)
IF %menunr%==g (goto about)
IF %menunr%==h (goto switchc)
IF %menunr%==i (goto dotome)
IF %menunr%==00 (goto quit)
IF %capp%==None goto noproj01
:WHAT
ECHO You went crazy and entered something that wasnt part of the menu options
PAUSE
goto MENU01
:MENU02
set menunr=GARBAGE3
CLS
ECHO  *******************************************************************************************
ECHO  *                                 HTTP://APKMULTITOOL.COM                                 *
ECHO  *******************************************************************************************
ECHO  * Themers Convertion Tools                                                                *
ECHO  *******************************************************************************************
ECHO  * 1.   Batch Theme Image Transfer (Read the Instructions before                           *
ECHO  *      using this feature)                                                                *
ECHO  * 2.   Main Menu                                                                          *
ECHO  *******************************************************************************************
ECHO  * Tools Stuff                                                                             *
ECHO  *******************************************************************************************
ECHO  * a.   Clean Files/Folders                                                                *
ECHO  * b.   Select compression level for apk's                                                 *
ECHO  * c.   Select compression level for Resources.arsc                                        *
ECHO  * d.   Set Max Memory Size (Only use IF getting stuck at decompiling/compiling)           *
ECHO  * e.   Read Log                                                                           *
ECHO  * f.   Set current project                                                                *
ECHO  * g.   About / Tips / Debug Section                                                       *
ECHO  * h.   Switch decompile mode (Allows you to pick to fully decompile the APK's or JAR's    *
ECHO  *      or to just decompile Sources or just the Resources or do a raw dump allowing you   *
ECHO  *      to just edit the normal images)                                                    *
ECHO  * i.   Donations                                                                          *
ECHO  *      I would personally like to thank you for your superior generosity and kindness if  * 
ECHO  *      you are one of those droid loving fans donating to the site to help keep us going. *
ECHO  *      We hope to continue growing and for development to keep getting bigger and bigger  *
ECHO  *      as time goes on. Until then, Hope to see you around! Have a great day!"            *
ECHO  * 00.   Quit                                                                              *
ECHO  *******************************************************************************************
SET /P menunr=Please make your decision:

IF %menunr%==1 (goto btit)
IF %menunr%==2 (goto restart)
IF %menunr%==a (goto cleanp)
IF %menunr%==b (goto usrcomp)
IF %menunr%==c (goto resusrcomp)
IF %menunr%==d (goto heap)
IF %menunr%==e (goto logr)
IF %menunr%==f (goto filesel)
IF %menunr%==g (goto about)
IF %menunr%==h (goto switchc)
IF %menunr%==i (goto dotome)
IF %menunr%==00 (goto quit)
:WHAT
ECHO You went crazy and entered something that wasnt part of the menu options
PAUSE
goto MENU02
:MENU03
set menunr=GARBAGE4
CLS
ECHO  *******************************************************************************************
ECHO  *                                 HTTP://APKMULTITOOL.COM                                 *
ECHO  *******************************************************************************************
ECHO  * Batch Operations                                                                        *
ECHO  *******************************************************************************************
ECHO  * 1.   Batch Decompile apk Files                                                          *
ECHO  * 2.   Batch Compile apk Files                                                            *
ECHO  * 3.   Batch Optimize Apk (inside place-apk-here-to-batch-optimize only)                  *
ECHO  * 4.   Sign an apk(Batch support)(inside place-apk-here-for-signing folder only)          *
ECHO  * 5.   Batch optimize ogg files (inside place-ogg-here only)                              *
ECHO  * 6.   Main Menu                                                                          *     
ECHO  *******************************************************************************************
ECHO  * Tools Stuff                                                                             *
ECHO  *******************************************************************************************
ECHO  * a.   Clean Files/Folders                                                                *
ECHO  * b.   Select compression level for apk's                                                 *
ECHO  * c.   Select compression level for Resources.arsc                                        *
ECHO  * d.   Set Max Memory Size (Only use IF getting stuck at decompiling/compiling)           *
ECHO  * e.   Read Log                                                                           *
ECHO  * f.   Set current project                                                                *
ECHO  * g.   About / Tips / Debug Section                                                       *
ECHO  * h.   Switch decompile mode (Allows you to pick to fully decompile the APK's or JAR's    *
ECHO  *      or to just decompile Sources or just the Resources or do a raw dump allowing you   *
ECHO  *      to just edit the normal images)                                                    *
ECHO  * i.   Donations                                                                          *
ECHO  *      I would personally like to thank you for your superior generosity and kindness if  * 
ECHO  *      you are one of those droid loving fans donating to the site to help keep us going. *
ECHO  *      We hope to continue growing and for development to keep getting bigger and bigger  *
ECHO  *      as time goes on. Until then, Hope to see you around! Have a great day!"            *
ECHO  * 00.   Quit                                                                              *
ECHO  *******************************************************************************************
SET /P menunr=Please make your decision:

IF %menunr%==1 (goto batdec)
IF %menunr%==2 (goto batcom)
IF %menunr%==3 (goto bopt)
IF %menunr%==4 (goto asi)
IF %menunr%==5 (goto ogg)
IF %menunr%==6 (goto restart)
IF %menunr%==a (goto cleanp)
IF %menunr%==b (goto usrcomp)
IF %menunr%==c (goto resusrcomp)
IF %menunr%==d (goto heap)
IF %menunr%==e (goto logr)
IF %menunr%==f (goto filesel)
IF %menunr%==g (goto about)
IF %menunr%==h (goto switchc)
IF %menunr%==i (goto dotome)
IF %menunr%==00 (goto quit)

:WHAT
ECHO You went crazy and entered something that wasnt part of the menu options
PAUSE
goto MENU03
:switchc
set /a dec+=1 
IF (%dec%)==(4) (set /a dec=0)
goto restart
:cleanp
ECHO 1. Clean This Project's Folder
ECHO 2. Clean All Apk's in Modding Folder
ECHO 3. Clean All OGG's in OGG Folder
ECHO 4. Clean All Apk's in Optimize Folder
ECHO 5. Clean All Apk's in Signing Folder
ECHO 6. Clean All Projects
ECHO 7. Clean All Folders/Files
ECHO 8. Go Back To MAIN MENU
SET /P menuna=Please make your decision:
ECHO Clearing Directories
IF %menuna%==1 (
IF %capp%==None goto noproj
rmdir /S /Q %userprofile%\apktool > nul
rmdir /S /Q projects\%capp% > nul
mkdir projects\%capp%
)
IF %menuna%==2 (
rmdir /S /Q %userprofile%\apktool > nul
rmdir /S /Q place-apk-here-for-modding > nul
mkdir place-apk-here-for-modding
)
IF %menuna%==3 (
rmdir /S /Q place-ogg-here > nul
mkdir place-ogg-here
)
IF %menuna%==4 (
rmdir /S /Q place-apk-here-to-batch-optimize > nul
mkdir place-apk-here-to-batch-optimize
)
IF %menuna%==5 (
rmdir /S /Q place-apk-here-for-signing > nul
mkdir place-apk-here-for-signing
)
IF %menuna%==7 (
rmdir /S /Q %userprofile%\apktool > nul
rmdir /S /Q projects\%capp% > nul
mkdir projects\%capp%
rmdir /S /Q place-apk-here-for-modding > nul
mkdir place-apk-here-for-modding
rmdir /S /Q place-ogg-here > nul
mkdir place-ogg-here
rmdir /S /Q place-apk-here-to-batch-optimize > nul
mkdir place-apk-here-to-batch-optimize
rmdir /S /Q place-apk-here-for-signing > nul
mkdir place-apk-here-for-signing
rmdir /S /Q %userprofile%\apktool > nul
rmdir /S /Q projects > nul
mkdir projects
)
IF %menuna%==6 (
rmdir /S /Q %userprofile%\apktool > nul
rmdir /S /Q projects > nul
mkdir projects
)
goto restart
:about
CLS
ECHO About
ECHO -----
type other\version.txt
ECHO Updates and Support Site
ECHO Please Visit the Official Website for updated information and to check out the latest official releases
ECHO The Website Address is http://apkmultitool.com
ECHO ----
ECHO Tips
ECHO ----
ECHO 1. IF Modifying system apps, never resign them unless you want to resign all
ECHO apk's that share its shared:uid
ECHO 2. IF decompiling/recompiling system apps and IF AndroidManifest.xml was not
ECHO preserved from the original apk, then either push the apk when in recovery or
ECHO by doing :
ECHO adb remount
ECHO adb shell stop
ECHO adb push something.apk /wherever/something.apk
ECHO adb shell start
ECHO 3. Decompiling a themed apk is not possible, you must get the original unthemed
ECHO apk, then decompile, make your theme/xml changes and recompile
ECHO 4. IF you're stuck and the log doesnot give you any indication as to what you 
ECHO are doing wrong, then post in the thread http://www.tiny.cc/apkmanager
ECHO Make sure u include ur APK-Multi-Tool.log, and IF its not a editing problem i.e 
ECHO its something regarding when u push it to your phone, then post ur adb log 
ECHO as well. To do so 
ECHO follow these steps :
ECHO 1. Connect ur phone to ur pc
ECHO 2. Push/install the app on your phone
ECHO 3. Select "Create Log" option on this menu
ECHO 4. Let the new window run for 10 seconds, then close it
ECHO Once done, you will find a adblog.txt in the root folder
ECHO Upload that as well.
ECHO.
ECHO 1. Create log
ECHO 2. Go back to MAIN MENU
SET /P menunr=Please make your decision:
IF %menunr%==1 (Start "Adb Log" other\signer 2)
goto restart
:portapk
ECHO Im going to try resigning the apk and see IF that works
ECHO Did it successfully install (y/n) ^?
ECHO Ok, lets try looking through for any shared uid, IF i find any i will remove them
:filesel
CLS
set /A count=0
FOR %%F IN (place-apk-here-for-modding/*.apk) DO (
set /A count+=1
set a!count!=%%F
IF /I !count! LEQ 9 (ECHO ^- !count!  - %%F )
IF /I !count! GTR 10 (ECHO ^- !count! - %%F )
)
ECHO.
ECHO Choose the app to be set as current project?
set /P INPUT=Enter It's Number: %=%
IF /I %INPUT% GTR !count! (goto chc)
IF /I %INPUT% LSS 1 (goto chc)
set capp=!a%INPUT%!
set jar=0
set ext=jar
IF "!capp:%ext%=!" NEQ "%capp%" set jar=1
goto restart
:chc
set capp=None
goto restart

:heap
set /P INPUT=Enter max size for java heap space in megabytes (eg 512) : %=%
set heapy=%INPUT%
CLS
goto restart
:usrcomp
set /P INPUT=Enter Compression Level (0-9) : %=%
set usrc=%INPUT%
CLS
goto restart
:resusrcomp
set /P INPUT=Enter Compression Level (0-9) : %=%
set resusrc=%INPUT%
CLS
goto restart
:btit
ECHO Batch Theme Image Transfer TOOL
ECHO Expermental use with caution
ECHO This tool makes the process of transferring images from one APK file to another 
ECHO APK File of the same file making it easier to update themes or even transferring
ECHO a theme update.zip of one ROM to another Rom allowing the porting of theme to
ECHO be much faster.
ECHO (Note: You will have to manually replace the progress_horizontals.xml from the
ECHO framework-res since this file is needed with Theme Changes)
PAUSE
cd themer
Start "Begining porting of themes" tporter
goto restart
:batdec
cls
ECHO This will Decompile all the APK files inside of the place-apk-here-for-modding
ECHO and add the Decompiled Versions into the Project folder as if you decompiled
ECHO all the APK FILES one at a time using option 9
PAUSE
cd other
Start "Begining Batch Decompiling of all the APK Files" batdecomp
goto restart
:batcom
cls
ECHO This will Compile all the APK files inside of the project folder
ECHO and add the Compiled Versions into the place-apk-here-for-signing folder as if you 
ECHO compiled all the APK FILES one at a time using option 12 sub option 2
PAUSE
cd other
Start "Begining Batch Compiling of all the APK Files" batcomp
goto restart
:ogg
cd other
mkdir temp
ECHO Optimizing Ogg
FOR %%F IN ("../place-ogg-here/*.ogg") DO sox "../place-ogg-here/%%F" -C 0 "temp\%%F"
cd ..
MOVE other\temp\*  place-ogg-here
rmdir /S /Q other\temp
goto restart
:alli
IF NOT EXIST "%~dp0projects\%capp%" GOTO dirnada
CLS
ECHO 1    System apk (Retains signature)
ECHO 2    Regular apk (Removes signature for re-signing)
SET /P menunr=Please make your decision: 
IF %menunr%==1 (goto sys1)
IF %menunr%==2 (goto oa1)
:sys1
ECHO Zipping Apk
cd other
7za a -tzip "../place-apk-here-for-signing/unsigned%capp%" "../projects/%capp%/*" -mx%usrc%
IF errorlevel 1 (
ECHO "An Error Occured, Please Check The Log (option e)"
PAUSE
)
cd ..
goto si1
:oa1
cd other
ECHO Zipping Apk
rmdir /S /Q "../out/META-INF"
7za a -tzip "../place-apk-here-for-signing/unsigned%capp%" "../projects/%capp%/*" -mx%usrc%
IF errorlevel 1 (
ECHO "An Error Occured, Please Check The Log (option e)"
PAUSE
)
cd ..
:si1
cd other
ECHO Signing Apk
java -Xmx%heapy%m -jar signapk.jar -w testkey.x509.pem testkey.pk8 ../place-apk-here-for-signing/unsigned%capp% ../place-apk-here-for-signing/signed%capp%
IF errorlevel 1 (
ECHO "An Error Occured, Please Check The Log (option e)"
PAUSE
)
DEL /Q "../place-apk-here-for-signing/unsigned%capp%"
cd ..
:ins1
ECHO Waiting for device
"%~dp0other\adb.exe" wait-for-device
ECHO Installing Apk
"%~dp0other\adb.exe" install -r %~dp0place-apk-here-for-signing/signed%capp%
IF errorlevel 1 (
ECHO "An Error Occured, Please Check The Log (option e)"
PAUSE
)
goto restart
:asi
cd other
DEL /Q "../place-apk-here-for-signing/signed.apk"
FOR %%F in (../place-apk-here-for-signing/*) DO call signer "%%F"
cd ..
goto restart
:bopt
set /P INPUT=Do you want to zipalign(z), optimize png(p) or both(zp)? : %=%
FOR %%F IN (place-apk-here-to-batch-optimize\*.apk) DO (call :dan "%%F")
MOVE "other\optimized\*.apk" "place-apk-here-to-batch-optimize"
rmdir /S /Q "other\optimized"
goto restart
:dan
IF (%INPUT%)==(zp) GOTO zipb
IF (%INPUT%)==(z) GOTO zipo
:zipb
@ECHO Optimizing %~1...
cd other
md "apkopt_temp_%~n1"
md optimized
dir /b
7za x -o"apkopt_temp_%~n1" "../place-apk-here-to-batch-optimize/%~n1%~x1"
mkdir temp
xcopy "apkopt_temp_%~n1\res\*.9.png" "temp" /S /Y
roptipng -o99 "apkopt_temp_%~n1\**\*.png"
del /q "..\place-apk-here-to-batch-optimize\%~n1%~x1"
xcopy "temp" "apkopt_temp_%~n1\res" /S /Y
rmdir "temp" /S /Q
IF (%INPUT%)==(p) GOTO ponly
7za a -tzip "optimized\%~n1.unaligned.apk" "%~dp0other\apkopt_temp_%~n1\*" -mx%usrc% 
rd /s /q "apkopt_temp_%~n1"
"%~dp0other\zipalign.exe" -v 4 "optimized\%~n1.unaligned.apk" "optimized\%~n1.apk"
del /q "optimized\%~n1.unaligned.apk"
goto endab
:ponly
7za a -tzip "optimized\%~n1.apk" "%~dp0other\apkopt_temp_%~n1\*" -mx%usrc%
rd /s /q "apkopt_temp_%~n1"
goto endab
:zipo
@ECHO Optimizing %~1...
"%~dp0other\zipalign.exe" -v 4 "%~dp0place-apk-here-to-batch-optimize\%~n1%~x1" "%~dp0place-apk-here-to-batch-optimize\u%~n1%~x1"
del /q "%~dp0place-apk-here-to-batch-optimize\%~n1%~x1"
rename "%~dp0place-apk-here-to-batch-optimize\u%~n1%~x1" "%~n1%~x1"
goto endab
:dirnada
ECHO %capp% has not been extracted, please do so before doing this step
PAUSE
goto restart
:opt
IF NOT EXIST "%~dp0projects\%capp%" GOTO dirnada
mkdir temp
xcopy "%~dp0projects\%capp%\res\*.9.png" "%~dp0temp" /S /Y
cd other
ECHO Optimizing Png's
roptipng -o99 "../projects/%capp%/**/*.png"
cd ..
xcopy "%~dp0temp" "%~dp0projects\%capp%\res" /S /Y
rmdir temp /S /Q
goto restart
:noproj
ECHO Please Select A Project To Work On (Option f)
PAUSE
goto MENU00
:noproj01
ECHO Please Select A Project To Work On (Option f)
PAUSE
goto MENU01
:ap
ECHO Where do you want adb to pull the apk from? 
ECHO Example of input : /system/app/launcher.apk
set /P INPUT=Type input: %=%
ECHO Pulling apk
"%~dp0other\adb.exe" pull %INPUT% "%~dp0place-apk-here-for-modding\something.apk"
IF errorlevel 1 (
ECHO "An Error Occured, Please Check The Log (option e)"
PAUSE
goto restart
)
set jar=0
set ext=jar
IF "!INPUT:%ext%=!" NEQ "%INPUT%" set jar=1
:renameagain
ECHO What filename would you like this app to be stored as ?
ECHO Eg (launcher.apk)
set /P INPUT=Type input: %=%
IF EXIST "%~dp0place-apk-here-for-modding\%INPUT%" (
ECHO File Already Exists, Try Another Name
PAUSE
goto renameagain)
rename "%~dp0place-apk-here-for-modding\something.apk" %INPUT%
ECHO Would you like to set this as your current project (y/n)?
set /P inab=Type input: %=%
IF %inab%==y (set capp=%INPUT%)
goto restart
:apu
ECHO Do you want to keep the file name ? (any key for yes, n for no)
set /p INPUT=""
if %INPUT%==n (
ECHO "Enter the new name: "
set /P newcapp=Type input: %=%
set newname=1
goto push_dir
)
set newname=0 
 
:push_dir
ECHO Where do you want adb to push to ? (f) for framework and (a) for app
set /P fileloc=""
"%~dp0other\adb.exe" devices >null
"%~dp0other\adb.exe" remount
ECHO Pushing apk
if %fileloc%==a (
if %newname%==0 (
"%~dp0other\adb.exe" push "place-apk-here-for-modding\system%capp%" /system/app/%capp%
goto chk_err_push
)
if %newname%==1 (
"%~dp0other\adb.exe" push "place-apk-here-for-modding\system%capp%" /system/app/%newcapp%
goto chk_err_push
)
)
if %fileloc%==f (
if %newname%==0 (
"%~dp0other\adb.exe" push "place-apk-here-for-modding\system%capp%" /system/framework/%capp%
goto chk_err_push
)
if %newname%==1 (
"%~dp0other\adb.exe" push "place-apk-here-for-modding\system%capp%" /system/framework/%newcapp%
goto chk_err_push
)
)
ECHO "u pressed the wrong key"
goto push_dir

:chk_err_push
IF errorlevel 1 (
ECHO "An Error Occured, Please Check The Log (option e)"
PAUSE
)
goto restart
:zipa
ECHO Zipaligning Apk
IF EXIST "%~dp0place-apk-here-for-signing\signed%capp%" "%~dp0other\zipalign.exe" -f 4 "%~dp0place-apk-here-for-signing\signed%capp%" "%~dp0place-apk-here-for-modding\signedaligned%capp%"

IF EXIST "%~dp0place-apk-here-for-signing\unsigned%capp%" "%~dp0other\zipalign.exe" -f 4 "%~dp0place-apk-here-for-signing\unsigned%capp%" "%~dp0place-apk-here-for-signing\unsignedaligned%capp%"

IF errorlevel 1 (
ECHO "An Error Occured, Please Check The Log (option e)"
PAUSE
)
DEL /Q "%~dp0place-apk-here-for-signing\signed%capp%"
DEL /Q "%~dp0place-apk-here-for-signing\unsigned%capp%"
rename "%~dp0place-apk-here-for-signing\signedaligned%capp%" signed%capp%
rename "%~dp0place-apk-here-for-signing\unsignedaligned%capp%" unsigned%capp%
goto restart
:ex
cd other
ECHO Extracting apk
IF EXIST "../projects/%capp%" (rmdir /S /Q "../projects/%capp%")
7za x -o"../projects/%capp%" "../place-apk-here-for-modding/%capp%"
IF errorlevel 1 (
ECHO "An Error Occured, Please Check The Log (option e)"
PAUSE
)
cd ..
goto restart
:zip
IF NOT EXIST "%~dp0projects\%capp%" GOTO dirnada
CLS
ECHO 1    System apk (Retains signature)
ECHO 2    Regular apk (Removes signature for re-signing)
SET /P menunr=Please make your decision: 
IF %menunr%==1 (goto sys)
IF %menunr%==2 (goto oa)
:sys
ECHO Zipping Apk
cd other
7za a -tzip "../place-apk-here-for-signing/unsigned%capp%" "../projects/%capp%/*" -mx%usrc%
IF errorlevel 1 (
ECHO "An Error Occured, Please Check The Log (option e)"
PAUSE
)

cd ..
goto restart
:oa
cd other
ECHO Zipping Apk
rmdir /S /Q "../out/META-INF"
7za a -tzip "../place-apk-here-for-signing/unsigned%capp%" "../projects/%capp%/*" -mx%usrc%
IF errorlevel 1 (
ECHO "An Error Occured, Please Check The Log (option e)"
PAUSE
)

cd ..
goto restart
:ded
cd other
IF EXIST "%~dp0place-apk-here-for-signing\unsigned%capp%" (del /Q "%~dp0place-apk-here-for-signing\unsigned%capp%")
:temr
ECHO Drag the dependee apk in this window or type its path
ECHO Example to decompile Rosie.apk, drag com.htc.resources.apk in this window
set /P INPUT=Type input: %=%
java -jar apktool.jar IF %INPUT%
IF NOT EXIST "%userprofile%\apktool\framework\2.apk" (
ECHO.
ECHO "Sorry thats not the dependee apk, try again"
goto temr
)
IF (%jar%)==(0) (ECHO Decompiling Apk %decs%)
IF (%jar%)==(1) (ECHO Decompiling Jar %decs%)
IF (%dec%)==(0) (java -Xmx%heapy%m -jar apktool.jar d ../place-apk-here-for-modding/%capp% ../projects/%capp%)
IF (%dec%)==(1) (java -Xmx%heapy%m -jar apktool.jar d -r ../place-apk-here-for-modding/%capp% ../projects/%capp%)
IF (%dec%)==(2) (java -Xmx%heapy%m -jar apktool.jar d -s ../place-apk-here-for-modding/%capp% ../projects/%capp%)
IF (%dec%)==(3) (java -Xmx%heapy%m -jar apktool.jar d -r -s ../place-apk-here-for-modding/%capp% ../projects/%capp%)

IF errorlevel 1 (
ECHO "An Error Occured, Please Check The Log (option e)"
PAUSE
)
cd ..
goto restart
:de
cd other
IF EXIST "../place-apk-here-for-signing/system%capp%" (del /Q "../place-apk-here-for-signing\system%capp%")
IF EXIST "../place-apk-here-for-signing/unsigned%capp%" (del /Q "../place-apk-here-for-signing\unsigned%capp%")
IF EXIST "../place-apk-here-for-signing/signed%capp%" (del /Q "../place-apk-here-for-signing\signed%capp%")

IF EXIST "../projects/%capp%" (rmdir /S /Q "../projects/%capp%")
IF (%jar%)==(0) (ECHO Decompiling Apk %decs%)
IF (%jar%)==(1) (ECHO Decompiling Jar %decs%)
IF (%dec%)==(0) (java -Xmx%heapy%m -jar apktool.jar d ../place-apk-here-for-modding/%capp% ../projects/%capp%)
IF (%dec%)==(1) (java -Xmx%heapy%m -jar apktool.jar d -r ../place-apk-here-for-modding/%capp% ../projects/%capp%)
IF (%dec%)==(2) (java -Xmx%heapy%m -jar apktool.jar d -s ../place-apk-here-for-modding/%capp% ../projects/%capp%)
IF (%dec%)==(3) (java -Xmx%heapy%m -jar apktool.jar d -r -s ../place-apk-here-for-modding/%capp% ../projects/%capp%)

IF errorlevel 1 (
ECHO "An Error Occured, Please Check The Log (option e)"
PAUSE
)
cd ..
goto restart
:syscom
IF NOT EXIST "%~dp0projects\%capp%" GOTO dirnada
cd other
IF (%jar%)==(0) (ECHO Building Apk)
IF (%jar%)==(1) (ECHO Building Jar)
IF EXIST "%~dp0place-apk-here-for-signing\system%capp%" (del /Q "%~dp0place-apk-here-for-signing\system%capp%")
java -Xmx%heapy%m -jar apktool.jar b "../projects/%capp%" "%~dp0place-apk-here-for-signing\system%capp%"
IF (%jar%)==(0) (goto :nojar)
7za x -o"../projects/temp" "../place-apk-here-for-signing/%capp%" META-INF -r
7za a -tzip "../place-apk-here-for-signing/system%capp%" "../projects/temp/*" -mx%usrc% -r
rmdir /S /Q "../%~dp0projects/temp"
goto restart

:nojar
IF errorlevel 1 (
ECHO "An Error Occured, Please Check The Log (option e)"
PAUSE
goto restart
)
:nq1
ECHO Aside from the signatures, would you like to copy
ECHO over any additional files that you didn't modify
ECHO from the original apk in order to ensure least 
ECHO # of errors ^(y/n^)
set /P INPUT1=Type input: %=%
IF %INPUT1%==y (call :nq2)
IF %INPUT1%==n (call :nq3)
:nq2
rmdir /S /Q "%~dp0keep"
7za x -o"../keep" "../place-apk-here-for-modding/%capp%"
ECHO In the APK Multi-Tools folder u'll find
ECHO a keep folder. Within it, delete 
ECHO everything you have modified and leave
ECHO files that you haven't. IF you have modified
ECHO any xml, then delete resources.arsc from that 
ECHO folder as well. Once done then press enter 
ECHO on this script.
PAUSE
7za a -tzip "../place-apk-here-for-signing/system%capp%" "../keep/*" -mx%usrc% -r
rmdir /S /Q "%~dp0keep"
7za x -o"../projects/temp" "../place-apk-here-for-modding/%capp%" resources.arsc -r
7za a -tzip "../place-apk-here-for-signing/system%capp%" "../projects/temp/resources.arsc" -mx%resusrc% -r
rmdir /S /Q "%~dp0projects/temp"
cd ..
goto restart
:nq3
7za x -o"../projects/temp" "../place-apk-here-for-modding/%capp%" META-INF -r
7za a -tzip "../place-apk-here-for-signing/system%capp%" "../projects/temp/*" -mx%usrc% -r
rmdir /S /Q "%~dp0projects/temp"
goto restart

:nonsyscom
IF NOT EXIST "%~dp0projects\%capp%" GOTO dirnada
cd other
IF (%jar%)==(0) (ECHO Building Apk)
IF (%jar%)==(1) (ECHO Building Jar)
IF EXIST "%~dp0place-apk-here-for-signing\unsigned%capp%" (del /Q "%~dp0place-apk-here-for-signing\unsigned%capp%")
IF EXIST "%~dp0place-apk-here-for-signing\OriginalSignedKey%capp%" (del /Q "%~dp0place-apk-here-for-signing\OriginalSignedKey%capp%")
java -Xmx%heapy%m -jar apktool.jar b "../projects/%capp%" "%~dp0place-apk-here-for-signing\unsigned%capp%"
IF (%jar%)==(0) (goto :nojar2)
7za x -o"../projects/temp" "../place-apk-here-for-modding/%capp%" META-INF -r
7za a -tzip "../place-apk-here-for-signing/unsigned%capp%" "../projects/temp/*" -mx%usrc% -r
rmdir /S /Q "../%~dp0projects/temp"
goto restart

:nojar2
IF errorlevel 1 (
ECHO "An Error Occured, Please Check The Log (option e)"
PAUSE
goto restart
)
:nq4
CLS
ECHO  ---------------------------------------------------------------------------
ECHO  1. Create an unsigned apk using the keep folder option
ECHO  2. Create an unsigned apk
ECHO     *Notice* Options 3 and 4 are experimental use with care *Notice*
ECHO  3. Create an apk using the original Signature using the keep folder option
ECHO  4. Create an apk using the original Signature
ECHO     *Notice* Options 3 and 4 are experimental use with care *Notice*
ECHO  ---------------------------------------------------------------------------
set /P INPUT=Type input 1 - 4: %=%
IF %INPUT%==1 (call :nq5)
IF %INPUT%==2 (call :nq6)
IF %INPUT%==3 (call :nq7)
IF %INPUT%==4 (call :nq8)
:nq5
rmdir /S /Q "%~dp0keep"
7za x -o"../keep" "../place-apk-here-for-modding/%capp%"
rmdir /S /Q "%~dp0keep/META-INF/"
ECHO In the APK Multi-Tools folder u'll find
ECHO a keep folder. Within it, delete 
ECHO everything you have modified and leave
ECHO files that you haven't. IF you have modified
ECHO any xml, then delete resources.arsc from that 
ECHO folder as well. Once done then press enter 
ECHO on this script.
PAUSE
7za a -tzip "../place-apk-here-for-signing/unsigned%capp%" "../keep/*" -mx%usrc% -r
rmdir /S /Q "%~dp0keep"
7za x -o"../projects/temp" "../place-apk-here-for-signing/%capp%" resources.arsc -r
7za a -tzip "../place-apk-here-for-signing/unsigned%capp%" "../projects/temp/resources.arsc" -mx%resusrc% -r
rmdir /S /Q "%~dp0projects/temp"
cd ..
PAUSE
goto restart
:nq6
goto restart

:nq7
rmdir /S /Q "%~dp0keep"
7za x -o"../keep" "../place-apk-here-for-modding/%capp%"
ECHO In the APK Multi-Tools folder u'll find
ECHO a keep folder. Within it, delete 
ECHO everything you have modified and leave
ECHO files that you haven't. IF you have modified
ECHO any xml, then delete resources.arsc from that 
ECHO folder as well. Once done then press enter 
ECHO on this script.
PAUSE

7za a -tzip "../place-apk-here-for-signing/unsigned%capp%" "../keep/*" -mx%usrc% -r
rmdir /S /Q "%~dp0keep"
7za x -o"../projects/temp" "../place-apk-here-for-signing/%capp%" resources.arsc -r
7za a -tzip "../place-apk-here-for-signing/unsigned%capp%" "../projects/temp/resources.arsc" -mx%resusrc% -r
rmdir /S /Q "%~dp0projects/temp"
rename "../place-apk-here-for-signing/unsigned%capp%" "../place-apk-here-for-signing/OriginalSignedKey%capp%"
cd ..
PAUSE
goto restart
:nq8
7za x -o"../projects/temp" "../place-apk-here-for-modding/%capp%" META-INF -r
7za a -tzip "../place-apk-here-for-signing/unsigned%capp%" "../projects/temp/*" -mx%usrc% -r
rmdir /S /Q "%~dp0projects/temp"
rename "../place-apk-here-for-signing/unsigned%capp%" "../place-apk-here-for-signing/OriginalSignedKey%capp%"
cd ..
PAUSE
goto restart
:apksignerkey
cd other
ECHO Signing Apk
set KEYSTORE_FILE=apksigner.keystore
set KEYSTORE_PASS=apksigner
set KEYSTORE_ALIAS=apksigner.keystore
set JAVAC_PATH=%JAVA_HOME%\bin\
set PATH=%PATH%;%JAVAC_PATH%;
call jarsigner -keystore %KEYSTORE_FILE% -storepass %KEYSTORE_PASS% -keypass %KEYSTORE_PASS% -signedjar ../place-apk-here-for-signing/signed%capp% ../place-apk-here-for-signing/unsigned%capp%  %KEYSTORE_ALIAS% %1
IF errorlevel 1 (
ECHO "An Error Occured, Please Check The Log (option e)"
PAUSE
)

DEL /Q "../place-apk-here-for-signing/unsigned%capp%"
cd ..
goto restart
:stki
cd other
ECHO Signing Apk
java -Xmx%heapy%m -jar signapk.jar -w testkey.x509.pem testkey.pk8 ../place-apk-here-for-signing/unsigned%capp% ../place-apk-here-for-signing/signed%capp%
IF errorlevel 1 (
ECHO "An Error Occured, Please Check The Log (option e)"
PAUSE
)

DEL /Q "../place-apk-here-for-signing/unsigned%capp%"
cd ..
goto restart
:ins
ECHO Waiting for device
"%~dp0other\adb.exe" wait-for-device
ECHO Installing Apk
"%~dp0other\adb.exe" install -r place-apk-here-for-signing/signed%capp%
IF errorlevel 1 (
ECHO "An Error Occured, Please Check The Log (option e)"
PAUSE
)
goto restart
:all
IF NOT EXIST "%~dp0projects\%capp%" GOTO dirnada
cd other
ECHO Building Apk
IF EXIST "%~dp0place-apk-here-for-signing\unsigned%capp%" (del /Q "%~dp0place-apk-here-for-signing\unsigned%capp%")
java -Xmx%heapy%m -jar apktool.jar b "../projects/%capp%" "%~dp0place-apk-here-for-signing\unsigned%capp%"
IF errorlevel 1 (
ECHO "An Error Occured, Please Check The Log (option e)"
PAUSE
goto restart
)
ECHO Signing Apk
java -Xmx%heapy%m -jar signapk.jar -w testkey.x509.pem testkey.pk8 ../place-apk-here-for-signing/unsigned%capp% ../place-apk-here-for-signing/signed%capp%
IF errorlevel 1 (
ECHO "An Error Occured, Please Check The Log (option e)"
PAUSE
)
DEL /Q "../place-apk-here-for-signing/unsigned%capp%"
cd ..
ECHO Waiting for device
"%~dp0other\adb.exe" wait-for-device
ECHO Installing Apk
"%~dp0other\adb.exe" install -r place-apk-here-for-signing/signed%capp%
IF errorlevel 1 (
ECHO "An Error Occured, Please Check The Log (option e)"
PAUSE
)
goto restart
:errjava
CLS
ECHO Java was not found, you will not be able to sign apks or use apktool
PAUSE
goto restart
:erradb
CLS
ECHO Adb was not found, you will not be able to manipulate the files on your phone
PAUSE
goto restart
goto skipme2
:adbi
mode con:cols=48 lines=8
ECHO Waiting for device
"%~dp0other\adb.exe" wait-for-device
set count=0
:loop
IF "%~n1"=="" goto :endloop
ECHO Installing %~n1
"%~dp0other\adb.exe" install -r %1
shift
set /a count+=1
goto :loop
:endloop
goto quit

:recursive
for /f "tokens=%cc% delims=\" %%b in ('ECHO %info%') do (
ECHO %%b
set /a cc = %cc% + 1
goto recursive
)
ECHO.
goto recall
:DOTOME
start %~dp0docs\donate.html
cls	
goto restart
:logr
cd other
Start "Read The Log - Main script is still running, close this to return" signer 1
goto restart
:endab
cd ..
@ECHO Optimization complete for %~1
:sysset
start %~dp0other\Setup
goto restart
:quit
exit

:end
exit
