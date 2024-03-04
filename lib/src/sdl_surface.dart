// ignore_for_file: non_constant_identifier_names, camel_case_types, camel_case_extensions

import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:sdl2/src/sdl.dart';
import 'package:sdl2/src/sdl_pixels.dart';
import 'package:sdl2/src/sdl_rect.dart';
import 'package:sdl2/utils/pointer_ref.dart';

final _SDL_CreateRGBSurface = libSdl
    .nativeFn<
        PtrSurface Function(Uint32, Int, Int, Int, Uint32, Uint32, Uint32,
            Uint32)>('SDL_CreateRGBSurface')
    .asFunction<PtrSurface Function(int, int, int, int, int, int, int, int)>();

SDL_Surface? SDL_CreateRGBSurface(int flags, int width, int height, int depth,
    int rMask, int gMask, int bMask, int aMask) {
  final pointer = _SDL_CreateRGBSurface(
      flags, width, height, depth, rMask, gMask, bMask, aMask);
  return pointer != nullptr ? SDL_Surface.fromPointer(pointer) : null;
}

/// SDL_Surface *SDLCALL SDL_CreateRGBSurfaceWithFormat
/// SDL_Surface *SDLCALL SDL_CreateRGBSurfaceFrom(void *pixels,
/// SDL_Surface *SDLCALL SDL_CreateRGBSurfaceWithFormatFrom
/// void SDLCALL SDL_FreeSurface(SDL_Surface * surface);
/// int SDLCALL SDL_SetSurfacePalette(SDL_Surface * surface,
/// int SDLCALL SDL_LockSurface(SDL_Surface * surface);
/// void SDLCALL SDL_UnlockSurface(SDL_Surface * surface);
/// SDL_Surface *SDLCALL SDL_LoadBMP_RW(SDL_RWops * src,
/// int SDLCALL SDL_SaveBMP_RW
/// int SDLCALL SDL_SetSurfaceRLE(SDL_Surface * surface,
/// SDL_bool SDLCALL SDL_HasSurfaceRLE(SDL_Surface * surface);
/// int SDLCALL SDL_SetColorKey(SDL_Surface * surface,
/// SDL_bool SDLCALL SDL_HasColorKey(SDL_Surface * surface);
/// int SDLCALL SDL_GetColorKey(SDL_Surface * surface,
/// int SDLCALL SDL_SetSurfaceColorMod(SDL_Surface * surface,
/// int SDLCALL SDL_GetSurfaceColorMod(SDL_Surface * surface,
/// int SDLCALL SDL_SetSurfaceAlphaMod(SDL_Surface * surface,
/// int SDLCALL SDL_GetSurfaceAlphaMod(SDL_Surface * surface,
/// int SDLCALL SDL_SetSurfaceBlendMode(SDL_Surface * surface,
/// int SDLCALL SDL_GetSurfaceBlendMode(SDL_Surface * surface,
/// SDL_bool SDLCALL SDL_SetClipRect(SDL_Surface * surface,
/// void SDLCALL SDL_GetClipRect(SDL_Surface * surface,

final _SDL_DuplicateSurface = libSdl
    .nativeFn<PtrSurface Function(PtrSurface)>('SDL_DuplicateSurface')
    .asFunction<PtrSurface Function(PtrSurface)>();

SDL_Surface SDL_DuplicateSurface(SDL_Surface surface) {
  final pointer = _SDL_DuplicateSurface(surface.ptr);
  return SDL_Surface.fromPointer(pointer);
}

/// SDL_Surface *SDLCALL SDL_ConvertSurface
/// SDL_Surface *SDLCALL SDL_ConvertSurfaceFormat
/// int SDLCALL SDL_ConvertPixels(int width, int height,
/// int SDLCALL SDL_PremultiplyAlpha(int width, int height,

final _SDL_FillRect = libSdl
    .nativeFn<Int Function(PtrSurface, PtrRect, Uint32)>('SDL_FillRect')
    .asFunction<int Function(PtrSurface, PtrRect, int)>();

int SDL_FillRect(SDL_Surface dst, SDL_Rect? rect, int color) {
  final pointer =
      rect != null ? (malloc<Ext_SDL_Rect>()..ref.set(rect)) : nullptr;
  final value = _SDL_FillRect(dst.ptr, pointer, color);
  malloc.free(pointer);
  return value;
}

/// int SDLCALL SDL_FillRects
/// int SDLCALL SDL_UpperBlit
/// int SDLCALL SDL_LowerBlit
/// int SDLCALL SDL_SoftStretch(SDL_Surface * src,
/// int SDLCALL SDL_SoftStretchLinear(SDL_Surface * src,
/// int SDLCALL SDL_UpperBlitScaled
/// int SDLCALL SDL_LowerBlitScaled
/// void SDLCALL SDL_SetYUVConversionMode(SDL_YUV_CONVERSION_MODE mode);
/// SDL_YUV_CONVERSION_MODE SDLCALL SDL_GetYUVConversionMode(void);
/// SDL_YUV_CONVERSION_MODE SDLCALL SDL_GetYUVConversionModeForResolution(int width, int height);

// === Binds ===================================================================

typedef PtrSurface = Pointer<Ext_SDL_Surface>;

final class Ext_SDL_Surface extends Struct {
  @Uint32()
  external int flags;
  external PtrPixelFormat format;
  @Int()
  external int w, h;
  @Int()
  external int pitch;
  external PtrVoid pixels;
  external PtrVoid userdata;
  @Int()
  external int locked;
  external PtrVoid list_blitmap;
  external Ext_SDL_Rect clip_rect;
  external PtrBlitMap map;
  @Int()
  external int refcount;
}

final class SDL_Surface extends PointerHolder<Ext_SDL_Surface> {
  @override
  final PtrSurface ptr;

  SDL_Surface.fromPointer(this.ptr);
}

typedef PtrBlitMap = Pointer<Ext_SDL_BlitMap>;
typedef Ext_SDL_BlitMap = NativeType;
