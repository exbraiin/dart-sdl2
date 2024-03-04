// =============================================================================
// =========================== IMPLEMENTATION COMPLETE =========================
// =============================================================================

// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';

import 'package:sdl2/src/sdl.dart';
import 'package:sdl2/utils/pointer_ref.dart';

final _SDL_GetCPUCount = libSdl
    .nativeFn<Int Function()>('SDL_GetCPUCount')
    .asFunction<int Function()>();
int SDL_GetCPUCount() {
  return _SDL_GetCPUCount();
}

final _SDL_GetCPUCacheLineSize = libSdl
    .nativeFn<Int Function()>('SDL_GetCPUCacheLineSize')
    .asFunction<int Function()>();
int SDL_GetCPUCacheLineSize() {
  return _SDL_GetCPUCacheLineSize();
}

final _SDL_HasRDTSC = libSdl
    .nativeFn<Bool Function()>('SDL_HasRDTSC')
    .asFunction<bool Function()>();
bool SDL_HasRDTSC() {
  return _SDL_HasRDTSC();
}

final _SDL_HasAltiVec = libSdl
    .nativeFn<Bool Function()>('SDL_HasAltiVec')
    .asFunction<bool Function()>();
bool SDL_HasAltiVec() {
  return _SDL_HasAltiVec();
}

final _SDL_HasMMX = libSdl
    .nativeFn<Bool Function()>('SDL_HasMMX')
    .asFunction<bool Function()>();
bool SDL_HasMMX() {
  return _SDL_HasMMX();
}

final _SDL_Has3DNow = libSdl
    .nativeFn<Bool Function()>('SDL_Has3DNow')
    .asFunction<bool Function()>();
bool SDL_Has3DNow() {
  return _SDL_Has3DNow();
}

final _SDL_HasSSE = libSdl
    .nativeFn<Bool Function()>('SDL_HasSSE')
    .asFunction<bool Function()>();
bool SDL_HasSSE() {
  return _SDL_HasSSE();
}

final _SDL_HasSSE2 = libSdl
    .nativeFn<Bool Function()>('SDL_HasSSE2')
    .asFunction<bool Function()>();
bool SDL_HasSSE2() {
  return _SDL_HasSSE2();
}

final _SDL_HasSSE3 = libSdl
    .nativeFn<Bool Function()>('SDL_HasSSE3')
    .asFunction<bool Function()>();
bool SDL_HasSSE3() {
  return _SDL_HasSSE3();
}

final _SDL_HasSSE41 = libSdl
    .nativeFn<Bool Function()>('SDL_HasSSE41')
    .asFunction<bool Function()>();
bool SDL_HasSSE41() {
  return _SDL_HasSSE41();
}

final _SDL_HasSSE42 = libSdl
    .nativeFn<Bool Function()>('SDL_HasSSE42')
    .asFunction<bool Function()>();
bool SDL_HasSSE42() {
  return _SDL_HasSSE42();
}

final _SDL_HasAVX = libSdl
    .nativeFn<Bool Function()>('SDL_HasAVX')
    .asFunction<bool Function()>();
bool SDL_HasAVX() {
  return _SDL_HasAVX();
}

final _SDL_HasAVX2 = libSdl
    .nativeFn<Bool Function()>('SDL_HasAVX2')
    .asFunction<bool Function()>();
bool SDL_HasAVX2() {
  return _SDL_HasAVX2();
}

final _SDL_HasAVX512F = libSdl
    .nativeFn<Bool Function()>('SDL_HasAVX512F')
    .asFunction<bool Function()>();
bool SDL_HasAVX512F() {
  return _SDL_HasAVX512F();
}

final _SDL_HasARMSIMD = libSdl
    .nativeFn<Bool Function()>('SDL_HasARMSIMD')
    .asFunction<bool Function()>();
bool SDL_HasARMSIMD() {
  return _SDL_HasARMSIMD();
}

final _SDL_HasNEON = libSdl
    .nativeFn<Bool Function()>('SDL_HasNEON')
    .asFunction<bool Function()>();
bool SDL_HasNEON() {
  return _SDL_HasNEON();
}

final _SDL_HasLSX = libSdl
    .nativeFn<Bool Function()>('SDL_HasLSX')
    .asFunction<bool Function()>();
bool SDL_HasLSX() {
  return _SDL_HasLSX();
}

final _SDL_HasLASX = libSdl
    .nativeFn<Bool Function()>('SDL_HasLASX')
    .asFunction<bool Function()>();
bool SDL_HasLASX() {
  return _SDL_HasLASX();
}

final _SDL_GetSystemRAM = libSdl
    .nativeFn<Int Function()>('SDL_GetSystemRAM')
    .asFunction<int Function()>();
int SDL_GetSystemRAM() {
  return _SDL_GetSystemRAM();
}

final _SDL_SIMDGetAlignment = libSdl
    .nativeFn<Int Function()>('SDL_SIMDGetAlignment')
    .asFunction<int Function()>();
int SDL_SIMDGetAlignment() {
  return _SDL_SIMDGetAlignment();
}

final _SDL_SIMDAlloc = libSdl
    .nativeFn<PtrVoid Function(Int)>('SDL_SIMDAlloc')
    .asFunction<PtrVoid Function(int)>();
PtrVoid SDL_SIMDAlloc(int len) {
  return _SDL_SIMDAlloc(len);
}

final _SDL_SIMDRealloc = libSdl
    .nativeFn<PtrVoid Function(PtrVoid, Int)>('SDL_SIMDRealloc')
    .asFunction<PtrVoid Function(PtrVoid, int)>();
PtrVoid SDL_SIMDRealloc(PtrVoid mem, int len) {
  return _SDL_SIMDRealloc(mem, len);
}

final _SDL_SIMDFree = libSdl
    .nativeFn<Void Function(PtrVoid)>('SDL_SIMDFree')
    .asFunction<void Function(PtrVoid)>();
void SDL_SIMDFree(PtrVoid ptr) {
  return _SDL_SIMDFree(ptr);
}
