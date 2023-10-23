#include "TestCase.h"
using namespace std;

namespace tests
{
	ht::HtHandle* test0() {
		ht::HtHandle* ht = nullptr;
		try {
			//ht = ht::create(1000, 3, 10, 256, L"D:/3k1s/SP/labs/lab3/sss/HTspace.ht");
			ht = ht::create(1000, 3, 10, 256, L"D:/3k1s/SP/labs/lab3/HT/HTspace.ht");
			cout << "test0: failed" << endl;
			return ht;
		}
		catch (const char* msg)
		{
			if (!strcmp(msg, "create or open file failed"))
				cout << "test0: success" << endl;
			return nullptr;
		}
	}
	BOOL test1(ht::HtHandle* htHandle)
	{
		ht::Element* insertEl = new ht::Element("test1ssssss", 12, "test1", 6);

		ht::insert(htHandle, insertEl);
		ht::Element* getEl = ht::get(htHandle, new ht::Element("test1ssssss", 12));

		if (strcmp(htHandle->lastErrorMessage, "-- not found element (GET)")) {
			cout << "test1:success\n";
			return true;
		}
		cout << "test1: failed\n";
		return false;
	}

	BOOL test2(ht::HtHandle* htHandle)
	{
		ht::Element* element = new ht::Element("test2", 6, "test2", 6);
		ht::insert(htHandle, element);
		ht::removeOne(htHandle, element);
		if (strcmp(htHandle->lastErrorMessage, "-- not found element (DELETE)")) {
			cout << "test2:success\n";
			return true;
		}
		cout << "test2:failed\n";
		return false;
	}

	BOOL test4(ht::HtHandle* htHandle)
	{
		ht::Element* element = new ht::Element("test3", 6, "test3", 6);

		ht::insert(htHandle, element);
		ht::removeOne(htHandle, element);
		ht::removeOne(htHandle, element);
		if (strcmp(htHandle->lastErrorMessage, "-- not found element (DELETE)")) {
			cout << "test4:success\n";
			return true;
		}
		cout << "test4:failed\n";
		return false;
	}
}