// SP02_LIB.cpp : Определяет функции для статической библиотеки.
#include "pch.h"
#include "framework.h"
#include "SP02.h"
#include "Interface.h"
#include<iostream>
#include<objbase.h>
#include<stdexcept>
using namespace std;
// TODO: Это пример библиотечной функции.
SP2HANDEL SP02::Init() {
	IUnknown* pIUnknown = NULL;
	try {
		if (!SUCCEEDED(CoInitialize(NULL))) {
			throw runtime_error("INITIALIZING OF OLE32");
		}
		if (!SUCCEEDED(CoCreateInstance(CLSID_SP, NULL, CLSCTX_INPROC_SERVER, IID_IUnknown, (void**)&pIUnknown))) {
			throw runtime_error("CREATING OF CLSID_SP'S INSTANCE");
		}
		return pIUnknown;
	}
	catch (runtime_error err) {
		cout << "#INIT ERROR: " << err.what() << "\n";
	}
}

double SP02::Adder::Add(SP2HANDEL h, double x, double y) {
	try {
		if (!SUCCEEDED(((IUnknown*)h)->QueryInterface(IID_Adder, (void**)&h))) {
			throw runtime_error("CAN'T GET INTERFACE BY IID_Adder");
		}
		double z = 0.0;
		if (!SUCCEEDED(((IAdder*)h)->Add(x, y, z))) {
			throw runtime_error("IADDER FUNCTION ADD");
		}
		return z;
	}
	catch (runtime_error err) {
		cout << "#ADD ERROR: " << err.what() << "\n";
	}
}

double SP02::Adder::Sub(SP2HANDEL h, double x, double y) {
	try {
		if (!SUCCEEDED(((IUnknown*)h)->QueryInterface(IID_Adder, (void**)&h))) {
			throw runtime_error("CAN'T GET INTERFACE BY IID_Adder");
		}
		double z = 0.0;
		if (!SUCCEEDED(((IAdder*)h)->Sub(x, y, z))) {
			throw runtime_error("IADDER FUNCTION SUB");
		}
		return z;
	}
	catch (runtime_error err) {
		cout << "#SUB ERROR: " << err.what() << "\n";
	}
}
double SP02::Multiplier::Div(SP2HANDEL h, double x, double y) {
	try {
		if (!SUCCEEDED(((IUnknown*)h)->QueryInterface(IID_Multiplier, (void**)&h))) {
			throw runtime_error("CAN'T GET INTERFACE BY IID_Multiplier");
		}
		if (y == 0)
			throw std::runtime_error("SECOND PARAM CANT BE A 0 (DIVIDE BY 0 EXCEPTION)");
		double z = 0.0;
		if (!SUCCEEDED(((IMultiplier*)h)->Div(x, y, z))) {
			throw runtime_error("IMultiplier FUNCTION SUB");
		}
		return z;
	}
	catch (runtime_error err) {
		cout << "#DIV ERROR: " << err.what() << "\n";
	}
}
double SP02::Multiplier::Mul(SP2HANDEL h, double x, double y) {
	try {
		if (!SUCCEEDED(((IUnknown*)h)->QueryInterface(IID_Multiplier, (void**)&h))) {
			throw runtime_error("CAN'T GET INTERFACE BY IID_Multiplier");
		}
		double z = 0.0;
		if (!SUCCEEDED(((IMultiplier*)h)->Mul(x, y, z))) {
			throw runtime_error("IMultiplier FUNCTION MUL");
		}
		return z;
	}
	catch (runtime_error err) {
		cout << "#Mul ERROR: " << err.what() << "\n";
	}
}

void SP02::Disponse(SP2HANDEL h) {
	((IUnknown*)h)->Release();
	CoFreeUnusedLibraries();
}
