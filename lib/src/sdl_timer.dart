// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';

import 'package:sdl2/src/sdl.dart';
import 'package:sdl2/utils/pointer_ref.dart';

final _SDL_GetTicks = libSdl
    .nativeFn<Uint32 Function()>('SDL_GetTicks')
    .asFunction<int Function()>();

int SDL_GetTicks() {
  return _SDL_GetTicks();
}

final _SDL_GetTicks64 = libSdl
    .nativeFn<Uint64 Function()>('SDL_GetTicks64')
    .asFunction<int Function()>();

int SDL_GetTicks64() {
  return _SDL_GetTicks64();
}

final _SDL_GetPerformanceCounter = libSdl
    .nativeFn<Uint64 Function()>('SDL_GetPerformanceCounter')
    .asFunction<int Function()>();

int SDL_GetPerformanceCounter() {
  return _SDL_GetPerformanceCounter();
}

final _SDL_GetPerformanceFrequency = libSdl
    .nativeFn<Uint64 Function()>('SDL_GetPerformanceFrequency')
    .asFunction<int Function()>();

int SDL_GetPerformanceFrequency() {
  return _SDL_GetPerformanceFrequency();
}

final _SDL_Delay = libSdl
    .nativeFn<Void Function(Uint32)>('SDL_Delay')
    .asFunction<void Function(int)>();

void SDL_Delay(int ms) {
  return _SDL_Delay(ms);
}

// TODO:
// SDL_TimerID SDL_AddTimer(Uint32 interval,SDL_TimerCallback callback, void *param){}
// SDL_bool SDL_RemoveTimer(SDL_TimerID id){}
