#pragma once
#include<iostream>
#include<fstream>

#define SEQ LONG __XXCEQ = InterlockedIncrement(&Seq)
#define LOG(x,y) LogCom<<__XXCEQ <<" : "<<(x)<<(y)<<"\n";

extern LONG Seq;
extern std::fstream LogCom;
