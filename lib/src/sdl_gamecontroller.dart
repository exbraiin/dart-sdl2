// ignore_for_file: camel_case_types, non_constant_identifier_names, constant_identifier_names

import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:sdl2/src/sdl.dart';
import 'package:sdl2/src/sdl_sensor.dart';
import 'package:sdl2/utils/pointer_ref.dart';

// int SDL_GameControllerAddMappingsFromRW(SDL_RWops * rw, int freerw);
// int SDL_GameControllerAddMapping(const char* mappingString);

final _SDL_GameControllerNumMappings = libSdl
    .nativeFn<Int Function()>('SDL_GameControllerNumMappings')
    .asFunction<int Function()>();

int SDL_GameControllerNumMappings() {
  return _SDL_GameControllerNumMappings();
}

// char * SDL_GameControllerMappingForIndex(int mapping_index);
// char * SDL_GameControllerMappingForGUID(SDL_JoystickGUID guid);
// char * SDL_GameControllerMapping(SDL_GameController *gamecontroller);
// SDL_bool SDL_IsGameController(int joystick_index);
// const char *SDL_GameControllerNameForIndex(int joystick_index);
// const char *SDL_GameControllerPathForIndex(int joystick_index);
// SDL_GameControllerType SDL_GameControllerTypeForIndex(int joystick_index);
// char *SDL_GameControllerMappingForDeviceIndex(int joystick_index);

final _SDL_GameControllerOpen = libSdl
    .nativeFn<PtrVoid Function(Int)>('SDL_GameControllerOpen')
    .asFunction<PtrVoid Function(int)>();

SDL_GameController? SDL_GameControllerOpen(int joystickIndex) {
  final pointer = _SDL_GameControllerOpen(joystickIndex);
  if (pointer == nullptr) return null;
  return SDL_GameController.fromPointer(pointer);
}

// SDL_GameController *SDL_GameControllerFromInstanceID(SDL_JoystickID joyid);
// SDL_GameController *SDL_GameControllerFromPlayerIndex(int player_index);

final _SDL_GameControllerName = libSdl
    .nativeFn<PtrChar Function(PtrGameController)>('SDL_GameControllerName')
    .asFunction<PtrChar Function(PtrGameController)>();

String? SDL_GameControllerName(SDL_GameController gamecontroller) {
  final pointer = _SDL_GameControllerName(gamecontroller.ptr);
  return pointer != nullptr ? pointer.toDartString() : null;
}

// const char *SDL_GameControllerPath(SDL_GameController *gamecontroller);
// SDL_GameControllerType SDL_GameControllerGetType(SDL_GameController *gamecontroller);
// int SDL_GameControllerGetPlayerIndex(SDL_GameController *gamecontroller);
// void SDL_GameControllerSetPlayerIndex(SDL_GameController *gamecontroller, int player_index);
// Uint16 SDL_GameControllerGetVendor(SDL_GameController *gamecontroller);
// Uint16 SDL_GameControllerGetProduct(SDL_GameController *gamecontroller);
// Uint16 SDL_GameControllerGetProductVersion(SDL_GameController *gamecontroller);
// Uint16 SDL_GameControllerGetFirmwareVersion(SDL_GameController *gamecontroller);
// const char * SDL_GameControllerGetSerial(SDL_GameController *gamecontroller);
// Uint64 SDL_GameControllerGetSteamHandle(SDL_GameController *gamecontroller);
// SDL_bool SDL_GameControllerGetAttached(SDL_GameController *gamecontroller);
// SDL_Joystick *SDL_GameControllerGetJoystick(SDL_GameController *gamecontroller);
// int SDL_GameControllerEventState(int state);
// void SDL_GameControllerUpdate(void);

final _SDL_GameControllerGetAxisFromString = libSdl
    .nativeFn<Int Function(PtrChar)>('SDL_GameControllerGetAxisFromString')
    .asFunction<int Function(PtrChar)>();

SDL_GameControllerAxis SDL_GameControllerGetAxisFromString(String str) {
  final pointer = str.toNativeChar();
  final value = _SDL_GameControllerGetAxisFromString(pointer);
  malloc.free(pointer);
  return SDL_GameControllerAxis.values.firstWhere(
    (element) => element.value == value,
    orElse: () => SDL_GameControllerAxis.values.first,
  );
}

final _SDL_GameControllerGetStringForAxis = libSdl
    .nativeFn<PtrChar Function(Int)>('SDL_GameControllerGetStringForAxis')
    .asFunction<PtrChar Function(int)>();

String? SDL_GameControllerGetStringForAxis(SDL_GameControllerAxis axis) {
  final pointer = _SDL_GameControllerGetStringForAxis(axis.value);
  return pointer != nullptr ? pointer.toDartString() : null;
}

// SDL_GameControllerButtonBind SDL_GameControllerGetBindForAxis(SDL_GameController *gamecontroller, SDL_GameControllerAxis axis);
// SDL_bool SDL_GameControllerHasAxis(SDL_GameController *gamecontroller, SDL_GameControllerAxis axis);
// Sint16 SDL_GameControllerGetAxis(SDL_GameController *gamecontroller, SDL_GameControllerAxis axis);
// SDL_GameControllerButton SDL_GameControllerGetButtonFromString(const char *str);
// const char* SDL_GameControllerGetStringForButton(SDL_GameControllerButton button);
// SDL_GameControllerButtonBind SDL_GameControllerGetBindForButton(SDL_GameController *gamecontroller, SDL_GameControllerButton button);
// SDL_bool SDL_GameControllerHasButton(SDL_GameController *gamecontroller,
// Uint8 SDL_GameControllerGetButton(SDL_GameController *gamecontroller,
// int SDL_GameControllerGetNumTouchpads(SDL_GameController *gamecontroller);
// int SDL_GameControllerGetNumTouchpadFingers(SDL_GameController *gamecontroller, int touchpad);
// int SDL_GameControllerGetTouchpadFinger(SDL_GameController *gamecontroller, int touchpad, int finger, Uint8 *state, float *x, float *y, float *pressure);

final _SDL_GameControllerHasSensor = libSdl
    .nativeFn<Bool Function(PtrGameController, Int)>(
        'SDL_GameControllerHasSensor')
    .asFunction<bool Function(PtrGameController, int)>();

bool SDL_GameControllerHasSensor(
  SDL_GameController gamecontroller,
  SDL_SensorType type,
) {
  return _SDL_GameControllerHasSensor(gamecontroller.ptr, type.value);
}

// int SDL_GameControllerSetSensorEnabled(SDL_GameController *gamecontroller, SDL_SensorType type, SDL_bool enabled);
// SDL_bool SDL_GameControllerIsSensorEnabled(SDL_GameController *gamecontroller, SDL_SensorType type);
// float SDL_GameControllerGetSensorDataRate(SDL_GameController *gamecontroller, SDL_SensorType type);
// int SDL_GameControllerGetSensorData(SDL_GameController *gamecontroller, SDL_SensorType type, float *data, int num_values);
// int SDL_GameControllerGetSensorDataWithTimestamp(SDL_GameController *gamecontroller, SDL_SensorType type, Uint64 *timestamp, float *data, int num_values);
// int SDL_GameControllerRumble(SDL_GameController *gamecontroller, Uint16 low_frequency_rumble, Uint16 high_frequency_rumble, Uint32 duration_ms);
// int SDL_GameControllerRumbleTriggers(SDL_GameController *gamecontroller, Uint16 left_rumble, Uint16 right_rumble, Uint32 duration_ms);
// SDL_bool SDL_GameControllerHasLED(SDL_GameController *gamecontroller);
// SDL_bool SDL_GameControllerHasRumble(SDL_GameController *gamecontroller);
// SDL_bool SDL_GameControllerHasRumbleTriggers(SDL_GameController *gamecontroller);
// int SDL_GameControllerSetLED(SDL_GameController *gamecontroller, Uint8 red, Uint8 green, Uint8 blue);
// int SDL_GameControllerSendEffect(SDL_GameController *gamecontroller, const void *data, int size);

final _SDL_GameControllerClose = libSdl
    .nativeFn<Void Function(PtrGameController)>('SDL_GameControllerClose')
    .asFunction<void Function(PtrGameController)>();

void SDL_GameControllerClose(SDL_GameController gamecontroller) {
  return _SDL_GameControllerClose(gamecontroller.ptr);
}

// const char* SDL_GameControllerGetAppleSFSymbolsNameForButton(SDL_GameController *gamecontroller, SDL_GameControllerButton button);
// const char* SDL_GameControllerGetAppleSFSymbolsNameForAxis(SDL_GameController *gamecontroller, SDL_GameControllerAxis axis);

/// The list of axes available from a controller
enum SDL_GameControllerAxis {
  SDL_CONTROLLER_AXIS_INVALID(-1),
  SDL_CONTROLLER_AXIS_LEFTX(0),
  SDL_CONTROLLER_AXIS_LEFTY(1),
  SDL_CONTROLLER_AXIS_RIGHTX(2),
  SDL_CONTROLLER_AXIS_RIGHTY(3),
  SDL_CONTROLLER_AXIS_TRIGGERLEFT(4),
  SDL_CONTROLLER_AXIS_TRIGGERRIGHT(5),
  SDL_CONTROLLER_AXIS_MAX(6);

  final int value;
  const SDL_GameControllerAxis(this.value);
}

typedef Ext_SDL_GameController = NativeType;
typedef PtrGameController = Pointer<Ext_SDL_GameController>;

final class SDL_GameController extends PointerHolder<Ext_SDL_GameController> {
  @override
  final PtrGameController ptr;

  SDL_GameController.fromPointer(this.ptr);
}
