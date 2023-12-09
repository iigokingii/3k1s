// SP4_HTCOM_LIB.cpp : Определяет функции для статической библиотеки.
#include "pch.h"
#include "framework.h"
#include "SP4_HTCOM_LIB.h"

IHt* pIHT = nullptr;
IHtElement* pIElement = nullptr;

//init disponse com
void* SP4_HTCOM::init() {
	IUnknown* pIUnknown = NULL;
	CoInitialize(NULL);                        // инициализация библиотеки OLE32
	HRESULT hr0 = CoCreateInstance(CLSID_SP, NULL, CLSCTX_INPROC_SERVER, IID_IUnknown, (void**)&pIUnknown);
	if (SUCCEEDED(hr0))
	{
		return pIUnknown;
	}
	else {
		throw (int)hr0;
		return NULL;
	}
}

void SP4_HTCOM::dispose(void* h) {
	((IUnknown*)h)->Release();
	CoFreeUnusedLibraries();
	CoUninitialize();
}











//ht inteface 
//ht::HtHandle* SP4_HTCOM::HT::create(void * h, int capacity, int secSnapshotInterval, int maxKeyLength, int maxPayloadLength, const wchar_t* fileName)
//{
//	ht::HtHandle** ht = new ht::HtHandle*;
//
//	HRESULT hr0 = ((IUnknown*)h)->QueryInterface(IID_Ht, (void**)&pIHT);
//	if (SUCCEEDED(hr0))
//	{
//		HRESULT hr1 = pIHT->create(ht, capacity, secSnapshotInterval, maxKeyLength, maxPayloadLength, fileName);
//		if (!SUCCEEDED(hr1)) {
//			pIHT->Release();
//			throw (int)hr1;
//			return nullptr;
//		}
//		else {
//			pIHT->Release();
//			return *ht;
//		}
//	}
//	else {
//
//		throw (int)hr0;
//		return nullptr;
//	}
//}

ht::HtHandle* SP4_HTCOM::HT::create(void* h, int capacity, int secSnapshotInterval, int maxKeyLength, int maxPayloadLength, const wchar_t* htUsersGroup, const wchar_t* fileName)
{
	ht::HtHandle** ht = new ht::HtHandle*;

	HRESULT hr0 = ((IUnknown*)h)->QueryInterface(IID_Ht, (void**)&pIHT);
	if (SUCCEEDED(hr0))
	{
		HRESULT hr1 = pIHT->create(ht, capacity, secSnapshotInterval, maxKeyLength, maxPayloadLength, htUsersGroup, fileName);
		if (!SUCCEEDED(hr1)) {
			pIHT->Release();
			throw (int)hr1;
			return nullptr;
		}
		else {
			pIHT->Release();
			return *ht;
		}
	}
	else {

		throw (int)hr0;
		return nullptr;
	}
}

ht::HtHandle* SP4_HTCOM::HT::open(void* h, const wchar_t* fileName, const wchar_t* htUser, const wchar_t* htPassword, bool isMapFile)
{
	ht::HtHandle** ht = new ht::HtHandle*;

	HRESULT hr0 = ((IUnknown*)h)->QueryInterface(IID_Ht, (void**)&pIHT);
	if (SUCCEEDED(hr0))
	{
		HRESULT hr1 = pIHT->openAuth(ht, fileName, htUser, htPassword, isMapFile);
		if (!SUCCEEDED(hr1)) {
			pIHT->Release();
			throw (int)hr1;
			return nullptr;
		}
		else {
			pIHT->Release();
			return *ht;
		}
	}
	else {

		throw (int)hr0;
		return nullptr;
	}
}





ht::HtHandle* SP4_HTCOM::HT::open(void * h, const wchar_t* fileName, bool isMapFile)
{
	ht::HtHandle** ht = new ht::HtHandle*;

	HRESULT hr0 = ((IUnknown*)h)->QueryInterface(IID_Ht, (void**)&pIHT);
	if (SUCCEEDED(hr0))
	{
		HRESULT hr1 = pIHT->open(ht, fileName, isMapFile);
		if (!SUCCEEDED(hr1)) {
			pIHT->Release();
			throw (int)hr1;
			return nullptr;
		}
		else {
			pIHT->Release();
			return *ht;
		}
	}
	else {

		throw (int)hr0;
		return nullptr;
	}
}

BOOL SP4_HTCOM::HT::snap(void * h, ht::HtHandle* htHandle)
{
	BOOL rc = false;

	HRESULT hr0 = ((IUnknown*)h)->QueryInterface(IID_Ht, (void**)&pIHT);
	if (SUCCEEDED(hr0))
	{
		HRESULT hr1 = pIHT->snap(rc, htHandle);
		if (!SUCCEEDED(hr1)) {
			pIHT->Release();
			throw (int)hr1;
			return rc;
		}
		else {
			pIHT->Release();
			return rc;
		}
	}
	else {

		throw (int)hr0;
		return rc;
	}
}

BOOL SP4_HTCOM::HT::close(void * h, ht::HtHandle* htHandle)
{
	BOOL rc = false;

	HRESULT hr0 = ((IUnknown*)h)->QueryInterface(IID_Ht, (void**)&pIHT);
	if (SUCCEEDED(hr0))
	{
		HRESULT hr1 = pIHT->close(rc, htHandle);
		if (!SUCCEEDED(hr1)) {
			pIHT->Release();
			throw (int)hr1;
			return rc;
		}
		else {
			pIHT->Release();
			return rc;
		}
	}
	else {

		throw (int)hr0;
		return rc;
	}
}

BOOL SP4_HTCOM::HT::insert(void * h, ht::HtHandle* htHandle, const ht::Element* element)
{
	BOOL rc = false;

	HRESULT hr0 = ((IUnknown*)h)->QueryInterface(IID_Ht, (void**)&pIHT);
	if (SUCCEEDED(hr0))
	{
		HRESULT hr1 = pIHT->insert(rc, htHandle, element);
		if (!SUCCEEDED(hr1)) {
			pIHT->Release();
			throw (int)hr1;
			return rc;
		}
		else {
			pIHT->Release();
			return rc;
		}
	}
	else {

		throw (int)hr0;
		return rc;
	}
}

BOOL SP4_HTCOM::HT::removeOne(void * h, ht::HtHandle* htHandle, const ht::Element* element)
{
	BOOL rc = false;

	HRESULT hr0 = ((IUnknown*)h)->QueryInterface(IID_Ht, (void**)&pIHT);
	if (SUCCEEDED(hr0))
	{
		HRESULT hr1 = pIHT->removeOne(rc, htHandle, element);
		if (!SUCCEEDED(hr1)) {
			pIHT->Release();
			throw (int)hr1;
			return rc;
		}
		else {
			pIHT->Release();
			return rc;
		}
	}
	else {

		throw (int)hr0;
		return rc;
	}
}

ht::Element* SP4_HTCOM::HT::get(void * h, ht::HtHandle* htHandle, const ht::Element* element)
{
	ht::Element** rcElement = new ht::Element*;

	HRESULT hr0 = ((IUnknown*)h)->QueryInterface(IID_Ht, (void**)&pIHT);
	if (SUCCEEDED(hr0))
	{
		HRESULT hr1 = pIHT->get(rcElement, htHandle, element);
		if (!SUCCEEDED(hr1)) {
			pIHT->Release();
			throw (int)hr1;
			return nullptr;
		}
		else {
			pIHT->Release();
			return *rcElement;
		}
	}
	else {

		throw (int)hr0;
		return nullptr;
	}
}

BOOL SP4_HTCOM::HT::update(void * h, ht::HtHandle* htHandle, const ht::Element* oldElement, const void* newPayload, int newPayloadLength)
{
	BOOL rc = false;

	HRESULT hr0 = ((IUnknown*)h)->QueryInterface(IID_Ht, (void**)&pIHT);
	if (SUCCEEDED(hr0))
	{
		HRESULT hr1 = pIHT->update(rc, htHandle, oldElement, newPayload, newPayloadLength);
		if (!SUCCEEDED(hr1)) {
			pIHT->Release();
			throw (int)hr1;
			return rc;
		}
		else {
			pIHT->Release();
			return rc;
		}
	}
	else {

		throw (int)hr0;
		return rc;
	}
}

const char* SP4_HTCOM::HT::getLastError(void * h, ht::HtHandle* htHandle)
{
	const char** rcLastError = new const char*;

	HRESULT hr0 = ((IUnknown*)h)->QueryInterface(IID_Ht, (void**)&pIHT);
	if (SUCCEEDED(hr0))
	{
		HRESULT hr1 = pIHT->getLastError(rcLastError, htHandle);
		if (!SUCCEEDED(hr1)) {
			pIHT->Release();
			throw (int)hr1;
			return nullptr;
		}
		else {
			pIHT->Release();
			return *rcLastError;
		}
	}
	else {

		throw (int)hr0;
		return nullptr;
	}
}

void SP4_HTCOM::HT::print(void * h, const ht::Element* element)
{
	BOOL rc = false;

	HRESULT hr0 = ((IUnknown*)h)->QueryInterface(IID_Ht, (void**)&pIHT);
	if (SUCCEEDED(hr0))
	{
		HRESULT hr1 = pIHT->print(element);
		if (!SUCCEEDED(hr1)) {
			pIHT->Release();
			throw (int)hr1;
		}
		else {
			pIHT->Release();
		}
	}
	else {

		throw (int)hr0;
	}
}








//Element interface
ht::Element* SP4_HTCOM::Element::CreateElementForGetFunction(void * h, const void* key, int keyLength)
{
	ht::Element** rcElement = new ht::Element*;

	HRESULT hr0 = ((IUnknown*)h)->QueryInterface(IID_HtElement, (void**)&pIElement);
	if (SUCCEEDED(hr0))
	{
		HRESULT hr1 = pIElement->CreateElementForGetFunction(rcElement, key, keyLength);
		if (!SUCCEEDED(hr1)) {
			pIElement->Release();
			throw (int)hr1;
			return nullptr;
		}
		else {
			pIElement->Release();
			return *rcElement;
		}
	}
	else {

		throw (int)hr0;
		return nullptr;
	}
}

ht::Element* SP4_HTCOM::Element::CreateElementForInsertFunction(void * h, const void* key, int keyLength, const void* payload, int  payloadLength)
{
	ht::Element** rcElement = new ht::Element*;

	HRESULT hr0 = ((IUnknown*)h)->QueryInterface(IID_HtElement, (void**)&pIElement);
	if (SUCCEEDED(hr0))
	{
		HRESULT hr1 = pIElement->CreateElementForInsertFunction(rcElement, key, keyLength, payload, payloadLength);
		if (!SUCCEEDED(hr1)) {
			pIElement->Release();
			throw (int)hr1;
			return nullptr;
		}
		else {
			pIElement->Release();
			return *rcElement;
		}
	}
	else {

		throw (int)hr0;
		return nullptr;
	}
}

ht::Element* SP4_HTCOM::Element::CreateElementForUpdateFunction(void * h, const ht::Element* oldElement, const void* newPayload, int  newPayloadLength)
{
	ht::Element** rcElement = new ht::Element*;

	HRESULT hr0 = ((IUnknown*)h)->QueryInterface(IID_HtElement, (void**)&pIElement);
	if (SUCCEEDED(hr0))
	{
		HRESULT hr1 = pIElement->CreateElementForUpdateFunction(rcElement, oldElement, newPayload, newPayloadLength);
		if (!SUCCEEDED(hr1)) {
			pIElement->Release();
			throw (int)hr1;
			return nullptr;
		}
		else {
			pIElement->Release();
			return *rcElement;
		}
	}
	else {

		throw (int)hr0;
		return nullptr;
	}
}