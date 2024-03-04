// =============================================================================
// =========================== IMPLEMENTATION COMPLETE =========================
// =============================================================================

// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'dart:ffi';

import 'package:sdl2/utils/pointer_ref.dart';

/// TODO: lib will stay here for now...
final libSdl = DynamicLibrary.open('sdl2/SDL2.dll');
final libImg = DynamicLibrary.open('sdl2/SDL2_image.dll');

const SDL_INIT_TIMER = 0x00000001;
const SDL_INIT_AUDIO = 0x00000010;
const SDL_INIT_VIDEO = 0x00000020;
const SDL_INIT_JOYSTICK = 0x00000200;
const SDL_INIT_HAPTIC = 0x00001000;
const SDL_INIT_GAMECONTROLLER = 0x00002000;
const SDL_INIT_EVENTS = 0x00004000;
const SDL_INIT_SENSOR = 0x00008000;
const SDL_INIT_NOPARACHUTE = 0x00100000;
const SDL_INIT_EVERYTHING = SDL_INIT_TIMER |
    SDL_INIT_AUDIO |
    SDL_INIT_VIDEO |
    SDL_INIT_EVENTS |
    SDL_INIT_JOYSTICK |
    SDL_INIT_HAPTIC |
    SDL_INIT_GAMECONTROLLER |
    SDL_INIT_SENSOR;

final _SDL_Init = libSdl
    .nativeFn<Int Function(Uint32)>('SDL_Init')
    .asFunction<int Function(int)>();

int SDL_Init(int flags) {
  return _SDL_Init(flags);
}

final _SDL_InitSubSystem = libSdl
    .nativeFn<Int Function(Uint32)>('SDL_InitSubSystem')
    .asFunction<int Function(int)>();

int SDL_InitSubSystem(int flags) {
  return _SDL_InitSubSystem(flags);
}

final _SDL_QuitSubSystem = libSdl
    .nativeFn<Void Function(Uint32)>('SDL_QuitSubSystem')
    .asFunction<void Function(int)>();

void SDL_QuitSubSystem(int flags) {
  return _SDL_QuitSubSystem(flags);
}

final _SDL_WasInit = libSdl
    .nativeFn<Uint32 Function(Uint32)>('SDL_WasInit')
    .asFunction<int Function(int)>();

int SDL_WasInit(int flags) {
  return _SDL_WasInit(flags);
}

final _SDL_Quit =
    libSdl.nativeFn<Void Function()>('SDL_Quit').asFunction<void Function()>();

void SDL_Quit() {
  return _SDL_Quit();
}
