// ignore_for_file: camel_case_types, camel_case_extensions

import 'dart:ffi';

import 'package:sdl2/utils/pointer_ref.dart';

typedef PtrPoint = Pointer<Ext_SDL_Point>;

final class Ext_SDL_Point extends Struct implements Settable<SDL_Point> {
  @Int()
  external int x, y;

  @override
  SDL_Point get() => SDL_Point(x, y);

  @override
  void set(SDL_Point v) => this
    ..x = v.x
    ..y = v.y;
}

final class SDL_Point {
  final int x, y;

  SDL_Point(this.x, this.y);

  @override
  String toString() => '($x, $y)';
}

typedef PtrFPoint = Pointer<Ext_SDL_FPoint>;

final class Ext_SDL_FPoint extends Struct implements Settable<SDL_FPoint> {
  @Float()
  external double x, y;

  @override
  SDL_FPoint get() => SDL_FPoint(x, y);

  @override
  void set(SDL_FPoint v) => this
    ..x = x
    ..y = y;
}

final class SDL_FPoint {
  final double x, y;

  SDL_FPoint(this.x, this.y);

  @override
  String toString() => '(${x.toStringAsFixed(2)}, ${y.toStringAsFixed(2)})';
}

typedef PtrRect = Pointer<Ext_SDL_Rect>;

final class Ext_SDL_Rect extends Struct implements Settable<SDL_Rect> {
  @Int()
  external int x, y, w, h;

  @override
  SDL_Rect get() => SDL_Rect(x, y, w, h);

  @override
  void set(SDL_Rect v) => this
    ..x = v.x
    ..y = v.y
    ..w = v.w
    ..h = v.h;
}

final class SDL_Rect {
  final int x, y, w, h;

  SDL_Rect(this.x, this.y, this.w, this.h);

  @override
  String toString() => '($x, $y, $w, $h)';
}
