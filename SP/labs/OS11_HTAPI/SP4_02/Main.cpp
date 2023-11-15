#pragma warning(disable : 4996)
#include<iostream>
#include <string>
#include <sstream>
#include <conio.h>
#include "../OS11_HTAPI/pch.h"
#include "../OS11_HTAPI/HT.h"
#include"../OS11_HTAPI/Element.h"


//__declspec(dllimport) ht::Element * createInsertElement(const void*, int, const void*, int);
//__declspec(dllimport) BOOL ht::insert(HtHandle* htHandle,const ht::Element* element);

using namespace std;

string intToString(int number);

int main(int argc, char* argv[])
{
	try
	{
		HMODULE hmdll = LoadLibrary(L"D:/3k1s/SP/labs/OS11_HTAPI/x64/Debug/SP4_HTAPI.dll");
		if (!hmdll)
			throw "-- LoadLibrary failed";
		cout << "-- LoadLibrary success" << endl;

		auto insert = (BOOL(*)(ht::HtHandle*, const ht::Element*)) GetProcAddress(hmdll, "insert");
		auto createInsertElement = (ht::Element * (*)(const void*, int, const void*, int)) GetProcAddress(hmdll, "createInsertElement");
		auto open = (ht::HtHandle * (*)(const wchar_t*, bool)) GetProcAddress(hmdll, "open");
		ht::HtHandle* ht = open(L"D:/3k1s/SP/labs/OS11_HTAPI/HT/HTspace.ht", true);
		if (ht)
			cout << "-- open: success" << endl;
		else
			throw "-- open: error";
		while (!kbhit()) {
			
			int numberKey = rand() % 50;
			string key = intToString(numberKey);
			cout << "key: "<< key << endl;

			ht::Element* element = createInsertElement(key.c_str(), key.length() + 1, "0", 2);
			if (insert(ht, element))
				cout << "-- insert: success" << endl;
			else
				cout << "-- insert: error" << endl;

			delete element;

			Sleep(1000);
		}
		FreeLibrary(hmdll);
	}
	catch (const char* msg)
	{
		cout << msg << endl;
	}
}

string intToString(int number)
{
	stringstream convert;
	convert << number;
	return convert.str();
}
