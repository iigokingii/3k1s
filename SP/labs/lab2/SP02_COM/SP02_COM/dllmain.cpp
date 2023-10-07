// dllmain.cpp : Определяет точку входа для приложения DLL.
#include "pch.h"
#include<fstream>
LONG Seq = 0;
std::fstream LogCom;
HMODULE hmodule;

BOOL APIENTRY DllMain( HMODULE hModule,
                       DWORD  ul_reason_for_call,
                       LPVOID lpReserved
                     )
{
    switch (ul_reason_for_call)
    {
    case DLL_PROCESS_ATTACH:
        hmodule = hModule;
        LogCom.open("D:\\3k1s\\SP\\labs\\lab2\\SP02_COM\\locCom.txt", std::ios_base::out);
        break;
    case DLL_THREAD_ATTACH:
    case DLL_THREAD_DETACH:
    case DLL_PROCESS_DETACH:
        LogCom.close();
        break;
    }
    return TRUE;
}

