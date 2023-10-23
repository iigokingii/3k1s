#include "TestCase.h"

using namespace std;

int main()
{
	ht::HtHandle* ht = nullptr;
	ht = tests::test0();
	if (ht != nullptr) {
		tests::test1(ht);
		tests::test2(ht);
		tests::test4(ht);
		ht::close(ht);
	}
}