#include <iostream>
#include <process.h>
#include <time.h>
#include <windows.h>

using namespace std;
int main()
{
	for (int i = 0; i < 1000; i++)
	{
		Sleep(1000);
		cout << "PID: " << _getpid() << " - " << i << endl;
	}
	return 0;
}

// 1. Task Manager:				Диспетчер задач -> Подробности -> OS03_01.exe
// 2. Tasklist:					tasklist /FI "pid eq PID"
// 3. PowerShell ISE:			Get-Process OS03_01  (chcp 1251 для кодировки)
// 4. Performance Monitor:		Монитор ресурсов