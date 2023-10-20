#include "TestCase.h"

using namespace std;

int main()
{
	ht::HtHandle* ht = nullptr;
	
	try {
		ht = tests::test0();
		if (ht!=nullptr) {
			cout << "-- test0: success" << endl;
			if (tests::test1(ht))
				cout << "-- test1: success" << endl;
			else
				cout << "-- test1: error" << endl;

			if (tests::test2(ht))
				cout << "-- test2: success" << endl;
			else
				cout << "-- test2: error" << endl;

			if (tests::test3(ht))
				cout << "-- test3: success" << endl;
			else
				cout << "-- test3: error" << endl;

			if (tests::test4(ht))
				cout << "-- test4: success" << endl;
			else
				cout << "-- test4: error" << endl;

			if (ht != nullptr)
				if (ht::close(ht))
					cout << "-- close: success" << endl;
				else
					throw "-- close: error";
		}
			
		else
			cout << "-- test0: error" << endl;
		
	}
	catch (const char* msg)
	{
		cout << msg << endl;

		if (ht != nullptr)
			cout << ht::getLastError(ht) << endl;
	}
}