@echo off
cls
echo ###########################################################
echo ##                                                       ##
echo ##              #### Nikhil Sharma #####                 ##
echo ##                                                       ##
echo ###########################################################
echo Choose: 
echo [1] Invacare
echo [2] Birlasoft 
echo [3] Reset Proxy
:choice 
SET /P C=[Please enter a number]? 
for %%? in (1) do if /I "%C%"=="%%?" goto 1 
for %%? in (2) do if /I "%C%"=="%%?" goto 2 
for %%? in (3) do if /I "%C%"=="%%?" goto 3


:1 
@ECHO OFF 
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /t REG_SZ /d 10.10.220.251:8080 /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOveride /t REG_DWORD /d 0 /f

goto end

:2
@ECHO OFF 
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v AutoConfigURL /t REG_SZ /d "http://mhppac.kpit.com/PacSrv/hinjewadi.pac" /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /t REG_SZ /d 10.221.16.246:80 /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOveride /t REG_DWORD /d 0 /f

goto end

:3
@ECHO OFF
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v AutoConfigURL /t REG_SZ /d "" /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /t REG_SZ /d "0:80" /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOveride /t REG_DWORD /d 0 /f

goto end

:end
