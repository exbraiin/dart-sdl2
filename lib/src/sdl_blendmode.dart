// ignore_for_file: camel_case_types, constant_identifier_names

/// The blend mode used in SDL_RenderCopy() and drawing operations.
enum SDL_BlendMode {
  /// no blending dstRGBA = srcRGBA
  SDL_BLENDMODE_NONE(0x00000000),

  /// alpha blending dstRGB = (srcRGB * srcA) + (dstRGB * (1-srcA)) dstA = srcA + (dstA * (1-srcA))
  SDL_BLENDMODE_BLEND(0x00000001),

  /// additive blending dstRGB = (srcRGB * srcA) + dstRGB dstA = dstA
  SDL_BLENDMODE_ADD(0x00000002),

  /// color modulate dstRGB = srcRGB * dstRGB dstA = dstA
  SDL_BLENDMODE_MOD(0x00000004),

  /// color multiply dstRGB = (srcRGB * dstRGB) + (dstRGB * (1-srcA)) dstA = dstA
  SDL_BLENDMODE_MUL(0x00000008),

  SDL_BLENDMODE_INVALID(0x7FFFFFFF);

  final int value;
  const SDL_BlendMode(this.value);
}
