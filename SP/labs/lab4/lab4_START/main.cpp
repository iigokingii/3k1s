#ifdef _WIN64
#pragma comment(lib, "../x64/debug/SP4_HTCOM_LIB.lib")
#endif
#pragma warning(disable : 4996)
#include<iostream>
#include "SP4_HTCOM_LIB.h"
#include <conio.h>
#include <windows.h>

using namespace std;

wchar_t* getWC(const char* c);
wchar_t* GetFileNameFromPath(const char* filePath);

int main(int argc, char* argv[])
{
	void* h = SP4_HTCOM::init();
	ht::HtHandle* ht = nullptr;
	// lab4_START.exe HTUser01 1111 D:/3k1s/SP/labs/lab4/HT/HTspace.ht
	
	if (argc == 4) {
		/*wchar_t* fileName = getWC("D:/3k1s/SP/labs/lab4/HT/HTspace.ht");
		wchar_t* userName = getWC("HTUser01");
		wchar_t* password = getWC("1111");*/
		wchar_t* fileName = getWC(argv[3]);
		wchar_t* userName = getWC(argv[1]);
		wchar_t* password = getWC(argv[2]);
		HANDLE closeEvent = CreateEvent(NULL, TRUE, FALSE, GetFileNameFromPath(argv[3]));
		ht = SP4_HTCOM::HT::open(h,fileName,userName,password);
		if (ht)
		{
			cout << "==============================================" << endl;
			cout << "filename:\t\t" << ht->fileName << endl;
			cout << "secSnapshotInterval:\t" << ht->secSnapshotInterval << endl;
			cout << "capacity:\t\t" << ht->capacity << endl;
			cout << "maxKeyLength:\t\t" << ht->maxKeyLength << endl;
			cout << "maxPayloadLength:\t" << ht->maxPayloadLength << endl << endl;
			cout << "==============================================" << endl;
			while (WaitForSingleObject(closeEvent,0)==WAIT_TIMEOUT)
				SleepEx(0, TRUE);
			SP4_HTCOM::HT::snap(h,ht);
			SP4_HTCOM::HT::close(h,ht);
		}
		else
			cout << "-- open: error" << endl;
		SP4_HTCOM::dispose(h);
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

wchar_t* GetFileNameFromPath(const char* filePath) {
	const char* lastSlash = strrchr(filePath, '/');
	const char* lastBackslash = strrchr(filePath, '\\');
	const char* lastSeparator = (lastSlash > lastBackslash) ? lastSlash : lastBackslash;
	if (lastSeparator != nullptr) {
		return getWC(lastSeparator+1);
	}
	return getWC(filePath);
}