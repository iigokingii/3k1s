#ifdef _WIN64
	#pragma comment(lib, "../x64/debug/SP4_HTAPI.lib")
#endif

#include "../OS11_HTAPI/pch.h"
#include "../OS11_HTAPI/HT.h"
#pragma warning(disable : 4996)
#include<iostream>

using namespace std;

wchar_t* getWC(const char* c);

int main(int argc, char* argv[])
{
	if (argc > 5) {
		ht::HtHandle* ht = nullptr;
		//SP4_CREATE.exe 2000 3 4 4 D:/3k1s/SP/labs/OS11_HTAPI/HT/HTspace.ht
		ht = ht::create(atoi(argv[1]), atoi(argv[2]), atoi(argv[3]), atoi(argv[4]), getWC(argv[5]));
		if (ht)
		{
			cout << "HT-Storage Created" << endl;
			cout << "filename: " << ht->fileName << endl;
			cout << "secSnapshotInterval: " << ht->secSnapshotInterval << endl;
			cout << "capacity: " << ht->capacity << endl;
			cout << "maxKeyLength: " << ht->maxKeyLength << endl;
			cout << "maxPayloadLength: " << ht->maxPayloadLength << endl;
			ht::close(ht);
		}
		else
			cout << "-- create: error" << endl;
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
