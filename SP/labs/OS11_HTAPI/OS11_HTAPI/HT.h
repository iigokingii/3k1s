#pragma once

#include "Element.h"

#define SECOND 10000000

namespace ht    // HT API
{
	// API HT - ����������� ��������� ��� ������� � ��-��������� 
	//          ��-��������� ������������� ��� �������� ������ � �� � ������� ����/��������
	//          ���������������� (�����������) ������ �������������� � ������� snapshot-���������� 
	//          create - �������  � ������� HT-��������� ��� �������������   
	//          open   - ������� HT-��������� ��� �������������
	//          insert - ������� ������� ������
	//          remove - ������� ������� ������    
	//          get    - ������  ������� ������
	//          update - �������� ������� ������
	//          snap   - �������� snapshot
	//          close  - ��������� snap � ������� HT-��������� ��� �������������
	//          getLastError - �������� ��������� � ��������� ������


	extern "C" SP04_HTAPI_API  struct HtHandle    // ���� ���������� HT
	{
		SP04_HTAPI_API  HtHandle();
		SP04_HTAPI_API  HtHandle(int capacity, int secSnapshotInterval, int maxKeyLength, int maxPayloadLength, const wchar_t* fileName);
		int     capacity;               // ������� ��������� � ���������� ��������� 
		int     secSnapshotInterval;    // ������������� ���������� � ���. 
		int     maxKeyLength;           // ������������ ����� �����
		int     maxPayloadLength;       // ������������ ����� ������
		wchar_t fileName[512];          // ��� ����� 
		HANDLE  file;                   // File HANDLE != 0, ���� ���� ������
		HANDLE  fileMapping;            // Mapping File HANDLE != 0, ���� mapping ������  
		LPVOID  addr;                   // Addr != NULL, ���� mapview ��������  
		char    lastErrorMessage[512];  // ��������� �� ��������� ������ ��� 0x00  
		time_t  lastSnaptime;           // ���� ���������� snap'a (time())

		int count;						// ������� ���������� ��������� � ���-�������
		HANDLE snapshotTimer;			// ������ ��� snapshot
		HANDLE mutex;					// mutex ��� ������������� ���������� ����������� HtHandle
	};

	extern "C" SP04_HTAPI_API  HtHandle * create   //  ������� HT             
	(
		int	  capacity,					   // ������� ���������
		int   secSnapshotInterval,		   // ������������� ���������� � ���.
		int   maxKeyLength,                // ������������ ������ �����
		int   maxPayloadLength,            // ������������ ������ ������
		const wchar_t* fileName           // ��� ����� 
	); 	// != NULL �������� ����������  

	extern "C" SP04_HTAPI_API  HtHandle * open     //  ������� HT             
	(
		const wchar_t* fileName,         // ��� �����
		bool isMapFile = false			// true ���� ������� fileMapping; false ���� ������� ����; �� ��������� false
	); 	// != NULL �������� ����������  

	extern "C" SP04_HTAPI_API  BOOL snap         // ��������� Snapshot
	(
		HtHandle * htHandle           // ���������� HT (File, FileMapping)
	);

	extern "C" SP04_HTAPI_API  BOOL close        // snap � ������� HT  �  �������� htHandle
	(
		const HtHandle * htHandle           // ���������� HT (File, FileMapping)
	);	//  == TRUE �������� ����������   


	extern "C" SP04_HTAPI_API  BOOL insert      // �������� ������� � ���������
	(
		HtHandle * htHandle,            // ���������� HT
		const Element * element              // �������
	);	//  == TRUE �������� ���������� 


	extern "C" SP04_HTAPI_API BOOL removeOne      // ������� ������� � ���������
	(
		HtHandle * htHandle,            // ���������� HT (����)
		const Element * element              // ������� 
	);	//  == TRUE �������� ���������� 

	extern "C" SP04_HTAPI_API Element * get     //  ������ ������� � ���������
	(
		HtHandle * htHandle,            // ���������� HT
		const Element * element              // ������� 
	); 	//  != NULL �������� ���������� 


	extern "C" SP04_HTAPI_API  BOOL update     //  ������� ������� � ���������
	(
		HtHandle * htHandle,            // ���������� HT
		const Element * oldElement,          // ������ ������� (����, ������ �����)
		const void* newPayload,          // ����� ������  
		int             newPayloadLength     // ������ ����� ������
	); 	//  != NULL �������� ���������� 

	extern "C" SP04_HTAPI_API  const char* getLastError  // �������� ��������� � ��������� ������
	(
		const HtHandle * htHandle                         // ���������� HT
	);

	extern "C" SP04_HTAPI_API  void print                               // ����������� ������� 
	(
		const Element * element              // ������� 
	);

	int hashFunction(const char* key, int capacity);
	int nextHash(int currentHash, const char* key, int capacity);

	int findFreeIndex(const HtHandle* htHandle, const Element* element);
	BOOL writeToMemory(const HtHandle* const htHandle, const Element* const element, int index);
	int incrementCount(HtHandle* const htHandle);

	int findIndex(const HtHandle* htHandle, const Element* element);
	Element* readFromMemory(const HtHandle* const htHandle, Element* const element, int index);
	BOOL clearMemoryByIndex(const HtHandle* const htHandle, int index);
	int decrementCount(HtHandle* const htHandle);

	void CALLBACK snapAsync(LPVOID prm, DWORD, DWORD);
	const char* writeLastError(HtHandle* const htHandle, const char* msg);

	HtHandle* createHt(
		int	  capacity,					// ������� ���������
		int   secSnapshotInterval,		// ������������� ���������� � ���.
		int   maxKeyLength,             // ������������ ������ �����
		int   maxPayloadLength,			// ������������ ������ ������
		const wchar_t* fileName);		// ��� ����� 
	HtHandle* openHtFromFile(const wchar_t* fileName);
	HtHandle* openHtFromMapName(const wchar_t* fileName);
	BOOL runSnapshotTimer(HtHandle* htHandle);
};
