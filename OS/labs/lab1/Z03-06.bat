@echo off
chcp 65001 > nul

set /a cnt = 0 
for %%a in (%*) do set /a cnt+=1
set ss=%~nx0

if %cnt%==0 (
  echo -- строка параметров:
  echo -- режим:
  echo -- имя файла: 
  echo ---+ %ss% режим файл
  echo ---++ режим = {создать, удалить}
  echo ---++ файл = имя файла
  goto :EOF
)

if %cnt%==1 (
  echo -- строка параметров: %1
  echo -- режим: %1
  echo -- имя файла: 
  echo --+ не задано имя файла
  goto :EOF
)
if %cnt%==2 (
  echo -- строка параметров: %1 %2
  echo -- режим: %1
  echo -- имя файла: %2
    if "%1" == "создать" (
	if Exist %2 (
	  echo ---+ файл %2 уже есть
	  goto :EOF
	) else (
	  copy NUL %2>NUL
          echo ---+ файл %2 создан
          goto :EOF
	)
    )
    if "%1" == "удалить" (
      if Exist %2 (
	del %2
        echo ---+ файл %2 удален
      ) else (
        echo ---+ файл %2 не найден
      )
      goto :EOF
    ) ELSE (
      echo --+ режим задан некорректно
      goto :EOF
    )
    

)