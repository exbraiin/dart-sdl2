// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';

import 'package:sdl2/src/sdl.dart';
import 'package:sdl2/utils/pointer_ref.dart';

final _SDL_free = libSdl
    .nativeFn<Void Function(Pointer)>('SDL_free')
    .asFunction<void Function(Pointer)>();

void SDL_free(Pointer pointer) {
  return _SDL_free(pointer);
}
