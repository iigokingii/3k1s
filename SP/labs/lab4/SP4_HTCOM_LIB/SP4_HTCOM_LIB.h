#pragma once
#include "../SP4_HTCOM/Interface.h"

namespace SP4_HTCOM {
	void* init();

	namespace HT
	{
		//ht::HtHandle* create(void* h, int capacity, int secSnapshotInterval, int maxKeyLength, int maxPayloadLength, const wchar_t* fileName);
		ht::HtHandle* create(void* h, int capacity, int secSnapshotInterval, int maxKeyLength, int maxPayloadLength, const wchar_t* htUsersGroup, const wchar_t* fileName);

		ht::HtHandle* open(void* h, const wchar_t* fileName, bool isMapFile = false);
		ht::HtHandle* open(void* h, const wchar_t* fileName, const wchar_t* htUser, const wchar_t* htPassword, bool isMapFile = false);

		BOOL snap(void* h, ht::HtHandle* htHandle);
		BOOL close(void* h, ht::HtHandle* htHandle);
		BOOL insert(void* h, ht::HtHandle* htHandle, const ht::Element* element);
		BOOL removeOne(void* h, ht::HtHandle* htHandle, const ht::Element* element);
		ht::Element* get(void* h, ht::HtHandle* htHandle, const ht::Element* element);
		BOOL update(void* h, ht::HtHandle* htHandle, const ht::Element* oldElement, const void* newPayload, int newPayloadLength);
		const char* getLastError(void* h, ht::HtHandle* htHandle);
		void print(void* h, const ht::Element* element);
	}
	namespace Element
	{
		ht::Element* CreateElementForGetFunction(void* h, const void* key, int keyLength);
		ht::Element* CreateElementForInsertFunction(void* h, const void* key, int keyLength, const void* payload, int  payloadLength);
		ht::Element* CreateElementForUpdateFunction(void* h, const ht::Element* oldElement, const void* newPayload, int  newPayloadLength);
	}
	void dispose(void* h);

}


