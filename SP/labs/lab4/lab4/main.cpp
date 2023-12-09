#ifdef _WIN64
	#pragma comment(lib, "../x64/debug/SP4_HTCOM_LIB.lib")
#endif
#pragma warning(disable : 4996)
#include<iostream>
#include "SP4_HTCOM_LIB.h"

using namespace std;

wchar_t* getWC(const char* c);

int main(int argc, char* argv[])
{
	void* h = SP4_HTCOM::init();
	if (argc == 7) {
		
		//lab4_CREATE.exe 2000 3 4 4 HT D:/3k1s/SP/labs/lab4/HT/HTspace.ht
		ht::HtHandle*ht = SP4_HTCOM::HT::create(h,atoi(argv[1]), atoi(argv[2]), atoi(argv[3]), atoi(argv[4]),getWC(argv[5]), getWC(argv[6]));
		if (ht)
		{
			cout << "HT-Storage Created" << endl;
			cout << "filename: " << ht->fileName << endl;
			cout << "secSnapshotInterval: " << ht->secSnapshotInterval << endl;
			cout << "capacity: " << ht->capacity << endl;
			cout << "maxKeyLength: " << ht->maxKeyLength << endl;
			cout << "maxPayloadLength: " << ht->maxPayloadLength << endl;
			SP4_HTCOM::HT::close(h,ht);
		}
		else
			cout << "-- create: error" << endl;
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
