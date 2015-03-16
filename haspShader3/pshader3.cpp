#include <Windows.h>
#include <d3d9.h>

extern "C" __declspec(dllexport) BOOLEAN hasPixelShader3()
{
	SetErrorMode(SEM_NOOPENFILEERRORBOX | SEM_FAILCRITICALERRORS);
	HINSTANCE hD3D9 = NULL;
	hD3D9 = LoadLibrary("D3D9.DLL");
	if (!hD3D9) return false;
	typedef IDirect3D9* (WINAPI *DIRECT3DCREATE_PTR)(UINT SDKVersion);
	DIRECT3DCREATE_PTR pfnD3DCreate = (DIRECT3DCREATE_PTR)GetProcAddress(hD3D9, "Direct3DCreate9");
	if (!pfnD3DCreate)
	{
		FreeLibrary(hD3D9);
		return false;
	}
	LPDIRECT3D9 pD3D = pfnD3DCreate(D3D_SDK_VERSION);
	D3DCAPS9 videocardspec;
	ZeroMemory(&videocardspec, sizeof(D3DCAPS9));
	pD3D->GetDeviceCaps(D3DADAPTER_DEFAULT, D3DDEVTYPE::D3DDEVTYPE_HAL, &videocardspec);
	int major_ver, minor_ver;
	major_ver = D3DSHADER_VERSION_MAJOR(videocardspec.PixelShaderVersion);
	minor_ver = D3DSHADER_VERSION_MINOR(videocardspec.PixelShaderVersion);
	pD3D->Release();
	FreeLibrary(hD3D9);
	if (major_ver >= 3)
	{
		return true;
	}
	else
	{
		return false;
	}
	return false;
}