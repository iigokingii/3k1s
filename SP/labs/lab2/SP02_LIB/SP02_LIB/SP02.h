#pragma once
#define SP2HANDEL void*
namespace SP02 {
	SP2HANDEL Init();
	namespace Adder {
		double Add(SP2HANDEL h, double x, double y);
		double Sub(SP2HANDEL h, double x, double y);
	}
	namespace Multiplier {
		double Mul(SP2HANDEL h, double x, double y);
		double Div(SP2HANDEL h, double x, double y);
	}
	void Disponse(SP2HANDEL h);
}