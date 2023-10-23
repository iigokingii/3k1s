#include"HT.h"

using namespace std;

int main()
{
	ht::HtHandle* ht1 = nullptr;
	ht::HtHandle* ht2 = nullptr;


	//htHandle1 
	try
	{
		cout << "=== htHandle1 ===" << endl;
		ht1 = ht::create(300, 2, 14, 256, L"D:/3k1s/SP/labs/lab3/HT/HTspace.ht");
		if (ht1)
			cout << "-- create: success" << endl;
		else
			throw "-- create: error";

		cout << "ht1: " << ht1->addr << endl;

		if (ht::insert(ht1, new ht::Element("testttt", 8, "textData", 9)))
			cout << "-- insert: success" << endl;
		else
			throw "-- insert: error";
	}
	catch (const char* msg)
	{
		cout << msg << endl;

		if (ht1 != nullptr)
			cout << ht::getLastError(ht1) << endl;
	}


	//htHandle1 
	try
	{
		cout << "\n=== htHandle2 ===" << endl;
		ht2 = ht::open(L"D:/3k1s/SP/labs/lab3/HT/HTspace.ht", true);
		if (ht2)
			cout << "-- create: success" << endl;
		else
			throw "-- create: error";

		cout << "ht2: " << ht2->addr << endl;

		ht::Element* hte = ht::get(ht1, new ht::Element("testttt", 8));
		if (hte)
			cout << "-- get: success" << endl;
		else
			throw "-- get: error";

		ht::print(hte);
	}
	catch (const char* msg)
	{
		cout << msg << endl;

		if (ht1 != nullptr)
			cout << ht::getLastError(ht1) << endl;
	}



	try
	{
		if (ht1 != nullptr)
			if (ht::close(ht1))
				cout << "-- close: success (ht1)" << endl;
			else
				throw "-- close: error (ht1)";

		if (ht2 != nullptr)
			if (ht::close(ht2))
				cout << "-- close: success (ht2)" << endl;
			else
				throw "-- close: error (ht2)";
	}
	catch (const char* msg)
	{
		cout << msg << endl;
	}
}