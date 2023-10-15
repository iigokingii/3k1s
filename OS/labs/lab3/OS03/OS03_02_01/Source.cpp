#include <iostream>
#include <process.h>
#include <time.h>
#include <windows.h>

using namespace std;
int main()
{
	for (int i = 0; i < 125; i++)
	{
		Sleep(2000);
		cout << "PID: " << _getpid() << " - " << i << endl;
	}
	return 0;
}