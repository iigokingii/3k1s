#pragma warning(disable : 4996)
#include <windows.h>
#include<iostream>
wchar_t* getWC(const char* c);
using namespace std;

int main()
{
	char path[512];
	HANDLE hStopEvent;
	int answer;
	bool exit = false;
	while (!exit) {
		cout << "1 - Close Start;\n2 - Close programm ;\n";
		cin >> answer;
		switch (answer)
		{
		case 1: {
			cout << "Write filename of HT:\n";
			cin >> path;
			hStopEvent = CreateEvent(NULL, TRUE, FALSE, getWC(path));
			SetEvent(hStopEvent);
			break;
		}
		case 2: {
			exit = true;
			hStopEvent = CreateEvent(NULL, TRUE, FALSE, L"Stop");
			SetEvent(hStopEvent);
			break;
		}
		default:
			cout << "Unknown command.\n";
			break;
		}
	}
}

wchar_t* getWC(const char* c)
{
	wchar_t* wc = new wchar_t[strlen(c) + 1];
	mbstowcs(wc, c, strlen(c) + 1);

	return wc;
}
