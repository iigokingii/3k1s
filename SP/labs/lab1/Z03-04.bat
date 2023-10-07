@echo off
chcp 65001 > nul
echo строка параметров: %*
echo параметр 1: %1
echo параметр 2: %2
echo параметр 3: %3

set /a sum = %1+%2
set /a diff = %2-%1
set /a mult = %1*%2
set /a div = %3/%2
set /a diffMult = (%2-%1)*(%1-%2)

echo %1 + %2 = %sum%
echo %1 * %2 = %mult%
echo %3 / %2 = %div%
echo %2 - %1 = %diff%
echo (%2-%1)*(%1-%2) = %diffMult%