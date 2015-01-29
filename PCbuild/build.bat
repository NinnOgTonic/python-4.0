@echo off
rem A batch program to build or rebuild a particular configuration.
rem just for convenience.

setlocal
set platf=Win32
set conf=Release
set build=

:CheckOpts
if "%1"=="-c" (set conf=%2) & shift & shift & goto CheckOpts
if "%1"=="-p" (set platf=%2) & shift & shift & goto CheckOpts
if "%1"=="-r" (set build=/rebuild) & shift & goto CheckOpts
if "%1"=="-d" (set conf=Debug) & shift & goto CheckOpts

set cmd=vcbuild /useenv pcbuild.sln %build% "%conf%|%platf%"
echo %cmd%
%cmd%

