#ifdef _WIN64
#pragma comment(lib, "../x64/debug/SP4_HTAPI.lib")
#endif

#pragma warning(disable : 4996)

#include <conio.h>
#include<iostream>
#include "../OS11_HTAPI/pch.h"
#include "../OS11_HTAPI/HT.h"

using namespace std;

wchar_t* getWC(const char* c);

int main(int argc, char* argv[])
{
	ht::HtHandle* ht = nullptr;
	// SP4_START.exe D:/3k1s/SP/labs/OS11_HTAPI/HT/HTspace.ht
	if (argc > 1) {
		wchar_t* fileName = getWC(argv[1]);
		ht = ht::open(fileName);
		if (ht)
		{
			cout << "==============  HT-Storage Start  ==============" << endl;
			cout << "filename:\t\t" << ht->fileName << endl;
			cout << "secSnapshotInterval:\t" << ht->secSnapshotInterval << endl;
			cout << "capacity:\t\t" << ht->capacity << endl;
			cout << "maxKeyLength:\t\t" << ht->maxKeyLength << endl;
			cout << "maxPayloadLength:\t" << ht->maxPayloadLength << endl << endl;

			while (!kbhit())
				SleepEx(0, TRUE);

			ht::close(ht);
		}
		else
			cout << "-- open: error" << endl;
	}
	else {
		cout << "Enter parameters\n";
		return 0;
	}
	
}

wchar_t* getWC(const char* c)
{
	wchar_t* wc = new wchar_t[strlen(c) + 1];
	mbstowcs(wc, c, strlen(c) + 1);

	return wc;
}
