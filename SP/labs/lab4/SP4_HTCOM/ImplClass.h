#pragma once
#include<iostream>
#include"Interface.h"


extern long g_lObjs;
extern long g_lLocks;

class ImplClass :public IHtElement, public IHt {
private:
	volatile ULONG m_lRef;
public:
	ImplClass();
	~ImplClass();

	STDMETHOD(QueryInterface(REFIID riid, void** ppv));
	STDMETHOD_(ULONG, AddRef(void));
	STDMETHOD_(ULONG, Release(void));

	
	HRESULT STDMETHODCALLTYPE openAuth(ht::HtHandle** htHandle, const wchar_t* fileName, const wchar_t* htUser, const wchar_t* htPassword, bool isMapFile = false);
	HRESULT STDMETHODCALLTYPE create(ht::HtHandle** htHandle, int capacity, int secSnapshotInterval, int maxKeyLength, int maxPayloadLength, const wchar_t* htUsersGroup, const wchar_t* fileName);

	//HRESULT STDMETHODCALLTYPE create(ht::HtHandle** htHandle, int capacity, int secSnapshotInterval, int maxKeyLength, int maxPayloadLength, const wchar_t* fileName);
	HRESULT STDMETHODCALLTYPE open(ht::HtHandle** htHandle, const wchar_t* fileName, bool isMapFile = false);
	HRESULT STDMETHODCALLTYPE snap(BOOL& rc, ht::HtHandle* htHandle);
	HRESULT STDMETHODCALLTYPE close(BOOL& rc, ht::HtHandle* htHandle);
	HRESULT STDMETHODCALLTYPE insert(BOOL& rc, ht::HtHandle* htHandle, const ht::Element* element);
	HRESULT STDMETHODCALLTYPE removeOne(BOOL& rc, ht::HtHandle* htHandle, const ht::Element* element);
	HRESULT STDMETHODCALLTYPE get(ht::Element** rcElement, ht::HtHandle* htHandle, const ht::Element* element);
	HRESULT STDMETHODCALLTYPE update(BOOL& rc, ht::HtHandle* htHandle, const ht::Element* oldElement, const void* newPayload, int newPayloadLength);
	HRESULT STDMETHODCALLTYPE getLastError(const char** lastError, ht::HtHandle* htHandle);
	HRESULT STDMETHODCALLTYPE print(const ht::Element* element);
	HRESULT STDMETHODCALLTYPE CreateElementForGetFunction(ht::Element** getElement, const void* key, int keyLength);
	HRESULT STDMETHODCALLTYPE CreateElementForInsertFunction(ht::Element** newElement, const void* key, int keyLength, const void* payload, int  payloadLength);
	HRESULT STDMETHODCALLTYPE CreateElementForUpdateFunction(ht::Element** updateElement, const ht::Element* oldElement, const void* newPayload, int  newPayloadLength);

};



