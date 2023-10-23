#include "HT.h"

using namespace std;

int main()
{
	ht::HtHandle* ht = nullptr;
	try
	{
		ht = ht::create(1000, 2, 16, 256, L"D:/3k1s/SP/labs/lab3/HT/HTspace.ht");
		if (ht)
			cout << "-- create: success" << endl;
		else
			throw "-- create: error";

		if (ht::insert(ht, new ht::Element("test", 5, "testdata", 9)))
			cout << "-- insert: success" << endl;
		else
			throw "-- insert: error";

		ht::Element* hte = ht::get(ht, new ht::Element("test", 5));
		if (hte)
			cout << "-- get: success" << endl;
		else
			throw "-- get: error";

		ht::print(hte);

		if (ht::update(ht, hte, "newTestData", 12))
			cout << "-- update: success" << endl;
		else
			throw "-- update: error";

		if (ht::snap(ht))
			cout << "-- snapSync: success" << endl;
		else
			throw "-- snap: error";

		hte = ht::get(ht, new ht::Element("test", 5));
		if (hte)
			cout << "-- get: success" << endl;
		else
			throw "-- get: error";

		ht::print(hte);

		SleepEx(3000, TRUE);

		if (ht::remove(ht, hte))
			cout << "-- remove: success" << endl;
		else
			throw "-- remove: error";

		hte = ht::get(ht, new ht::Element("test", 5));
		if (hte)
			cout << "-- get: success" << endl;
		else
			throw "-- get: error";
	}
	catch (const char* msg)
	{
		cout << msg << endl;

		if (ht != nullptr)
			cout << ht::getLastError(ht) << endl;
	}

	try
	{
		if (ht != nullptr)
			if (ht::close(ht))
				cout << "-- close: success" << endl;
			else
				throw "-- close: error";
	}
	catch (const char* msg)
	{
		cout << msg << endl;
	}
}