// =============================================================================
// =========================== IMPLEMENTATION COMPLETE =========================
// =============================================================================

// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:sdl2/src/sdl.dart';
import 'package:sdl2/utils/pointer_ref.dart';

final _SDL_SetClipboardText = libSdl
    .nativeFn<Int Function(PtrChar)>('SDL_SetClipboardText')
    .asFunction<int Function(PtrChar)>();

int SDL_SetClipboardText(String text) {
  final pointer = text.toNativeChar();
  final result = _SDL_SetClipboardText(pointer);
  malloc.free(pointer);
  return result;
}

final _SDL_GetClipboardText = libSdl
    .nativeFn<PtrChar Function()>('SDL_GetClipboardText')
    .asFunction<PtrChar Function()>();

String? SDL_GetClipboardText() {
  final result = _SDL_GetClipboardText();
  if (result == nullptr) return null;
  return result.toDartString();
}

final _SDL_HasClipboardText = libSdl
    .nativeFn<Bool Function()>('SDL_HasClipboardText')
    .asFunction<bool Function()>();

bool SDL_HasClipboardText() {
  return _SDL_HasClipboardText();
}

final _SDL_SetPrimarySelectionText = libSdl
    .nativeFn<Int Function(PtrChar)>('SDL_SetPrimarySelectionText')
    .asFunction<int Function(PtrChar)>();

int SDL_SetPrimarySelectionText(String text) {
  final pointer = text.toNativeChar();
  final result = _SDL_SetPrimarySelectionText(pointer);
  malloc.free(pointer);
  return result;
}

final _SDL_GetPrimarySelectionText = libSdl
    .nativeFn<PtrChar Function()>('SDL_GetPrimarySelectionText')
    .asFunction<PtrChar Function()>();

String? SDL_GetPrimarySelectionText() {
  final pointer = _SDL_GetPrimarySelectionText();
  if (pointer == nullptr) return null;
  return pointer.toDartString();
}

final _SDL_HasPrimarySelectionText = libSdl
    .nativeFn<Bool Function()>('SDL_HasPrimarySelectionText')
    .asFunction<bool Function()>();

bool SDL_HasPrimarySelectionText() {
  return _SDL_HasPrimarySelectionText();
}
