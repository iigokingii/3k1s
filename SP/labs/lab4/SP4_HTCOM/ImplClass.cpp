#include"pch.h"
#include"ImplClass.h"

#ifdef _WIN64
#pragma comment(lib, "../../lab3/x64/Debug/SP03_HTAPI.lib")
#else
#pragma comment(lib, "../../lab3/Debug/SP03_HTAPI.lib")
#endif


long g_lObjs = 0;
long g_lLocks = 0;

ImplClass::ImplClass()
{
	m_lRef = 1;
	InterlockedIncrement(&g_lObjs);
};

ImplClass::~ImplClass()
{
	InterlockedDecrement(&g_lObjs);
}

HRESULT STDMETHODCALLTYPE ImplClass::QueryInterface(REFIID riid, void** ppv)
{
	HRESULT rc = S_OK;
	if (riid == IID_IUnknown || riid == IID_Ht)
		*ppv = (IHt*)this;
	else if (riid == IID_HtElement)
		*ppv = (IHtElement*)this;
	else
		rc = E_NOINTERFACE;
	if (rc == S_OK)
		AddRef();
	return rc;
};

STDMETHODIMP_(ULONG) ImplClass::AddRef()
{
	InterlockedIncrement(&m_lRef);
	return m_lRef;
};

STDMETHODIMP_(ULONG) ImplClass::Release()
{
	InterlockedDecrement(&m_lRef);
	if (m_lRef == 0)
	{
		delete this;
		return 0;
	}
	else
		return m_lRef;
};

//HRESULT _stdcall ImplClass::Add(const double x, const double y, double& z) {
//	z = x + y;
//	return S_OK;
//}
//
//HRESULT _stdcall ImplClass::Sub(const double x, const double y, double& z) {
//	z = x - y;
//	return S_OK;
//}
//
//HRESULT _stdcall ImplClass::Mul(const double x, const double y, double& z) {
//	z = x * y;
//	return S_OK;
//}
//
//HRESULT _stdcall ImplClass::Div(const double x, const double y, double& z) {
//	z = x / y;
//	return S_OK;
//}




HRESULT STDMETHODCALLTYPE ImplClass::openAuth(ht::HtHandle** htHandle, const wchar_t* fileName, const wchar_t* htUser, const wchar_t* htPassword, bool isMapFile)
{
	*htHandle = ht::open(fileName, htUser, htPassword, isMapFile);
	return S_OK;
}

HRESULT STDMETHODCALLTYPE ImplClass::create(ht::HtHandle** htHandle, int capacity, int secSnapshotInterval, int maxKeyLength, int maxPayloadLength, const wchar_t* htUsersGroup, const wchar_t* fileName)
{
	*htHandle = ht::create(capacity, secSnapshotInterval, maxKeyLength, maxPayloadLength, htUsersGroup, fileName);
	return S_OK;
}






//HRESULT STDMETHODCALLTYPE ImplClass::create(ht::HtHandle** htHandle, int capacity, int secSnapshotInterval, int maxKeyLength, int maxPayloadLength, const wchar_t* fileName) {
//	*htHandle = ht::create(capacity, secSnapshotInterval, maxKeyLength, maxPayloadLength, fileName,L"wss");
//	return S_OK;
//};
HRESULT STDMETHODCALLTYPE ImplClass::open(ht::HtHandle** htHandle, const wchar_t* fileName, bool isMapFile) {
	*htHandle = ht::open(fileName, isMapFile);
	return S_OK;
}
HRESULT STDMETHODCALLTYPE ImplClass::snap(BOOL& rc, ht::HtHandle* htHandle) {
	rc = ht::snap(htHandle);
	return S_OK;
}
HRESULT STDMETHODCALLTYPE ImplClass::close(BOOL& rc, ht::HtHandle* htHandle) {
	rc = ht::close(htHandle);
	return S_OK;
}
HRESULT STDMETHODCALLTYPE ImplClass::insert(BOOL& rc, ht::HtHandle* htHandle, const ht::Element* element) {
	rc = ht::insert(htHandle, element);
	return S_OK;
}
HRESULT STDMETHODCALLTYPE ImplClass::removeOne(BOOL& rc, ht::HtHandle* htHandle, const ht::Element* element) {
	rc = ht::removeOne(htHandle, element);
	return S_OK;
}
HRESULT STDMETHODCALLTYPE ImplClass::get(ht::Element** rcElement, ht::HtHandle* htHandle, const ht::Element* element) {
	*rcElement = ht::get(htHandle, element);
	return S_OK;
}
HRESULT STDMETHODCALLTYPE ImplClass::update(BOOL& rc, ht::HtHandle* htHandle, const ht::Element* oldElement, const void* newPayload, int newPayloadLength) {
	rc = ht::update(htHandle, oldElement, newPayload, newPayloadLength);
	return S_OK;
}
HRESULT STDMETHODCALLTYPE ImplClass::getLastError(const char** lastError, ht::HtHandle* htHandle) {
	*lastError = ht::getLastError(htHandle);
	return S_OK;
}
HRESULT STDMETHODCALLTYPE ImplClass::print(const ht::Element* element) {
	ht::print(element);
	return S_OK;
}
HRESULT STDMETHODCALLTYPE ImplClass::CreateElementForGetFunction(ht::Element** getElement, const void* key, int keyLength) {
	*getElement = new ht::Element(key, keyLength);
	return S_OK;
}
HRESULT STDMETHODCALLTYPE ImplClass::CreateElementForInsertFunction(ht::Element** newElement, const void* key, int keyLength, const void* payload, int  payloadLength) {
	*newElement = new ht::Element(key, keyLength);
	return S_OK;
}
HRESULT STDMETHODCALLTYPE ImplClass::CreateElementForUpdateFunction(ht::Element** updateElement, const ht::Element* oldElement, const void* newPayload, int  newPayloadLength) {
	*updateElement = new ht::Element(oldElement, newPayload, newPayloadLength);
	return S_OK;
}

