#pragma warning(disable : 4996)

#include <iostream>
#include <windows.h>
#include <string>
#include <sstream>
#include"SP4_HTCOM_LIB.h"

#ifdef _WIN64
#pragma comment(lib, "../x64/Debug/SP4_HTCOM_LIB.lib")
#else
#pragma comment(lib, "../Debug/SP4_HTCOM_LIB.lib")
#endif

using namespace std;

string intToString(int number);
wchar_t* getWC(const char* c);

int main(int argc, char* argv[])
{
	HANDLE hStopEvent = CreateEvent(NULL,TRUE,FALSE,L"Stop");
	setlocale(LC_ALL, "Russian");
	//lab4_03.exe HTUser01 1111 D:/3k1s/SP/labs/lab4/HT/HTspace.ht
	try
	{
		if (argc == 4) {
			void* h = SP4_HTCOM::init();

			//ht::HtHandle* ht = SP4_HTCOM::HT::open(h, getWC(argv[1]), true);
			wchar_t* fileName = getWC(argv[3]);
			wchar_t* userName = getWC(argv[1]);
			wchar_t* password = getWC(argv[2]);
			ht::HtHandle* ht = SP4_HTCOM::HT::open(h, fileName, userName, password, true);

			if (ht)
				cout << "-- open: success" << endl;
			else
				throw "-- open: error";

			while (WaitForSingleObject(hStopEvent, 0) == WAIT_TIMEOUT) {
				int numberKey = rand() % 50;
				string key = intToString(numberKey);
				cout << key << endl;

				ht::Element* element = SP4_HTCOM::Element::CreateElementForGetFunction(h, key.c_str(), key.length() + 1);
				if (SP4_HTCOM::HT::removeOne(h, ht, element))
					cout << "-- remove: success" << endl;
				else
					cout << "-- remove: error" << endl;

				delete element;

				Sleep(1000);
			}

			SP4_HTCOM::HT::close(h, ht);

			SP4_HTCOM::dispose(h);
		}
		else {
			cout << "Enter parameters\n";
			return 0;
		}
	}
	catch (const char* e) { cout << e << endl; }
	catch (int e) { cout << "HRESULT: " << e << endl; }

}

string intToString(int number)
{
	stringstream convert;
	convert << number;

	return convert.str();
}
wchar_t* getWC(const char* c)
{
	wchar_t* wc = new wchar_t[strlen(c) + 1];
	mbstowcs(wc, c, strlen(c) + 1);

	return wc;
}