// ignore_for_file: camel_case_types, non_constant_identifier_names, camel_case_extensions, constant_identifier_names

import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:sdl2/src/sdl.dart';
import 'package:sdl2/src/sdl_rect.dart';
import 'package:sdl2/src/sdl_surface.dart';
import 'package:sdl2/utils/pointer_ref.dart';

final _SDL_GetNumVideoDrivers = libSdl
    .nativeFn<Int Function()>('SDL_GetNumVideoDrivers')
    .asFunction<int Function()>();

int SDL_GetNumVideoDrivers() {
  return _SDL_GetNumVideoDrivers();
}

final _SDL_GetVideoDriver = libSdl
    .nativeFn<PtrChar Function(Int)>('SDL_GetVideoDriver')
    .asFunction<PtrChar Function(int)>();

String SDL_GetVideoDriver(int index) {
  return _SDL_GetVideoDriver(index).toDartString();
}

final _SDL_VideoInit = libSdl
    .nativeFn<Int Function(PtrChar)>('SDL_VideoInit')
    .asFunction<int Function(PtrChar)>();

int SDL_VideoInit(String driverName) {
  final pointer = driverName.toNativeChar();
  final result = _SDL_VideoInit(pointer);
  malloc.free(pointer);
  return result;
}

final _SDL_VideoQuit = libSdl
    .nativeFn<Void Function()>('SDL_VideoQuit')
    .asFunction<void Function()>();

void SDL_VideoQuit() {
  return _SDL_VideoQuit();
}

final _SDL_GetCurrentVideoDriver = libSdl
    .nativeFn<PtrChar Function()>('SDL_GetCurrentVideoDriver')
    .asFunction<PtrChar Function()>();

String SDL_GetCurrentVideoDriver() {
  return _SDL_GetCurrentVideoDriver().toDartString();
}

final _SDL_GetNumVideoDisplays = libSdl
    .nativeFn<Int Function()>('SDL_GetNumVideoDisplays')
    .asFunction<int Function()>();

int SDL_GetNumVideoDisplays() {
  return _SDL_GetNumVideoDisplays();
}

final _SDL_GetDisplayName = libSdl
    .nativeFn<PtrChar Function(Int)>('SDL_GetDisplayName')
    .asFunction<PtrChar Function(int)>();

String SDL_GetDisplayName(int displayIndex) {
  return _SDL_GetDisplayName(displayIndex).toDartString();
}

final _SDL_GetDisplayBounds = libSdl
    .nativeFn<Int Function(Int, PtrRect)>('SDL_GetDisplayBounds')
    .asFunction<int Function(int, PtrRect)>();

SDL_Rect? SDL_GetDisplayBounds(int displayIndex) {
  final pointer = malloc<Ext_SDL_Rect>();
  final result = _SDL_GetDisplayBounds(displayIndex, pointer);
  malloc.free(pointer);
  return result == 0 ? pointer.ref.get() : null;
}

final _SDL_GetDisplayUsableBounds = libSdl
    .nativeFn<Int Function(Int, PtrRect)>('SDL_GetDisplayUsableBounds')
    .asFunction<int Function(int, PtrRect)>();

SDL_Rect? SDL_GetDisplayUsableBounds(int displayIndex) {
  final pointer = malloc<Ext_SDL_Rect>();
  final result = _SDL_GetDisplayUsableBounds(displayIndex, pointer);
  malloc.free(pointer);
  return result == 0 ? pointer.ref.get() : null;
}

final _SDL_GetDisplayDPI = libSdl
    .nativeFn<Int Function(Int, PtrFloat, PtrFloat, PtrFloat)>(
        'SDL_GetDisplayDPI')
    .asFunction<int Function(int, PtrFloat, PtrFloat, PtrFloat)>();

SdlDisplayDpi? SDL_GetDisplayDPI(int displayIndex) {
  final ddpi = malloc<Float>();
  final hdpi = malloc<Float>();
  final vdpi = malloc<Float>();
  final result = _SDL_GetDisplayDPI(displayIndex, ddpi, hdpi, vdpi);
  malloc.free(ddpi);
  malloc.free(hdpi);
  malloc.free(vdpi);
  return result == 0
      ? (ddpi: ddpi.value, hdpi: hdpi.value, vdpi: vdpi.value)
      : null;
}

final _SDL_GetDisplayOrientation = libSdl
    .nativeFn<Int Function(Int)>('SDL_GetDisplayOrientation')
    .asFunction<int Function(int)>();

SDL_DisplayOrientation SDL_GetDisplayOrientation(int displayIndex) {
  final value = _SDL_GetDisplayOrientation(displayIndex);
  return SDL_DisplayOrientation.values.firstWhere((e) => e.value == value);
}

final _SDL_GetNumDisplayModes = libSdl
    .nativeFn<Int Function(Int)>('SDL_GetNumDisplayModes')
    .asFunction<int Function(int)>();

int SDL_GetNumDisplayModes(int displayIndex) {
  return _SDL_GetNumDisplayModes(displayIndex);
}

final _SDL_GetDisplayMode = libSdl
    .nativeFn<Int Function(Int, Int, PtrDisplayMode)>('SDL_GetDisplayMode')
    .asFunction<int Function(int, int, PtrDisplayMode)>();

SDL_DisplayMode? SDL_GetDisplayMode(int displayIndex, int modeIndex) {
  final pointer = malloc<Ext_SDL_DisplayMode>();
  final result = _SDL_GetDisplayMode(displayIndex, modeIndex, pointer);
  malloc.free(pointer);
  return result == 0 ? pointer.ref.get() : null;
}

final _SDL_GetDesktopDisplayMode = libSdl
    .nativeFn<Int Function(Int, PtrDisplayMode)>('SDL_GetDesktopDisplayMode')
    .asFunction<int Function(int, PtrDisplayMode)>();

SDL_DisplayMode? SDL_GetDesktopDisplayMode(int displayIndex) {
  final pointer = malloc<Ext_SDL_DisplayMode>();
  final result = _SDL_GetDesktopDisplayMode(displayIndex, pointer);
  malloc.free(pointer);
  return result == 0 ? pointer.ref.get() : null;
}

final _SDL_GetCurrentDisplayMode = libSdl
    .nativeFn<Int Function(Int, PtrDisplayMode)>('SDL_GetCurrentDisplayMode')
    .asFunction<int Function(int, PtrDisplayMode)>();

SDL_DisplayMode? SDL_GetCurrentDisplayMode(int displayIndex) {
  final pointer = malloc<Ext_SDL_DisplayMode>();
  final result = _SDL_GetCurrentDisplayMode(displayIndex, pointer);
  malloc.free(pointer);
  return result == 0 ? pointer.ref.get() : null;
}

final _SDL_GetClosestDisplayMode = libSdl
    .nativeFn<PtrDisplayMode Function(Int, PtrDisplayMode, PtrDisplayMode)>(
        'SDL_GetClosestDisplayMode')
    .asFunction<PtrDisplayMode Function(int, PtrDisplayMode, PtrDisplayMode)>();

SDL_DisplayMode? SDL_GetClosestDisplayMode(
    int displayIndex, SDL_DisplayMode mode) {
  final src = malloc<Ext_SDL_DisplayMode>()..ref.set(mode);
  final dst = malloc<Ext_SDL_DisplayMode>();
  final result = _SDL_GetClosestDisplayMode(displayIndex, src, dst);
  return result != nullptr ? result.ref.get() : null;
}

final _SDL_GetPointDisplayIndex = libSdl
    .nativeFn<Int Function(PtrPoint)>('SDL_GetPointDisplayIndex')
    .asFunction<int Function(PtrPoint)>();

int SDL_GetPointDisplayIndex(SDL_Point point) {
  final pointer = malloc<Ext_SDL_Point>()..ref.set(point);
  final result = _SDL_GetPointDisplayIndex(pointer);
  malloc.free(pointer);
  return result;
}

final _SDL_GetRectDisplayIndex = libSdl
    .nativeFn<Int Function(PtrRect)>('SDL_GetRectDisplayIndex')
    .asFunction<int Function(PtrRect)>();

int SDL_GetRectDisplayIndex(SDL_Rect rect) {
  final pointer = malloc<Ext_SDL_Rect>()..ref.set(rect);
  final result = _SDL_GetRectDisplayIndex(pointer);
  malloc.free(pointer);
  return result;
}

final _SDL_GetWindowDisplayIndex = libSdl
    .nativeFn<Int Function(PtrWindow)>('SDL_GetWindowDisplayIndex')
    .asFunction<int Function(PtrWindow)>();

int SDL_GetWindowDisplayIndex(SDL_Window window) {
  return _SDL_GetWindowDisplayIndex(window.ptr);
}

final _SDL_SetWindowDisplayMode = libSdl
    .nativeFn<Int Function(PtrWindow, PtrDisplayMode)>(
        'SDL_SetWindowDisplayMode')
    .asFunction<int Function(PtrWindow, PtrDisplayMode)>();

int SDL_SetWindowDisplayMode(SDL_Window window, SDL_DisplayMode mode) {
  final pointer = malloc<Ext_SDL_DisplayMode>()..ref.set(mode);
  print(pointer.ref.refresh_rate);
  final result = _SDL_SetWindowDisplayMode(window.ptr, pointer);
  malloc.free(pointer);
  return result;
}

final _SDL_GetWindowDisplayMode = libSdl
    .nativeFn<Int Function(PtrWindow, PtrDisplayMode)>(
        'SDL_GetWindowDisplayMode')
    .asFunction<int Function(PtrWindow, PtrDisplayMode)>();

SDL_DisplayMode? SDL_GetWindowDisplayMode(SDL_Window window) {
  final pointer = malloc<Ext_SDL_DisplayMode>();
  final result = _SDL_GetWindowDisplayMode(window.ptr, pointer);
  malloc.free(pointer);
  return result == 0 ? pointer.ref.get() : null;
}

/// void* SDL_GetWindowICCProfile(SDL_Window * window, size_t* size);

final _SDL_GetWindowPixelFormat = libSdl
    .nativeFn<Uint32 Function(PtrWindow)>('SDL_GetWindowPixelFormat')
    .asFunction<int Function(PtrWindow)>();

int SDL_GetWindowPixelFormat(SDL_Window window) {
  return _SDL_GetWindowPixelFormat(window.ptr);
}

final _SDL_CreateWindow = libSdl
    .nativeFn<PtrWindow Function(PtrChar, Int, Int, Int, Int, Uint32)>(
        'SDL_CreateWindow')
    .asFunction<PtrWindow Function(PtrChar, int, int, int, int, int)>();

SDL_Window? SDL_CreateWindow(
    String title, int x, int y, int w, int h, int flags) {
  final wTitle = title.toNativeChar();
  final pointer = _SDL_CreateWindow(wTitle, x, y, w, h, flags);
  malloc.free(wTitle);
  return pointer != nullptr ? SDL_Window.fromPointer(pointer) : null;
}

/// SDL_Window * SDL_CreateWindowFrom(const void *data);

final _SDL_GetWindowID = libSdl
    .nativeFn<Uint32 Function(PtrWindow)>('SDL_GetWindowID')
    .asFunction<int Function(PtrWindow)>();

int SDL_GetWindowID(SDL_Window window) {
  return _SDL_GetWindowID(window.ptr);
}

final _SDL_GetWindowFromID = libSdl
    .nativeFn<PtrWindow Function(Uint32)>('SDL_GetWindowFromID')
    .asFunction<PtrWindow Function(int)>();

SDL_Window? SDL_GetWindowFromID(int id) {
  final ptr = _SDL_GetWindowFromID(id);
  if (ptr == nullptr) return null;
  return SDL_Window.fromPointer(ptr);
}

final _SDL_GetWindowFlags = libSdl
    .nativeFn<Uint32 Function(PtrWindow)>('SDL_GetWindowFlags')
    .asFunction<int Function(PtrWindow)>();

int SDL_GetWindowFlags(SDL_Window window) {
  return _SDL_GetWindowFlags(window.ptr);
}

final _SDL_SetWindowTitle = libSdl
    .nativeFn<Void Function(PtrWindow, PtrChar)>('SDL_SetWindowTitle')
    .asFunction<void Function(PtrWindow, PtrChar)>();

void SDL_SetWindowTitle(SDL_Window window, String title) {
  final pointer = title.toNativeChar();
  _SDL_SetWindowTitle(window.ptr, pointer);
  malloc.free(pointer);
}

final _SDL_GetWindowTitle = libSdl
    .nativeFn<PtrChar Function(PtrWindow)>('SDL_GetWindowTitle')
    .asFunction<PtrChar Function(PtrWindow)>();

String SDL_GetWindowTitle(SDL_Window window) {
  return _SDL_GetWindowTitle(window.ptr).toDartString();
}

final _SDL_SetWindowIcon = libSdl
    .nativeFn<Void Function(PtrWindow, PtrSurface)>('SDL_SetWindowIcon')
    .asFunction<void Function(PtrWindow, PtrSurface)>();

void SDL_SetWindowIcon(SDL_Window window, SDL_Surface icon) {
  return _SDL_SetWindowIcon(window.ptr, icon.ptr);
}

/// void* SDL_SetWindowData(SDL_Window * window,
/// void  SDL_GetWindowData(SDL_Window * window,

final _SDL_SetWindowPosition = libSdl
    .nativeFn<Void Function(PtrWindow, Int, Int)>('SDL_SetWindowPosition')
    .asFunction<void Function(PtrWindow, int, int)>();

void SDL_SetWindowPosition(SDL_Window window, int x, int y) {
  return _SDL_SetWindowPosition(window.ptr, x, y);
}

final _SDL_GetWindowPosition = libSdl
    .nativeFn<Void Function(PtrWindow, PtrInt, PtrInt)>('SDL_GetWindowPosition')
    .asFunction<void Function(PtrWindow, PtrInt, PtrInt)>();

SdlPosition SDL_GetWindowPosition(SDL_Window window) {
  final x = malloc<Int>();
  final y = malloc<Int>();
  _SDL_GetWindowPosition(window.ptr, x, y);
  malloc.free(x);
  malloc.free(y);
  return (x: x.value, y: y.value);
}

final _SDL_SetWindowSize = libSdl
    .nativeFn<Void Function(PtrWindow, Int, Int)>('SDL_SetWindowSize')
    .asFunction<void Function(PtrWindow, int, int)>();

void SDL_SetWindowSize(SDL_Window window, int w, int h) {
  return _SDL_SetWindowSize(window.ptr, w, h);
}

final _SDL_GetWindowSize = libSdl
    .nativeFn<Void Function(PtrWindow, PtrInt, PtrInt)>('SDL_GetWindowSize')
    .asFunction<void Function(PtrWindow, PtrInt, PtrInt)>();

SdlSize SDL_GetWindowSize(SDL_Window window) {
  final w = malloc<Int>();
  final h = malloc<Int>();
  _SDL_GetWindowSize(window.ptr, w, h);
  malloc.free(w);
  malloc.free(h);
  return (w: w.value, h: h.value);
}

final _SDL_GetWindowBordersSize = libSdl
    .nativeFn<Int Function(PtrWindow, PtrInt, PtrInt, PtrInt, PtrInt)>(
        'SDL_GetWindowBordersSize')
    .asFunction<int Function(PtrWindow, PtrInt, PtrInt, PtrInt, PtrInt)>();

SdlBorders? SDL_GetWindowBordersSize(SDL_Window window) {
  final t = malloc<Int>(), l = malloc<Int>();
  final b = malloc<Int>(), r = malloc<Int>();
  final result = _SDL_GetWindowBordersSize(window.ptr, t, l, b, r);
  malloc.free(t);
  malloc.free(l);
  malloc.free(b);
  malloc.free(r);
  return result == 0
      ? (top: t.value, left: l.value, bottom: b.value, right: r.value)
      : null;
}

final _SDL_GetWindowSizeInPixels = libSdl
    .nativeFn<Void Function(PtrWindow, PtrInt, PtrInt)>(
        'SDL_GetWindowSizeInPixels')
    .asFunction<void Function(PtrWindow, PtrInt, PtrInt)>();

SdlSize? SDL_GetWindowSizeInPixels(SDL_Window window) {
  final w = malloc<Int>(), h = malloc<Int>();
  _SDL_GetWindowSizeInPixels(window.ptr, w, h);
  malloc.free(w);
  malloc.free(h);
  return w != nullptr && h != nullptr ? (w: w.value, h: h.value) : null;
}

final _SDL_SetWindowMinimumSize = libSdl
    .nativeFn<Void Function(PtrWindow, Int, Int)>('SDL_SetWindowMinimumSize')
    .asFunction<void Function(PtrWindow, int, int)>();

void SDL_SetWindowMinimumSize(SDL_Window window, int minW, int minH) {
  _SDL_SetWindowMinimumSize(window.ptr, minW, minH);
}

final _SDL_GetWindowMinimumSize = libSdl
    .nativeFn<Void Function(PtrWindow, PtrInt, PtrInt)>(
        'SDL_GetWindowMinimumSize')
    .asFunction<void Function(PtrWindow, PtrInt, PtrInt)>();

SdlSize? SDL_GetWindowMinimumSize(SDL_Window window) {
  final w = malloc<Int>();
  final h = malloc<Int>();
  _SDL_GetWindowMinimumSize(window.ptr, w, h);
  malloc.free(w);
  malloc.free(h);
  return w != nullptr && h != nullptr ? (w: w.value, h: h.value) : null;
}

final _SDL_SetWindowMaximumSize = libSdl
    .nativeFn<Void Function(PtrWindow, Int, Int)>('SDL_SetWindowMaximumSize')
    .asFunction<void Function(PtrWindow, int, int)>();

void SDL_SetWindowMaximumSize(SDL_Window window, int maxW, int maxH) {
  _SDL_SetWindowMaximumSize(window.ptr, maxW, maxH);
}

final _SDL_GetWindowMaximumSize = libSdl
    .nativeFn<Void Function(PtrWindow, PtrInt, PtrInt)>(
        'SDL_GetWindowMaximumSize')
    .asFunction<void Function(PtrWindow, PtrInt, PtrInt)>();

SdlSize? SDL_GetWindowMaximumSize(SDL_Window window) {
  final w = malloc<Int>();
  final h = malloc<Int>();
  _SDL_GetWindowMaximumSize(window.ptr, w, h);
  malloc.free(w);
  malloc.free(h);
  return w != nullptr && h != nullptr ? (w: w.value, h: h.value) : null;
}

final _SDL_SetWindowBordered = libSdl
    .nativeFn<Void Function(PtrWindow, Bool)>('SDL_SetWindowBordered')
    .asFunction<void Function(PtrWindow, bool)>();

void SDL_SetWindowBordered(SDL_Window window, bool bordered) {
  return _SDL_SetWindowBordered(window.ptr, bordered);
}

final _SDL_SetWindowResizable = libSdl
    .nativeFn<Void Function(PtrWindow, Bool)>('SDL_SetWindowResizable')
    .asFunction<void Function(PtrWindow, bool)>();

void SDL_SetWindowResizable(SDL_Window window, bool resizable) {
  return _SDL_SetWindowResizable(window.ptr, resizable);
}

final _SDL_SetWindowAlwaysOnTop = libSdl
    .nativeFn<Void Function(PtrWindow, Bool)>('SDL_SetWindowAlwaysOnTop')
    .asFunction<void Function(PtrWindow, bool)>();

void SDL_SetWindowAlwaysOnTop(SDL_Window window, bool onTop) {
  return _SDL_SetWindowAlwaysOnTop(window.ptr, onTop);
}

final _SDL_ShowWindow = libSdl
    .nativeFn<Void Function(PtrWindow)>('SDL_ShowWindow')
    .asFunction<void Function(PtrWindow)>();

void SDL_ShowWindow(SDL_Window window) {
  return _SDL_ShowWindow(window.ptr);
}

final _SDL_HideWindow = libSdl
    .nativeFn<Void Function(PtrWindow)>('SDL_HideWindow')
    .asFunction<void Function(PtrWindow)>();

void SDL_HideWindow(SDL_Window window) {
  return _SDL_HideWindow(window.ptr);
}

final _SDL_RaiseWindow = libSdl
    .nativeFn<Void Function(PtrWindow)>('SDL_RaiseWindow')
    .asFunction<void Function(PtrWindow)>();

void SDL_RaiseWindow(SDL_Window window) {
  return _SDL_RaiseWindow(window.ptr);
}

final _SDL_MaximizeWindow = libSdl
    .nativeFn<Void Function(PtrWindow)>('SDL_MaximizeWindow')
    .asFunction<void Function(PtrWindow)>();

void SDL_MaximizeWindow(SDL_Window window) {
  return _SDL_MaximizeWindow(window.ptr);
}

final _SDL_MinimizeWindow = libSdl
    .nativeFn<Void Function(PtrWindow)>('SDL_MinimizeWindow')
    .asFunction<void Function(PtrWindow)>();

void SDL_MinimizeWindow(SDL_Window window) {
  return _SDL_MinimizeWindow(window.ptr);
}

final _SDL_RestoreWindow = libSdl
    .nativeFn<Void Function(PtrWindow)>('SDL_RestoreWindow')
    .asFunction<void Function(PtrWindow)>();

void SDL_RestoreWindow(SDL_Window window) {
  return _SDL_RestoreWindow(window.ptr);
}

final _SDL_SetWindowFullscreen = libSdl
    .nativeFn<Int Function(PtrWindow, Uint32)>('SDL_SetWindowFullscreen')
    .asFunction<int Function(PtrWindow, int)>();

int SDL_SetWindowFullscreen(SDL_Window window, int flags) {
  return _SDL_SetWindowFullscreen(window.ptr, flags);
}

final _SDL_HasWindowSurface = libSdl
    .nativeFn<Bool Function(PtrWindow)>('SDL_HasWindowSurface')
    .asFunction<bool Function(PtrWindow)>();

bool SDL_HasWindowSurface(SDL_Window window) {
  return _SDL_HasWindowSurface(window.ptr);
}

final _SDL_GetWindowSurface = libSdl
    .nativeFn<PtrSurface Function(PtrWindow)>('SDL_GetWindowSurface')
    .asFunction<PtrSurface Function(PtrWindow)>();

SDL_Surface SDL_GetWindowSurface(SDL_Window window) {
  final ptr = _SDL_GetWindowSurface(window.ptr);
  return SDL_Surface.fromPointer(ptr);
}

/// int SDL_UpdateWindowSurface(SDL_Window * window);
/// int SDL_UpdateWindowSurfaceRects(SDL_Window * window,
/// int SDL_DestroyWindowSurface(SDL_Window *window);
/// void SDL_SetWindowGrab(SDL_Window * window,
/// void SDL_SetWindowKeyboardGrab(SDL_Window * window,
/// void SDL_SetWindowMouseGrab(SDL_Window * window,
/// SDL_bool SDL_GetWindowGrab(SDL_Window * window);
/// SDL_bool SDL_GetWindowKeyboardGrab(SDL_Window * window);
/// SDL_bool SDL_GetWindowMouseGrab(SDL_Window * window);
/// SDL_Window * SDL_GetGrabbedWindow(void);
/// int SDL_SetWindowMouseRect(SDL_Window * window, const SDL_Rect * rect);
/// const SDL_Rect * SDL_GetWindowMouseRect(SDL_Window * window);
/// int SDL_SetWindowBrightness(SDL_Window * window, float brightness);
/// float SDL_GetWindowBrightness(SDL_Window * window);

final _SDL_SetWindowOpacity = libSdl
    .nativeFn<Int Function(PtrWindow, Float)>('SDL_SetWindowOpacity')
    .asFunction<int Function(PtrWindow, double)>();

int SDL_SetWindowOpacity(SDL_Window window, double opacity) {
  return _SDL_SetWindowOpacity(window.ptr, opacity);
}

final _SDL_GetWindowOpacity = libSdl
    .nativeFn<Int Function(PtrWindow, PtrFloat)>('SDL_GetWindowOpacity')
    .asFunction<int Function(PtrWindow, PtrFloat)>();

double? SDL_GetWindowOpacity(SDL_Window window) {
  final outOpacity = malloc<Float>();
  final result = _SDL_GetWindowOpacity(window.ptr, outOpacity);
  malloc.free(outOpacity);
  return result == 0 ? outOpacity.value : null;
}

/// int SDL_SetWindowModalFor(SDL_Window * modal_window, SDL_Window * parent_window);
/// int SDL_SetWindowInputFocus(SDL_Window * window);
/// int SDL_SetWindowGammaRamp(SDL_Window * window,
/// int SDL_GetWindowGammaRamp(SDL_Window * window,
/// int SDL_SetWindowHitTest(SDL_Window * window,

final _SDL_FlashWindow = libSdl
    .nativeFn<Int Function(PtrWindow, Int)>('SDL_FlashWindow')
    .asFunction<int Function(PtrWindow, int)>();

int SDL_FlashWindow(SDL_Window window, SDL_FlashOperation operation) {
  return _SDL_FlashWindow(window.ptr, operation.value);
}

final _SDL_DestroyWindow = libSdl
    .nativeFn<Void Function(PtrWindow)>('SDL_DestroyWindow')
    .asFunction<void Function(PtrWindow)>();

void SDL_DestroyWindow(SDL_Window window) {
  return _SDL_DestroyWindow(window.ptr);
}

final _SDL_IsScreenSaverEnabled = libSdl
    .nativeFn<Bool Function()>('SDL_IsScreenSaverEnabled')
    .asFunction<bool Function()>();

bool SDL_IsScreenSaverEnabled() {
  return _SDL_IsScreenSaverEnabled();
}

final _SDL_EnableScreenSaver = libSdl
    .nativeFn<Void Function()>('SDL_EnableScreenSaver')
    .asFunction<void Function()>();

void SDL_EnableScreenSaver() {
  return _SDL_EnableScreenSaver();
}

final _SDL_DisableScreenSaver = libSdl
    .nativeFn<Void Function()>('SDL_DisableScreenSaver')
    .asFunction<void Function()>();

void SDL_DisableScreenSaver() {
  return _SDL_DisableScreenSaver();
}

/// int SDL_GL_LoadLibrary(const char *path);
/// void  SDL_GL_GetProcAddress(const char *proc);
/// void SDL_GL_UnloadLibrary(void);
/// SDL_bool SDL_GL_ExtensionSupported(const char
/// void SDL_GL_ResetAttributes(void);
/// int SDL_GL_SetAttribute(SDL_GLattr attr, int value);
/// int SDL_GL_GetAttribute(SDL_GLattr attr, int *value);
/// SDL_GLContext SDL_GL_CreateContext(SDL_Window *
/// int SDL_GL_MakeCurrent(SDL_Window * window,
/// SDL_Window* SDL_GL_GetCurrentWindow(void);
/// SDL_GLContext SDL_GL_GetCurrentContext(void);
/// void SDL_GL_GetDrawableSize(SDL_Window * window, int *w,
/// int SDL_GL_SetSwapInterval(int interval);
/// int SDL_GL_GetSwapInterval(void);
/// void SDL_GL_SwapWindow(SDL_Window * window);
/// void SDL_GL_DeleteContext(SDL_GLContext context);

// === Binds ===================================================================

typedef PtrDisplayMode = Pointer<Ext_SDL_DisplayMode>;
final class Ext_SDL_DisplayMode extends Struct {
  @Uint32()
  external int format;
  @Int()
  external int w, h;
  @Int()
  external int refresh_rate;
  external PtrVoid driverdata;

  SDL_DisplayMode get() =>
      SDL_DisplayMode(format, w, h, refresh_rate, driverdata);
  void set(SDL_DisplayMode v) => this
    ..format = v.format
    ..w = v.width
    ..h = v.height
    ..refresh_rate = v.refreshRate
    ..driverdata = v.driverData;
}

/// The structure that defines a display mode
///
/// [SDL_GetNumDisplayModes]
/// [SDL_GetDisplayMode]
/// [SDL_GetDesktopDisplayMode]
/// [SDL_GetCurrentDisplayMode]
/// [SDL_GetClosestDisplayMode]
/// [SDL_SetWindowDisplayMode]
/// [SDL_GetWindowDisplayMode]
final class SDL_DisplayMode {
  /// pixel format
  final int format;

  /// width, in screen coordinates
  final int width;

  /// height, in screen coordinates
  final int height;

  /// refresh rate (or zero for unspecified)
  final int refreshRate;

  /// driver-specific data, initialize to 0
  final PtrVoid driverData;

  SDL_DisplayMode(
    this.format,
    this.width,
    this.height,
    this.refreshRate, [
    PtrVoid? driverData,
  ]) : driverData = driverData ?? nullptr;

  @override
  String toString() => '(${width}x$height : $refreshRate, $format)';
}

typedef PtrWindow = Pointer<Ext_SDL_Window>;
typedef Ext_SDL_Window = NativeType;

final class SDL_Window {
  final PtrWindow ptr;

  SDL_Window.fromPointer(this.ptr);
}

/// The flags on a window
///
/// [SDL_GetWindowFlags()]
abstract final class SDL_WindowFlags {
  /// fullscreen window
  static const SDL_WINDOW_FULLSCREEN = 0x00000001;

  /// window usable with OpenGL context
  static const SDL_WINDOW_OPENGL = 0x00000002;

  /// window is visible
  static const SDL_WINDOW_SHOWN = 0x00000004;

  /// window is not visible
  static const SDL_WINDOW_HIDDEN = 0x00000008;

  /// no window decoration
  static const SDL_WINDOW_BORDERLESS = 0x00000010;

  /// window can be resized
  static const SDL_WINDOW_RESIZABLE = 0x00000020;

  /// window is minimized
  static const SDL_WINDOW_MINIMIZED = 0x00000040;

  /// window is maximized
  static const SDL_WINDOW_MAXIMIZED = 0x00000080;

  /// window has grabbed mouse input
  static const SDL_WINDOW_MOUSE_GRABBED = 0x00000100;

  /// window has input focus
  static const SDL_WINDOW_INPUT_FOCUS = 0x00000200;

  /// window has mouse focus
  static const SDL_WINDOW_MOUSE_FOCUS = 0x00000400;
  static const SDL_WINDOW_FULLSCREEN_DESKTOP =
      (SDL_WINDOW_FULLSCREEN | 0x00001000);

  /// window not created by SDL
  static const SDL_WINDOW_FOREIGN = 0x00000800;

  /// window should be created in high-DPI mode if supported.
  /// On macOS NSHighResolutionCapable must be set true in the
  /// application's Info.plist for this to have any effect.
  static const SDL_WINDOW_ALLOW_HIGHDPI = 0x00002000;

  /// window has mouse captured (unrelated to MOUSE_GRABBED)
  static const SDL_WINDOW_MOUSE_CAPTURE = 0x00004000;

  /// window should always be above others
  static const SDL_WINDOW_ALWAYS_ON_TOP = 0x00008000;

  /// window should not be added to the taskbar
  static const SDL_WINDOW_SKIP_TASKBAR = 0x00010000;

  /// window should be treated as a utility window
  static const SDL_WINDOW_UTILITY = 0x00020000;

  /// window should be treated as a tooltip
  static const SDL_WINDOW_TOOLTIP = 0x00040000;

  /// window should be treated as a popup menu
  static const SDL_WINDOW_POPUP_MENU = 0x00080000;

  /// window has grabbed keyboard input
  static const SDL_WINDOW_KEYBOARD_GRABBED = 0x00100000;

  /// window usable for Vulkan surface
  static const SDL_WINDOW_VULKAN = 0x10000000;

  /// window usable for Metal view
  static const SDL_WINDOW_METAL = 0x20000000;

  /// equivalent to SDL_WINDOW_MOUSE_GRABBED for compatibility
  static const SDL_WINDOW_INPUT_GRABBED = SDL_WINDOW_MOUSE_GRABBED;
}

/// Used to indicate that you don't care what the window position is.
const SDL_WINDOWPOS_UNDEFINED_MASK = 0x1FFF0000;
int SDL_WINDOWPOS_UNDEFINED_DISPLAY(int x) =>
    (SDL_WINDOWPOS_UNDEFINED_MASK | x);
const SDL_WINDOWPOS_UNDEFINED = SDL_WINDOWPOS_UNDEFINED_MASK | 0;
bool SDL_WINDOWPOS_ISUNDEFINED(int x) =>
    ((x & 0xFFFF0000) == SDL_WINDOWPOS_UNDEFINED_MASK);

/// Used to indicate that the window position should be centered.
const SDL_WINDOWPOS_CENTERED_MASK = 0x2FFF0000;
int SDL_WINDOWPOS_CENTERED_DISPLAY(int x) => (SDL_WINDOWPOS_CENTERED_MASK | x);
const SDL_WINDOWPOS_CENTERED = SDL_WINDOWPOS_CENTERED_MASK | 0;
bool SDL_WINDOWPOS_ISCENTERED(int x) =>
    ((x & 0xFFFF0000) == SDL_WINDOWPOS_CENTERED_MASK);

/// Display orientation
enum SDL_DisplayOrientation {
  /// The display orientation can't be determined
  SDL_ORIENTATION_UNKNOWN(0),

  /// The display is in landscape mode, with the right side up, relative to portrait mode
  SDL_ORIENTATION_LANDSCAPE(1),

  /// The display is in landscape mode, with the left side up, relative to portrait mode
  SDL_ORIENTATION_LANDSCAPE_FLIPPED(2),

  /// The display is in portrait mode
  SDL_ORIENTATION_PORTRAIT(3),

  /// The display is in portrait mode, upside down
  SDL_ORIENTATION_PORTRAIT_FLIPPED(4);

  final int value;
  const SDL_DisplayOrientation(this.value);
}

/// Window flash operation
enum SDL_FlashOperation {
  /// Cancel any window flash state
  SDL_FLASH_CANCEL(0),

  /// Flash the window briefly to get attention
  SDL_FLASH_BRIEFLY(1),

  /// Flash the window until it gets focus
  SDL_FLASH_UNTIL_FOCUSED(2);

  final int value;
  const SDL_FlashOperation(this.value);
}
