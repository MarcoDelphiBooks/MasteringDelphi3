#include <windows.h>

extern "C" __declspec(dllexport)
int WINAPI Double (int n)
{
	return n * 2;
}

extern "C" __declspec(dllexport)
int WINAPI Triple (int n)
{
	return n * 3;
}

__declspec(dllexport)
int WINAPI Add (int a, int b)
{
	return (a + b);
}
