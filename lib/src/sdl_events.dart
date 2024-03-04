// ignore_for_file: non_constant_identifier_names, camel_case_types, constant_identifier_names

import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:sdl2/src/sdl.dart';
import 'package:sdl2/utils/pointer_ref.dart';

final _SDL_PumpEvents = libSdl
    .nativeFn<Void Function()>('SDL_PumpEvents')
    .asFunction<void Function()>();
void SDL_PumpEvents() {
  return _SDL_PumpEvents();
}

/*

final _SDL_PeepEvents = libSdl.nativeFn('SDL_PeepEvents').asFunction();
int SDL_PeepEvents(SDL_Event* events, int numevents, SDL_eventaction action, Uint32 minType, Uint32 maxType) {
  return _SDL_PeepEvents();
}
*/

final _SDL_HasEvent = libSdl
    .nativeFn<Bool Function(Uint32)>('SDL_HasEvent')
    .asFunction<bool Function(int)>();
bool SDL_HasEvent(int type) {
  return _SDL_HasEvent(type);
}

final _SDL_HasEvents = libSdl
    .nativeFn<Bool Function(Uint32, Uint32)>('SDL_HasEvents')
    .asFunction<bool Function(int, int)>();
bool SDL_HasEvents(int minType, int maxType) {
  return _SDL_HasEvents(minType, maxType);
}

final _SDL_FlushEvent = libSdl
    .nativeFn<Void Function(Uint32)>('SDL_FlushEvent')
    .asFunction<void Function(int)>();
void SDL_FlushEvent(int type) {
  return _SDL_FlushEvent(type);
}

final _SDL_FlushEvents = libSdl
    .nativeFn<Void Function(Uint32, Uint32)>('SDL_FlushEvents')
    .asFunction<void Function(int, int)>();
void SDL_FlushEvents(int minType, int maxType) {
  return _SDL_FlushEvents(minType, maxType);
}

final _eventPtr = malloc<Ext_SDL_Event>();
final _SDL_PollEvent = libSdl
    .nativeFn<Int Function(PtrEvent)>('SDL_PollEvent')
    .asFunction<int Function(PtrEvent)>();
SDL_Event? SDL_PollEvent() {
  final result = _SDL_PollEvent(_eventPtr);
  if (result == 0) return null;
  return SDL_Event.fromNative(_eventPtr.ref);
}

/*
final _SDL_WaitEvent = libSdl.nativeFn('SDL_WaitEvent').asFunction();
int SDL_WaitEvent(SDL_Event* event){
  return _SDL_WaitEvent();
}

final _SDL_WaitEventTimeout = libSdl.nativeFn('SDL_WaitEventTimeout').asFunction();
int SDL_WaitEventTimeout(SDL_Event* event, int timeout){
  return _SDL_WaitEventTimeout();
}

final _SDL_PushEvent = libSdl.nativeFn('SDL_PushEvent').asFunction();
int SDL_PushEvent(SDL_Event* event){
  return _SDL_PushEvent();
}

final _SDL_SetEventFilter = libSdl.nativeFn('SDL_SetEventFilter').asFunction();
void SDL_SetEventFilter(SDL_EventFilter filter, void* userdata){
  return _SDL_SetEventFilter();
}

final _SDL_GetEventFilter = libSdl.nativeFn('SDL_GetEventFilter').asFunction();
SDL_bool SDL_GetEventFilter(SDL_EventFilter* filter, void** userdata){
  return _SDL_GetEventFilter();
}

final _SDL_AddEventWatch = libSdl.nativeFn('SDL_AddEventWatch').asFunction();
void SDL_AddEventWatch(SDL_EventFilter filter, void* userdata){
  return _SDL_AddEventWatch();
}

final _SDL_DelEventWatch = libSdl.nativeFn('SDL_DelEventWatch').asFunction();
void SDL_DelEventWatch(SDL_EventFilter filter, void *userdata){
  return _SDL_DelEventWatch();
}

final _SDL_FilterEvents = libSdl.nativeFn('SDL_FilterEvents').asFunction();
void SDL_FilterEvents(SDL_EventFilter filter, void *userdata){
  return _SDL_FilterEvents();
}
*/

final _SDL_EventState = libSdl
    .nativeFn<Uint8 Function(Uint32, Int)>('SDL_EventState')
    .asFunction<int Function(int, int)>();
int SDL_EventState(int type, int state) {
  return _SDL_EventState(type, state);
}

final _SDL_RegisterEvents = libSdl
    .nativeFn<Uint32 Function(Int)>('SDL_RegisterEvents')
    .asFunction<int Function(int)>();
int SDL_RegisterEvents(int numevents) {
  return _SDL_RegisterEvents(numevents);
}

typedef PtrEvent = Pointer<Ext_SDL_Event>;

final class Ext_SDL_Event extends Union {
  @Uint32()
  external int type;

  @Array<Uint8>(64)
  external Array<Uint8> padding;
}

final class SDL_Event {
  final SDL_EventType type;

  SDL_Event.fromNative(Ext_SDL_Event value)
      : type = SDL_EventType.values.firstWhere(
          (element) => element.value == value.type,
          orElse: () => SDL_EventType.values.first,
        );
}

enum SDL_EventType {
  SDL_FIRSTEVENT(0),
  SDL_QUIT(0x100),
  SDL_APP_TERMINATING(0x101),
  SDL_APP_LOWMEMORY(0x102),
  SDL_APP_WILLENTERBACKGROUND(0x103),
  SDL_APP_DIDENTERBACKGROUND(0x104),
  SDL_APP_WILLENTERFOREGROUND(0x105),
  SDL_APP_DIDENTERFOREGROUND(0x106),
  SDL_LOCALECHANGED(0x107),
  SDL_DISPLAYEVENT(0x150),
  SDL_WINDOWEVENT(0x200),
  SDL_SYSWMEVENT(0x201),
  SDL_KEYDOWN(0x300),
  SDL_KEYUP(0x301),
  SDL_TEXTEDITING(0x302),
  SDL_TEXTINPUT(0x303),
  SDL_KEYMAPCHANGED(0x304),
  SDL_TEXTEDITING_EXT(0x305),
  SDL_MOUSEMOTION(0x400),
  SDL_MOUSEBUTTONDOWN(0x401),
  SDL_MOUSEBUTTONUP(0x402),
  SDL_MOUSEWHEEL(0x403),
  SDL_JOYAXISMOTION(0x600),
  SDL_JOYBALLMOTION(0x601),
  SDL_JOYHATMOTION(0x602),
  SDL_JOYBUTTONDOWN(0x603),
  SDL_JOYBUTTONUP(0x604),
  SDL_JOYDEVICEADDED(0x605),
  SDL_JOYDEVICEREMOVED(0x606),
  SDL_JOYBATTERYUPDATED(0x607),
  SDL_CONTROLLERAXISMOTION(0x650),
  SDL_CONTROLLERBUTTONDOWN(0x651),
  SDL_CONTROLLERBUTTONUP(0x652),
  SDL_CONTROLLERDEVICEADDED(0x653),
  SDL_CONTROLLERDEVICEREMOVED(0x654),
  SDL_CONTROLLERDEVICEREMAPPED(0x655),
  SDL_CONTROLLERTOUCHPADDOWN(0x656),
  SDL_CONTROLLERTOUCHPADMOTION(0x657),
  SDL_CONTROLLERTOUCHPADUP(0x658),
  SDL_CONTROLLERSENSORUPDATE(0x659),
  SDL_CONTROLLERUPDATECOMPLETE_RESERVED_FOR_SDL3(0x660),
  SDL_CONTROLLERSTEAMHANDLEUPDATED(0x661),
  SDL_FINGERDOWN(0x700),
  SDL_FINGERUP(0x701),
  SDL_FINGERMOTION(0x702),
  SDL_DOLLARGESTURE(0x800),
  SDL_DOLLARRECORD(0x801),
  SDL_MULTIGESTURE(0x802),
  SDL_CLIPBOARDUPDATE(0x900),
  SDL_DROPFILE(0x1000),
  SDL_DROPTEXT(0x1001),
  SDL_DROPBEGIN(0x1002),
  SDL_DROPCOMPLETE(0x1003),
  SDL_AUDIODEVICEADDED(0x1100),
  SDL_AUDIODEVICEREMOVED(0x1101),
  SDL_SENSORUPDATE(0x1200),
  SDL_RENDER_TARGETS_RESET(0x2000),
  SDL_RENDER_DEVICE_RESET(0x2001),
  SDL_POLLSENTINEL(0x7F00),
  SDL_USEREVENT(0x8000),
  SDL_LASTEVENT(0xFFFF);

  final int value;
  const SDL_EventType(this.value);
}
