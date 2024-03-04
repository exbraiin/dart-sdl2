// ignore_for_file: camel_case_types

import 'dart:ffi';

import 'package:ffi/ffi.dart';

typedef PtrInt = Pointer<Int>;
typedef PtrChar = Pointer<Char>;
typedef PtrVoid = Pointer<Void>;
typedef PtrFloat = Pointer<Float>;
typedef PtrUint8 = Pointer<Uint8>;
typedef PtrUint32 = Pointer<Uint32>;

typedef SdlSize = ({int w, int h});
typedef SdlPosition = ({int x, int y});
typedef SdlFPosition = ({double x, double y});
typedef SdlDisplayDpi = ({double ddpi, double hdpi, double vdpi});
typedef SdlBorders = ({int top, int left, int bottom, int right});

abstract class PointerHolder<T extends NativeType> {
  Pointer<T> get ptr;
}

abstract class Settable<E> {
  E get();
  void set(E value);
}

extension DynamicLibraryExt on DynamicLibrary {
  Pointer<NativeFunction<T>> nativeFn<T extends Function>(String symbolName) {
    return lookup<NativeFunction<T>>(symbolName);
  }
}

extension StringExt on String {
  PtrChar toNativeChar({Allocator allocator = malloc}) {
    return toNativeUtf8(allocator: allocator).cast<Char>();
  }
}

extension PointerCharExt on PtrChar {
  String toDartString({int? length}) {
    return cast<Utf8>().toDartString(length: length);
  }
}
