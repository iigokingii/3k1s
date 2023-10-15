#include <iostream>
#include <process.h>
#include <time.h>
#include <windows.h>

using namespace std;
int main()
{
	for (int i = 0; i < 50; i++)
	{
		Sleep(1000);
		cout << "PID: " << _getpid() << " - " << i << endl;
	}
	return 0;
}