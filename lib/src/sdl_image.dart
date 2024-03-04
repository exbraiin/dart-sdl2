// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:sdl2/src/sdl.dart';
import 'package:sdl2/src/sdl_render.dart';
import 'package:sdl2/utils/pointer_ref.dart';

final _IMG_Init = libImg
    .nativeFn<Int Function(Int)>('IMG_Init')
    .asFunction<int Function(int)>();

int IMG_Init(int flags) {
  return _IMG_Init(flags);
}

final _IMG_Quit =
    libImg.nativeFn<Void Function()>('IMG_Quit').asFunction<void Function()>();

void IMG_Quit() {
  return _IMG_Quit();
}

final _IMG_LoadTexture = libImg
    .nativeFn<PtrTexture Function(PtrRenderer, PtrChar)>('IMG_LoadTexture')
    .asFunction<PtrTexture Function(PtrRenderer, PtrChar)>();

SDL_Texture? IMG_LoadTexture(SDL_Renderer renderer, String file) {
  final path = file.toNativeChar();
  final pointer = _IMG_LoadTexture(renderer.ptr, path);
  malloc.free(path);
  return pointer != nullptr ? SDL_Texture.fromPointer(pointer) : null;
}
