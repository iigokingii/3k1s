#pragma once
#include"../../lab3/SP03_HTAPI/HT.h"
#include<objbase.h>

#define FNAME L"GoKing.CA.COM"
#define VINDX L"GoKing.CA.1"
#define PRGID L"GoKing.CA"



static const GUID CLSID_SP =
{ 0x0faa8848, 0x0e97, 0x4cef, { 0xb9, 0x50, 0xce, 0xa0, 0x37, 0x16, 0x11, 0x55} };

//// {C0D3B0A9-FA36-4477-A0C4-48A25688FD96}
//static const GUID CLSID_SP =
//{ 0xc0d3b0a9, 0xfa36, 0x4477, { 0xa0, 0xc4, 0x48, 0xa2, 0x56, 0x88, 0xfd, 0x96 } };



// {DA342D5F-58D2-4CC1-8790-0F79620CF168}
static const GUID IID_Ht =
{ 0xdaa42d5f, 0x58d2, 0x4cc1, { 0x87, 0x90, 0xf, 0x79, 0x62, 0xc, 0xf1, 0x68 } };

struct IHt : IUnknown
{
	virtual HRESULT STDMETHODCALLTYPE openAuth(ht::HtHandle** htHandle, const wchar_t* fileName, const wchar_t* htUser, const wchar_t* htPassword, bool isMapFile = false) = 0;
	virtual HRESULT STDMETHODCALLTYPE create(ht::HtHandle** htHandle, int capacity, int secSnapshotInterval, int maxKeyLength, int maxPayloadLength, const wchar_t* htUsersGroup, const wchar_t* fileName) = 0;




	//virtual HRESULT STDMETHODCALLTYPE create(ht::HtHandle** htHandle, int capacity, int secSnapshotInterval, int maxKeyLength, int maxPayloadLength, const wchar_t* fileName) = 0;
	virtual HRESULT STDMETHODCALLTYPE open(ht::HtHandle** htHandle, const wchar_t* fileName, bool isMapFile = false) = 0;
	virtual HRESULT STDMETHODCALLTYPE snap(BOOL& rc, ht::HtHandle* htHandle) = 0;
	virtual HRESULT STDMETHODCALLTYPE close(BOOL& rc, ht::HtHandle* htHandle) = 0;
	virtual HRESULT STDMETHODCALLTYPE insert(BOOL& rc, ht::HtHandle* htHandle, const ht::Element* element) = 0;
	virtual HRESULT STDMETHODCALLTYPE removeOne(BOOL& rc, ht::HtHandle* htHandle, const ht::Element* element) = 0;
	virtual HRESULT STDMETHODCALLTYPE get(ht::Element** rcElement, ht::HtHandle* htHandle, const ht::Element* element) = 0;
	virtual HRESULT STDMETHODCALLTYPE update(BOOL& rc, ht::HtHandle* htHandle, const ht::Element* oldElement, const void* newPayload, int newPayloadLength) = 0;
	virtual HRESULT STDMETHODCALLTYPE getLastError(const char** lastError, ht::HtHandle* htHandle) = 0;
	virtual HRESULT STDMETHODCALLTYPE print(const ht::Element* element) = 0;

};
// {D599B0A3-FAF2-4DE6-B73C-DA7773C8BA86}
static const GUID IID_HtElement =
{ 0xd5a9b0a3, 0xfaf2, 0x4de6, { 0xb7, 0x3c, 0xda, 0x77, 0x73, 0xc8, 0xba, 0x86 } };

struct IHtElement : IUnknown
{
	virtual HRESULT STDMETHODCALLTYPE CreateElementForGetFunction(ht::Element** getElement, const void* key, int keyLength) = 0;
	virtual HRESULT STDMETHODCALLTYPE CreateElementForInsertFunction(ht::Element** newElement, const void* key, int keyLength, const void* payload, int  payloadLength) = 0;
	virtual HRESULT STDMETHODCALLTYPE CreateElementForUpdateFunction(ht::Element** updateElement, const ht::Element* oldElement, const void* newPayload, int  newPayloadLength) = 0;
};