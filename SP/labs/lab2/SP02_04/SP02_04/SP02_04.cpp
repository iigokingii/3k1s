#include <iostream>
#include"SP02.h"
#include<stdexcept>
#pragma comment (lib,"./SP02_LIB")
using namespace std;
int main()
{
    try {
        SP2HANDEL h1 = SP02::Init();
        SP2HANDEL h2 = SP02::Init();
        std::cout << "OS12::Adder::Add(h1, 2, 3) = " << SP02::Adder::Add(h1, 2, 3) << "\n";
        std::cout << "OS12::Adder::Add(h2, 2, 3) = " << SP02::Adder::Add(h2, 2, 3) << "\n";

        std::cout << "OS12::Adder::Sub(h1, 2, 3) = " << SP02::Adder::Sub(h1, 2, 3) << "\n";
        std::cout << "OS12::Adder::Sub(h2, 2, 3) = " << SP02::Adder::Sub(h2, 2, 3) << "\n";

        std::cout << "OS12::Multiplier::Mul(h1, 2, 3) = " << SP02::Multiplier::Mul(h1, 2, 3) << "\n";
        std::cout << "OS12::Multiplier::Mul(h2, 2, 3) = " << SP02::Multiplier::Mul(h2, 2, 3) << "\n";

        std::cout << "OS12::Multiplier::Div(h1, 2, 3) = " << SP02::Multiplier::Div(h1, 2, 3) << "\n";
        std::cout << "OS12::Multiplier::Div(h2, 2, 3) = " << SP02::Multiplier::Div(h2, 2, 3) << "\n";
    }
    catch (int e) {
        cout << "SP02: error = " << e << endl;
    }
}
