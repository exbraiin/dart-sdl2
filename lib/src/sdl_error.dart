// ignore_for_file: non_constant_identifier_names, unused_element

import 'dart:ffi';

import 'package:sdl2/src/sdl.dart';
import 'package:sdl2/utils/pointer_ref.dart';

final _SDL_GetError = libSdl
    .nativeFn<PtrChar Function()>('SDL_GetError')
    .asFunction<PtrChar Function()>();

String SDL_GetError() {
  return _SDL_GetError().toDartString();
}

final _SDL_ClearError = libSdl
    .nativeFn<Void Function()>('SDL_ClearError')
    .asFunction<void Function()>();

void SDL_ClearError() {
  return _SDL_ClearError();
}
