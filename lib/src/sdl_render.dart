// ignore_for_file: camel_case_types, non_constant_identifier_names, camel_case_extensions, constant_identifier_names

import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:sdl2/src/sdl.dart';
import 'package:sdl2/src/sdl_blendmode.dart';
import 'package:sdl2/src/sdl_rect.dart';
import 'package:sdl2/src/sdl_surface.dart';
import 'package:sdl2/src/sdl_video.dart';
import 'package:sdl2/utils/pointer_ref.dart';

final _SDL_GetNumRenderDrivers = libSdl
    .nativeFn<Int Function()>('SDL_GetNumRenderDrivers')
    .asFunction<int Function()>();

int SDL_GetNumRenderDrivers() {
  return _SDL_GetNumRenderDrivers();
}

final _SDL_GetRenderDriverInfo = libSdl
    .nativeFn<Int Function(Int, PtrRendererInfo)>('SDL_GetRenderDriverInfo')
    .asFunction<int Function(int, PtrRendererInfo)>();

SDL_RendererInfo? SDL_GetRenderDriverInfo(int index) {
  final pointer = malloc<Ext_SDL_RendererInfo>();
  final result = _SDL_GetRenderDriverInfo(index, pointer);
  malloc.free(pointer);
  return result == 0 ? pointer.ref.get() : null;
}

final _SDL_CreateWindowAndRenderer = libSdl
    .nativeFn<
        Int Function(Int, Int, Uint32, Pointer<PtrWindow>,
            Pointer<PtrRenderer>)>('SDL_CreateWindowAndRenderer')
    .asFunction<
        int Function(int, int, int, Pointer<PtrWindow>, Pointer<PtrWindow>)>();

({SDL_Window window, SDL_Renderer renderer})? SDL_CreateWindowAndRenderer(
    int width, int height, int windowFlags) {
  final window = malloc<PtrWindow>();
  final renderer = malloc<PtrRenderer>();
  final result = _SDL_CreateWindowAndRenderer(
      width, height, windowFlags, window, renderer);
  malloc.free(window);
  malloc.free(renderer);
  return result == 0 && window != nullptr && renderer != nullptr
      ? (
          window: SDL_Window.fromPointer(window.value),
          renderer: SDL_Renderer.fromPointer(renderer.value),
        )
      : null;
}

final _SDL_CreateRenderer = libSdl
    .nativeFn<PtrRenderer Function(PtrWindow, Int, Uint32)>(
        'SDL_CreateRenderer')
    .asFunction<PtrRenderer Function(PtrWindow, int, int)>();

SDL_Renderer? SDL_CreateRenderer(SDL_Window window, int index, int flags) {
  final ptr = _SDL_CreateRenderer(window.ptr, index, flags);
  if (ptr == nullptr) return null;
  return SDL_Renderer.fromPointer(ptr);
}

final _SDL_CreateSoftwareRenderer = libSdl
    .nativeFn<PtrRenderer Function(PtrSurface)>('SDL_CreateSoftwareRenderer')
    .asFunction<PtrRenderer Function(PtrSurface)>();

SDL_Renderer SDL_CreateSoftwareRenderer(SDL_Surface surface) {
  return SDL_Renderer.fromPointer(_SDL_CreateSoftwareRenderer(surface.ptr));
}

final _SDL_GetRenderer = libSdl
    .nativeFn<PtrRenderer Function(PtrWindow)>('SDL_GetRenderer')
    .asFunction<PtrRenderer Function(PtrWindow)>();

SDL_Renderer? SDL_GetRenderer(SDL_Window window) {
  final ptr = _SDL_GetRenderer(window.ptr);
  if (ptr == nullptr) return null;
  return SDL_Renderer.fromPointer(ptr);
}

final _SDL_RenderGetWindow = libSdl
    .nativeFn<PtrWindow Function(PtrRenderer)>('SDL_RenderGetWindow')
    .asFunction<PtrWindow Function(PtrRenderer)>();

SDL_Window? SDL_RenderGetWindow(SDL_Renderer renderer) {
  final ptr = _SDL_RenderGetWindow(renderer.ptr);
  return ptr != nullptr ? SDL_Window.fromPointer(ptr) : null;
}

final _SDL_GetRendererInfo = libSdl
    .nativeFn<Int Function(PtrRenderer, PtrRendererInfo)>('SDL_GetRendererInfo')
    .asFunction<int Function(PtrRenderer, PtrRendererInfo)>();

SDL_RendererInfo? SDL_GetRendererInfo(SDL_Renderer renderer) {
  final pointer = malloc<Ext_SDL_RendererInfo>();
  final result = _SDL_GetRendererInfo(renderer.ptr, pointer);
  malloc.free(pointer);
  return result == 0 ? pointer.ref.get() : null;
}

final _SDL_GetRendererOutputSize = libSdl
    .nativeFn<Int Function(PtrRenderer, PtrInt, PtrInt)>(
        'SDL_GetRendererOutputSize')
    .asFunction<int Function(PtrRenderer, PtrInt, PtrInt)>();

SdlSize? SDL_GetRendererOutputSize(SDL_Renderer renderer) {
  final w = malloc<Int>(), h = malloc<Int>();
  final result = _SDL_GetRendererOutputSize(renderer.ptr, w, h);
  return result == 0 ? (w: w.value, h: h.value) : null;
}

final _SDL_CreateTexture = libSdl
    .nativeFn<PtrTexture Function(PtrRenderer, Uint32, Int, Int, Int)>(
        'SDL_CreateTexture')
    .asFunction<PtrTexture Function(PtrRenderer, int, int, int, int)>();

SDL_Texture? SDL_CreateTexture(
    SDL_Renderer renderer, int format, SDL_TextureAccess access, int w, int h) {
  final pointer = _SDL_CreateTexture(renderer.ptr, format, access.value, w, h);
  return SDL_Texture.fromPointer(pointer);
}

final _SDL_CreateTextureFromSurface = libSdl
    .nativeFn<PtrTexture Function(PtrRenderer, PtrSurface)>(
        'SDL_CreateTextureFromSurface')
    .asFunction<PtrTexture Function(PtrRenderer, PtrSurface)>();

SDL_Texture SDL_CreateTextureFromSurface(
    SDL_Renderer renderer, SDL_Surface surface) {
  final pointer = _SDL_CreateTextureFromSurface(renderer.ptr, surface.ptr);
  return SDL_Texture.fromPointer(pointer);
}

final _SDL_QueryTexture = libSdl
    .nativeFn<Int Function(PtrTexture, PtrUint32, PtrInt, PtrInt, PtrInt)>(
        'SDL_QueryTexture')
    .asFunction<int Function(PtrTexture, PtrUint32, PtrInt, PtrInt, PtrInt)>();

typedef QueryTexture = ({int format, SDL_TextureAccess access, int w, int h});

QueryTexture? SDL_QueryTexture(SDL_Texture texture) {
  final format = malloc<Uint32>();
  final access = malloc<Int>();
  final w = malloc<Int>();
  final h = malloc<Int>();
  final result = _SDL_QueryTexture(texture.ptr, format, access, w, h);
  malloc.free(format);
  malloc.free(access);
  malloc.free(w);
  malloc.free(h);
  final accessValue =
      SDL_TextureAccess.values.firstWhere((e) => e.value == access.value);
  return result == 0
      ? (format: format.value, access: accessValue, w: w.value, h: h.value)
      : null;
}

final _SDL_SetTextureColorMod = libSdl
    .nativeFn<Int Function(PtrTexture, Uint8, Uint8, Uint8)>(
        'SDL_SetTextureColorMod')
    .asFunction<int Function(PtrTexture, int, int, int)>();

int SDL_SetTextureColorMod(SDL_Texture texture, int r, int g, int b) {
  return _SDL_SetTextureColorMod(texture.ptr, r, g, b);
}

// int SDL_GetTextureColorMod(SDL_Texture * texture,
// int SDL_SetTextureAlphaMod(SDL_Texture * texture,
// int SDL_GetTextureAlphaMod(SDL_Texture * texture,
// int SDL_SetTextureBlendMode(SDL_Texture * texture,
// int SDL_GetTextureBlendMode(SDL_Texture * texture,

final _SDL_SetTextureScaleMode = libSdl
    .nativeFn<Int Function(PtrTexture, Int)>('SDL_SetTextureScaleMode')
    .asFunction<int Function(PtrTexture, int)>();

int SDL_SetTextureScaleMode(SDL_Texture texture, SDL_ScaleMode scaleMode) {
  return _SDL_SetTextureScaleMode(texture.ptr, scaleMode.value);
}

// int SDL_GetTextureScaleMode(SDL_Texture * texture,
// int SDL_SetTextureUserData(SDL_Texture * texture,
// void * SDL_GetTextureUserData(SDL_Texture * texture);
// int SDL_UpdateTexture(SDL_Texture * texture,
// int SDL_UpdateYUVTexture(SDL_Texture * texture,
// int SDL_UpdateNVTexture(SDL_Texture * texture,
// int SDL_LockTexture(SDL_Texture * texture,
// int SDL_LockTextureToSurface(SDL_Texture *texture,
// void SDL_UnlockTexture(SDL_Texture * texture);
// SDL_bool SDL_RenderTargetSupported(SDL_Renderer *renderer);
// int SDL_SetRenderTarget(SDL_Renderer *renderer,
// SDL_Texture * SDL_GetRenderTarget(SDL_Renderer *renderer);
// int SDL_RenderSetLogicalSize(SDL_Renderer * renderer, int w, int h);
// void SDL_RenderGetLogicalSize(SDL_Renderer * renderer, int *w, int *h);
// int SDL_RenderSetIntegerScale(SDL_Renderer * renderer,
// SDL_bool SDL_RenderGetIntegerScale(SDL_Renderer * renderer);
// int SDL_RenderSetViewport(SDL_Renderer * renderer,
// void SDL_RenderGetViewport(SDL_Renderer * renderer,
// int SDL_RenderSetClipRect(SDL_Renderer * renderer,
// void SDL_RenderGetClipRect(SDL_Renderer * renderer,
// SDL_bool SDL_RenderIsClipEnabled(SDL_Renderer * renderer);
// int SDL_RenderSetScale(SDL_Renderer * renderer,
// void SDL_RenderGetScale(SDL_Renderer * renderer,

final _SDL_RenderWindowToLogical = libSdl
    .nativeFn<Void Function(PtrRenderer, Int, Int, PtrFloat, PtrFloat)>(
        'SDL_RenderWindowToLogical')
    .asFunction<void Function(PtrRenderer, int, int, PtrFloat, PtrFloat)>();

SdlFPosition SDL_RenderWindowToLogical(
    SDL_Renderer renderer, int windowX, int windowY) {
  final x = calloc<Float>(), y = calloc<Float>();
  _SDL_RenderWindowToLogical(renderer.ptr, windowX, windowY, x, y);
  malloc.free(x);
  malloc.free(y);
  return (x: x.value, y: y.value);
}

final _SDL_RenderLogicalToWindow = libSdl
    .nativeFn<Void Function(PtrRenderer, Float, Float, PtrInt, PtrInt)>(
        'SDL_RenderLogicalToWindow')
    .asFunction<void Function(PtrRenderer, double, double, PtrInt, PtrInt)>();

SdlPosition SDL_RenderLogicalToWindow(
    SDL_Renderer renderer, double logicalX, double logicalY) {
  final x = calloc<Int>(), y = calloc<Int>();
  _SDL_RenderLogicalToWindow(renderer.ptr, logicalX, logicalY, x, y);
  malloc.free(x);
  malloc.free(y);
  return (x: x.value, y: y.value);
}

final _SDL_SetRenderDrawColor = libSdl
    .nativeFn<Int Function(PtrRenderer, Uint8, Uint8, Uint8, Uint8)>(
        'SDL_SetRenderDrawColor')
    .asFunction<int Function(PtrRenderer, int, int, int, int)>();

int SDL_SetRenderDrawColor(SDL_Renderer renderer, int r, int g, int b, int a) {
  return _SDL_SetRenderDrawColor(renderer.ptr, r, b, g, a);
}

final _SDL_GetRenderDrawColor = libSdl
    .nativeFn<
        Int Function(PtrRenderer, PtrUint8, PtrUint8, PtrUint8,
            PtrUint8)>('SDL_GetRenderDrawColor')
    .asFunction<
        int Function(PtrRenderer, PtrUint8, PtrUint8, PtrUint8, PtrUint8)>();

({int r, int g, int b, int a})? SDL_GetRenderDrawColor(SDL_Renderer renderer) {
  final r = malloc<Uint8>();
  final g = malloc<Uint8>();
  final b = malloc<Uint8>();
  final a = malloc<Uint8>();
  final result = _SDL_GetRenderDrawColor(renderer.ptr, r, g, b, a);
  malloc.free(r);
  malloc.free(g);
  malloc.free(b);
  malloc.free(a);
  return result == 0 ? (r: r.value, g: g.value, b: b.value, a: a.value) : null;
}

final _SDL_SetRenderDrawBlendMode = libSdl
    .nativeFn<Int Function(PtrRenderer, Int)>('SDL_SetRenderDrawBlendMode')
    .asFunction<int Function(PtrRenderer, int)>();

int SDL_SetRenderDrawBlendMode(SDL_Renderer renderer, SDL_BlendMode blendMode) {
  return _SDL_SetRenderDrawBlendMode(renderer.ptr, blendMode.value);
}

final _SDL_GetRenderDrawBlendMode = libSdl
    .nativeFn<Int Function(PtrRenderer, Pointer<Int>)>(
        'SDL_GetRenderDrawBlendMode')
    .asFunction<int Function(PtrRenderer, Pointer<Int>)>();

SDL_BlendMode? SDL_GetRenderDrawBlendMode(SDL_Renderer renderer) {
  final pointer = malloc<Int>();
  final result = _SDL_GetRenderDrawBlendMode(renderer.ptr, pointer);
  malloc.free(pointer);
  return result == 0
      ? SDL_BlendMode.values.firstWhere((e) => e.value == pointer.value)
      : null;
}

final _SDL_RenderClear = libSdl
    .nativeFn<Int Function(PtrRenderer)>('SDL_RenderClear')
    .asFunction<int Function(PtrRenderer)>();

int SDL_RenderClear(SDL_Renderer renderer) {
  return _SDL_RenderClear(renderer.ptr);
}

final _SDL_RenderDrawPoint = libSdl
    .nativeFn<Int Function(PtrRenderer, Int, Int)>('SDL_RenderDrawPoint')
    .asFunction<int Function(PtrRenderer, int, int)>();

int SDL_RenderDrawPoint(SDL_Renderer renderer, int x, int y) {
  return _SDL_RenderDrawPoint(renderer.ptr, x, y);
}

final _SDL_RenderDrawPoints = libSdl
    .nativeFn<Int Function(PtrRenderer, PtrPoint, Int)>('SDL_RenderDrawPoints')
    .asFunction<int Function(PtrRenderer, PtrPoint, int)>();

int SDL_RenderDrawPoints(SDL_Renderer renderer, List<SDL_Point> points) {
  final pointer = malloc<Ext_SDL_Point>(points.length);
  for (var i = 0; i < points.length; ++i) {
    pointer[i].set(points[i]);
  }
  final result = _SDL_RenderDrawPoints(renderer.ptr, pointer, points.length);
  malloc.free(pointer);
  return result;
}

final _SDL_RenderDrawLine = libSdl
    .nativeFn<Int Function(PtrRenderer, Int, Int, Int, Int)>(
        'SDL_RenderDrawLine')
    .asFunction<int Function(PtrRenderer, int, int, int, int)>();

int SDL_RenderDrawLine(SDL_Renderer renderer, int x1, int y1, int x2, int y2) {
  return _SDL_RenderDrawLine(renderer.ptr, x1, y1, x2, y2);
}

final _SDL_RenderDrawLines = libSdl
    .nativeFn<Int Function(PtrRenderer, PtrPoint, Int)>('SDL_RenderDrawLines')
    .asFunction<int Function(PtrRenderer, PtrPoint, int)>();

int SDL_RenderDrawLines(SDL_Renderer renderer, List<SDL_Point> points) {
  final pointer = malloc<Ext_SDL_Point>(points.length);
  for (var i = 0; i < points.length; ++i) {
    pointer[i].set(points[i]);
  }
  final result = _SDL_RenderDrawLines(renderer.ptr, pointer, points.length);
  malloc.free(pointer);
  return result;
}

final _SDL_RenderDrawRect = libSdl
    .nativeFn<Int Function(PtrRenderer, PtrRect)>('SDL_RenderDrawRect')
    .asFunction<int Function(PtrRenderer, PtrRect)>();

int SDL_RenderDrawRect(SDL_Renderer renderer, SDL_Rect rect) {
  final pointer = malloc<Ext_SDL_Rect>()..ref.set(rect);
  final result = _SDL_RenderDrawRect(renderer.ptr, pointer);
  malloc.free(pointer);
  return result;
}

final _SDL_RenderDrawRects = libSdl
    .nativeFn<Int Function(PtrRenderer, PtrRect, Int)>('SDL_RenderDrawRects')
    .asFunction<int Function(PtrRenderer, PtrRect, int)>();

int SDL_RenderDrawRects(SDL_Renderer renderer, List<SDL_Rect> rects) {
  final pointer = malloc<Ext_SDL_Rect>(rects.length);
  for (var i = 0; i < rects.length; ++i) {
    pointer[i].set(rects[i]);
  }
  final result = _SDL_RenderDrawRects(renderer.ptr, pointer, rects.length);
  malloc.free(pointer);
  return result;
}

final _SDL_RenderFillRect = libSdl
    .nativeFn<Int Function(PtrRenderer, PtrRect)>('SDL_RenderFillRect')
    .asFunction<int Function(PtrRenderer, PtrRect)>();

int SDL_RenderFillRect(SDL_Renderer renderer, SDL_Rect rect) {
  final pointer = malloc<Ext_SDL_Rect>()..ref.set(rect);
  final value = _SDL_RenderFillRect(renderer.ptr, pointer);
  malloc.free(pointer);
  return value;
}

final _SDL_RenderFillRects = libSdl
    .nativeFn<Int Function(PtrRenderer, PtrRect, Int)>('SDL_RenderFillRects')
    .asFunction<int Function(PtrRenderer, PtrRect, int)>();

int SDL_RenderFillRects(SDL_Renderer renderer, List<SDL_Rect> rects) {
  final pointer = malloc<Ext_SDL_Rect>(rects.length);
  for (var i = 0; i < rects.length; ++i) {
    pointer[i].set(rects[i]);
  }
  final result = _SDL_RenderFillRects(renderer.ptr, pointer, rects.length);
  malloc.free(pointer);
  return result;
}

final _SDL_RenderCopy = libSdl
    .nativeFn<Int Function(PtrRenderer, PtrTexture, PtrRect, PtrRect)>(
        'SDL_RenderCopy')
    .asFunction<int Function(PtrRenderer, PtrTexture, PtrRect, PtrRect)>();

int SDL_RenderCopy(SDL_Renderer renderer, SDL_Texture texture,
    SDL_Rect? srcrect, SDL_Rect? dstrect) {
  final src =
      srcrect != null ? (malloc<Ext_SDL_Rect>()..ref.set(srcrect)) : nullptr;
  final dst =
      dstrect != null ? (malloc<Ext_SDL_Rect>()..ref.set(dstrect)) : nullptr;
  final result = _SDL_RenderCopy(renderer.ptr, texture.ptr, src, dst);
  malloc.free(src);
  malloc.free(dst);
  return result;
}

final _SDL_RenderCopyEx = libSdl
    .nativeFn<
        Int Function(PtrRenderer, PtrTexture, PtrRect, PtrRect, Double,
            PtrPoint, Int)>('SDL_RenderCopyEx')
    .asFunction<
        int Function(PtrRenderer, PtrTexture, PtrRect, PtrRect, double,
            PtrPoint, int)>();

int SDL_RenderCopyEx(
  SDL_Renderer renderer,
  SDL_Texture texture,
  SDL_Rect? srcrect,
  SDL_Rect? dstrect,
  double angle,
  SDL_Point? center,
  SDL_RendererFlip flip,
) {
  final src =
      srcrect != null ? (malloc<Ext_SDL_Rect>()..ref.set(srcrect)) : nullptr;
  final dst =
      dstrect != null ? (malloc<Ext_SDL_Rect>()..ref.set(dstrect)) : nullptr;
  final ctr =
      center != null ? (malloc<Ext_SDL_Point>()..ref.set(center)) : nullptr;
  final result = _SDL_RenderCopyEx(
      renderer.ptr, texture.ptr, src, dst, angle, ctr, flip.value);
  malloc.free(src);
  malloc.free(dst);
  malloc.free(ctr);
  return result;
}

final _SDL_RenderDrawPointF = libSdl
    .nativeFn<Int Function(PtrRenderer, Float, Float)>('SDL_RenderDrawPointF')
    .asFunction<int Function(PtrRenderer, double, double)>();

int SDL_RenderDrawPointF(SDL_Renderer renderer, double x, double y) {
  return _SDL_RenderDrawPointF(renderer.ptr, x, y);
}

final _SDL_RenderDrawPointsF = libSdl
    .nativeFn<Int Function(PtrRenderer, PtrFPoint, Int)>(
        'SDL_RenderDrawPointsF')
    .asFunction<int Function(PtrRenderer, PtrFPoint, int)>();

int SDL_RenderDrawPointsF(SDL_Renderer renderer, List<SDL_FPoint> points) {
  final pointer = malloc<Ext_SDL_FPoint>(points.length);
  for (var i = 0; i < points.length; ++i) {
    pointer[i].set(points[i]);
  }
  final result = _SDL_RenderDrawPointsF(renderer.ptr, pointer, points.length);
  malloc.free(pointer);
  return result;
}

final _SDL_RenderDrawLineF = libSdl
    .nativeFn<Int Function(PtrRenderer, Float, Float, Float, Float)>(
        'SDL_RenderDrawLineF')
    .asFunction<int Function(PtrRenderer, double, double, double, double)>();

int SDL_RenderDrawLineF(
    SDL_Renderer renderer, double x1, double y1, double x2, double y2) {
  return _SDL_RenderDrawLineF(renderer.ptr, x1, y1, x2, y2);
}

final _SDL_RenderDrawLinesF = libSdl
    .nativeFn<Int Function(PtrRenderer, PtrFPoint, Int)>('SDL_RenderDrawLinesF')
    .asFunction<int Function(PtrRenderer, PtrFPoint, int)>();

int SDL_RenderDrawLinesF(SDL_Renderer renderer, List<SDL_FPoint> points) {
  final pointer = malloc<Ext_SDL_FPoint>(points.length);
  for (var i = 0; i < points.length; ++i) {
    pointer[i].set(points[i]);
  }
  return _SDL_RenderDrawLinesF(renderer.ptr, pointer, points.length);
}

// int SDL_RenderDrawLinesF(SDL_Renderer * renderer,
// int SDL_RenderDrawRectF(SDL_Renderer * renderer,
// int SDL_RenderDrawRectsF(SDL_Renderer * renderer,
// int SDL_RenderFillRectF(SDL_Renderer * renderer,
// int SDL_RenderFillRectsF(SDL_Renderer * renderer,
// int SDL_RenderCopyF(SDL_Renderer * renderer,
// int SDL_RenderCopyExF(SDL_Renderer * renderer,
// int SDL_RenderGeometry(SDL_Renderer *renderer,
// int SDL_RenderGeometryRaw(SDL_Renderer *renderer,
// int SDL_RenderReadPixels(SDL_Renderer * renderer,

final _SDL_RenderPresent = libSdl
    .nativeFn<Void Function(PtrRenderer)>('SDL_RenderPresent')
    .asFunction<void Function(PtrRenderer)>();

void SDL_RenderPresent(SDL_Renderer renderer) {
  return _SDL_RenderPresent(renderer.ptr);
}

final _SDL_DestroyTexture = libSdl
    .nativeFn<Void Function(PtrTexture)>('SDL_DestroyTexture')
    .asFunction<void Function(PtrTexture)>();

void SDL_DestroyTexture(SDL_Texture texture) {
  return _SDL_DestroyTexture(texture.ptr);
}

final _SDL_DestroyRenderer = libSdl
    .nativeFn<Void Function(PtrRenderer)>('SDL_DestroyRenderer')
    .asFunction<void Function(PtrRenderer)>();

void SDL_DestroyRenderer(SDL_Renderer renderer) {
  return _SDL_DestroyRenderer(renderer.ptr);
}

final _SDL_RenderFlush = libSdl
    .nativeFn<Int Function(PtrRenderer)>('SDL_RenderFlush')
    .asFunction<int Function(PtrRenderer)>();

int SDL_RenderFlush(SDL_Renderer renderer) {
  return _SDL_RenderFlush(renderer.ptr);
}

// int SDL_GL_BindTexture(SDL_Texture *texture, float *texw, float *texh);
// int SDL_GL_UnbindTexture(SDL_Texture *texture);
// void *SDL_RenderGetMetalLayer(SDL_Renderer * renderer);
// void *SDL_RenderGetMetalCommandEncoder(SDL_Renderer * renderer);
// int SDL_RenderSetVSync(SDL_Renderer* renderer, int vsync);

// === Binds ===================================================================

/// Flags used when creating a rendering context
abstract final class SDL_RendererFlags {
  /// The renderer is a software fallback
  static const SDL_RENDERER_SOFTWARE = 0x00000001;

  /// The renderer uses hardware acceleration
  static const SDL_RENDERER_ACCELERATED = 0x00000002;

  /// Present is synchronized with the refresh rate
  static const SDL_RENDERER_PRESENTVSYNC = 0x00000004;

  /// The renderer supports rendering to texture
  static const SDL_RENDERER_TARGETTEXTURE = 0x00000008;
}

typedef PtrRendererInfo = Pointer<Ext_SDL_RendererInfo>;

/// Information on the capabilities of a render driver or context.
final class Ext_SDL_RendererInfo extends Struct
    implements Settable<SDL_RendererInfo> {
  external PtrChar name;

  @Uint32()
  external int flags;

  @Uint32()
  external int num_texture_formats;

  @Array<Uint32>(16)
  external Array<Uint32> texture_formats;

  @Int()
  external int max_texture_width;

  @Int()
  external int max_texture_height;

  @override
  void set(SDL_RendererInfo value) => throw UnimplementedError();

  @override
  SDL_RendererInfo get() => SDL_RendererInfo(
        name.toDartString(),
        flags,
        num_texture_formats,
        List<int>.generate(
          num_texture_formats,
          (index) => texture_formats[index],
        ),
        max_texture_width,
        max_texture_height,
      );
}

/// Information on the capabilities of a render driver or context.
final class SDL_RendererInfo {
  /// The name of the renderer
  final String name;

  /// Supported ::SDL_RendererFlags
  final int flags;

  /// The number of available texture formats
  final int numTextureFormats;

  /// The available texture formats
  final List<int> textureFormats;

  /// The maximum texture width
  final int maxTextureWidth;

  /// The maximum texture height
  final int maxTextureHeight;

  SDL_RendererInfo(
    this.name,
    this.flags,
    this.numTextureFormats,
    this.textureFormats,
    this.maxTextureWidth,
    this.maxTextureHeight,
  );
}

/// The scaling mode for a texture.
enum SDL_ScaleMode {
  /// nearest pixel sampling
  SDL_ScaleModeNearest(0),

  /// linear filtering
  SDL_ScaleModeLinear(1),

  /// anisotropic filtering
  SDL_ScaleModeBest(2);

  final int value;
  const SDL_ScaleMode(this.value);
}

/// The access pattern allowed for a texture.
enum SDL_TextureAccess {
  /// Changes rarely, not lockable
  SDL_TEXTUREACCESS_STATIC(0),

  /// Changes frequently, lockable
  SDL_TEXTUREACCESS_STREAMING(1),

  /// Texture can be used as a render target
  SDL_TEXTUREACCESS_TARGET(2);

  final int value;
  const SDL_TextureAccess(this.value);
}

/// Flip constants for SDL_RenderCopyEx
enum SDL_RendererFlip {
  /// Do not flip
  SDL_FLIP_NONE(0x00000000),

  /// flip horizontally
  SDL_FLIP_HORIZONTAL(0x00000001),

  /// flip vertically
  SDL_FLIP_VERTICAL(0x00000002);

  final int value;
  const SDL_RendererFlip(this.value);
}

typedef PtrRenderer = Pointer<Ext_SDL_Renderer>;
typedef Ext_SDL_Renderer = NativeType;

final class SDL_Renderer extends PointerHolder<Ext_SDL_Renderer> {
  @override
  final PtrRenderer ptr;

  SDL_Renderer.fromPointer(this.ptr);
}

typedef PtrTexture = Pointer<Ext_SDL_Texture>;
typedef Ext_SDL_Texture = NativeType;

final class SDL_Texture extends PointerHolder<Ext_SDL_Texture> {
  @override
  final Pointer<Ext_SDL_Texture> ptr;

  SDL_Texture.fromPointer(this.ptr);
}
