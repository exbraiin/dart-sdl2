// =============================================================================
// =========================== IMPLEMENTATION COMPLETE =========================
// =============================================================================

// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:sdl2/src/sdl.dart';
import 'package:sdl2/src/sdl_stdinc.dart';
import 'package:sdl2/utils/pointer_ref.dart';

final _SDL_GetBasePath = libSdl
    .nativeFn<PtrChar Function()>('SDL_GetBasePath')
    .asFunction<PtrChar Function()>();

String? SDL_GetBasePath() {
  final pointer = _SDL_GetBasePath();
  final result = pointer.toDartString();
  SDL_free(pointer);
  return pointer != nullptr ? result : null;
}

final _SDL_GetPrefPath = libSdl
    .nativeFn<PtrChar Function(PtrChar, PtrChar)>('SDL_GetPrefPath')
    .asFunction<PtrChar Function(PtrChar, PtrChar)>();

String? SDL_GetPrefPath(String org, String app) {
  final orgPtr = org.toNativeChar();
  final appPtr = app.toNativeChar();
  final pointer = _SDL_GetPrefPath(orgPtr, appPtr);
  final result = pointer.toDartString();
  malloc.free(orgPtr);
  malloc.free(appPtr);
  SDL_free(pointer);
  return pointer != nullptr ? result : null;
}
