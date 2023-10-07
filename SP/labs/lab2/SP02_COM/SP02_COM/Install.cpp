#include"pch.h"
#include"COM.h"
#include"SEGLOG.h"
#include"Registry.h"
extern HMODULE hmodule;
STDAPI DllInstall(BOOL b,PCWSTR s) {
	SEQ;
	LOG("DllInstall ", (b) ? "install" : "uninstall");

	return S_OK;
}
STDAPI DllRegisterServer() {
	SEQ;
	LOG("DllRegisterServer ",hmodule);
	HRESULT rc = RegisterServer(hmodule, CLSID_SP, FNAME, VINDX, PRGID);
	LOG("DllRegisterServer rc = ", rc);
	return S_OK;
}
STDAPI DllUnregisterServer() {
	SEQ;
	LOG("DllUnregisterServer ", hmodule);
	HRESULT rc = UnregisterServer(CLSID_SP, VINDX, PRGID);
	LOG("DllUnregisterServer rc = ", rc);
	return S_OK;
}
