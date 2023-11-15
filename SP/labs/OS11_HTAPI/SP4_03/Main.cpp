#ifdef _WIN64
#pragma comment(lib, "D:/3k1s/SP/labs/OS11_HTAPI/x64/Debug/SP4_HTAPI.lib")
#endif
#pragma warning(disable : 4996)

#include <string>
#include <conio.h>
#include <sstream>
#include "../OS11_HTAPI/pch.h"
#include "../OS11_HTAPI/HT.h"
#include<iostream>

using namespace std;

string intToString(int number);

int main(int argc, char* argv[])
{
	try
	{
		ht::HtHandle* ht = ht::open(L"D:/3k1s/SP/labs/OS11_HTAPI/HT/HTspace.ht", true);
		if (ht)
			cout << "-- open: success" << endl;
		else
			throw "-- open: error";
		while (!kbhit()) {
			

			int numberKey = rand() % 50;
			string key = intToString(numberKey);
			cout << key << endl;

			ht::Element* element = new ht::Element(key.c_str(), key.length() + 1);
			if (ht::removeOne(ht, element))
				cout << "-- remove: success" << endl;
			else
				cout << "-- remove: error" << endl;

			delete element;

			Sleep(1000);
		}
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
