#pragma once
#include<iostream>
#include"Interface.h"

extern long g_lObjs;
extern long g_lLocks;

class ImplClass :public IAdder, public IMultiplier {
private:
	volatile ULONG m_lRef;
public:
	ImplClass();
	~ImplClass();

	STDMETHOD(QueryInterface(REFIID riid, void** ppv));
	STDMETHOD_(ULONG, AddRef(void));
	STDMETHOD_(ULONG, Release(void));

	HRESULT _stdcall Add(const double x, const double y, double& z);
	HRESULT _stdcall Sub(const double x, const double y, double& z);
	HRESULT _stdcall Mul(const double x, const double y, double& z);
	HRESULT _stdcall Div(const double x, const double y, double& z);
};



