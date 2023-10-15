#include <iostream>
#include <process.h>
#include <time.h>
#include <windows.h>


using namespace std;
int main()
{
    STARTUPINFO si1;
    PROCESS_INFORMATION pi1;
    ZeroMemory(&si1, sizeof(si1));
    si1.cb = sizeof(si1);
    ZeroMemory(&pi1, sizeof(pi1));


    STARTUPINFO si2;
    PROCESS_INFORMATION pi2;
    ZeroMemory(&si2, sizeof(si2));
    si2.cb = sizeof(si2);
    ZeroMemory(&pi2, sizeof(pi2));


    if (!CreateProcess(
        L"D:\\3k1s\\OS\\labs\\lab3\\OS03\\x64\\Debug\\OS03_02_1.exe",   // No module name (use command line)
        NULL,        // Command line
        NULL,           // Process handle not inheritable
        NULL,           // Thread handle not inheritable
        FALSE,          // Set handle inheritance to FALSE
        CREATE_NEW_CONSOLE,              // No creation flags
        NULL,           // Use parent's environment block
        NULL,           // Use parent's starting directory 
        &si1,            // Pointer to STARTUPINFO structure
        &pi1)           // Pointer to PROCESS_INFORMATION structure
        )
    {
        printf("CreateProcess failed (%d).\n", GetLastError());
    }
    else {
        printf("Process OS03_02_1 created;\n");
    }



    if (!CreateProcess(
        L"D:\\3k1s\\OS\\labs\\lab3\\OS03\\x64\\Debug\\OS03_02_2.exe",   
        NULL,        
        NULL,           
        NULL,           
        FALSE,          
        CREATE_NEW_CONSOLE,              
        NULL,           
        NULL,           
        &si2,            
        &pi2)           
        )
    {
        printf("CreateProcess failed (%d).\n", GetLastError());
    }
    else {
        printf("Process OS03_02_2 created;\n");
    }
	for (int i = 0; i < 100; i++)
	{
		cout << "PID: " << _getpid() << " - " << i << endl;
        Sleep(1000);

	}
        
    // Wait until child process exits.
    WaitForSingleObject(pi1.hProcess, INFINITE); 
    CloseHandle(pi1.hProcess);
    CloseHandle(pi1.hThread);
    WaitForSingleObject(pi2.hProcess, INFINITE);
    CloseHandle(pi2.hProcess);
    CloseHandle(pi2.hThread);
    return 0;



}