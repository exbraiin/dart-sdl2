import 'package:sdl2/sdl2.dart';

void main(List<String> arguments) {
  SDL_Init(SDL_INIT_EVERYTHING);

  print(SDL_GetBasePath());
  print(SDL_GetPrefPath('exbrain', 'testing'));

  print(SDL_GameControllerNumMappings());
  print(SDL_GameControllerGetAxisFromString('leftx'));

  final controller = SDL_GameControllerOpen(0);
  if (controller != null) {
    print(SDL_GameControllerName(controller));
  }

  final window = SDL_CreateWindow(
    'Some amazing title?',
    SDL_WINDOWPOS_CENTERED,
    SDL_WINDOWPOS_CENTERED,
    600,
    480,
    SDL_WindowFlags.SDL_WINDOW_SHOWN | SDL_WindowFlags.SDL_WINDOW_RESIZABLE,
  );
  if (window == null) {
    print(SDL_GetError());
    SDL_Quit();
    return;
  }

  final renderer = SDL_CreateRenderer(
    window,
    0,
    SDL_RendererFlags.SDL_RENDERER_SOFTWARE,
  );
  if (renderer == null) {
    print(SDL_GetError());
    SDL_DestroyWindow(window);
    SDL_Quit();
    return;
  }

  final icon = SDL_CreateRGBSurface(0, 32, 32, 32, 0, 0, 0, 0);
  if (icon != null) {
    SDL_FillRect(icon, null, 0xAA0000);
    SDL_FillRect(icon, SDL_Rect(4, 4, 32 - 8, 32 - 8), 0x00AA00);
    SDL_SetWindowIcon(window, icon);
  }

  final image = IMG_LoadTexture(renderer, 'images/img.png');
  final iconTex = SDL_CreateTextureFromSurface(renderer, icon!);

  print(SDL_QueryTexture(iconTex));
  if (image != null) print(SDL_QueryTexture(image));
  print(SDL_GetError());

  var gameOver = false;
  while (!gameOver) {
    if (_pollEvents()) {
      gameOver = true;
      break;
    }
    if (image != null) {
      _render(renderer, image, iconTex);
    }
  }

  print(SDL_GetError());

  IMG_Quit();
  if (controller != null) SDL_GameControllerClose(controller);
  SDL_DestroyTexture(iconTex);
  SDL_DestroyRenderer(renderer);
  SDL_DestroyWindow(window);
  SDL_Quit();
}

bool _pollEvents() {
  final event = SDL_PollEvent();
  if (event == null) return false;
  if (event.type == SDL_EventType.SDL_QUIT) return true;
  print('Event type: ${event.type.name}');
  return false;
}

void _render(SDL_Renderer renderer, SDL_Texture image, SDL_Texture iconTex) {
  //  === RENDER ===
  SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
  SDL_RenderClear(renderer);

  SDL_SetRenderDrawColor(renderer, 120, 0, 0, 255);
  SDL_RenderFillRect(renderer, SDL_Rect(10, 10, 200, 100));

  SDL_SetRenderDrawColor(renderer, 0, 0, 120, 255);
  SDL_RenderDrawPoint(renderer, 200, 200);
  SDL_RenderDrawLine(renderer, 250, 200, 300, 300);
  SDL_RenderDrawRect(renderer, SDL_Rect(220, 10, 100, 100));

  final points = List.generate(100, (i) => SDL_Point(i * 2, i * 2));
  SDL_RenderDrawLines(renderer, points);

  final rects =
      List.generate(5, (i) => SDL_Rect(10 + i * 20, 10 + i * 20, 100, 100));
  SDL_RenderDrawRects(renderer, rects);

  final fills =
      List.generate(5, (i) => SDL_Rect(10 + i * 30, 10 + i * 30, 50, 50));
  SDL_RenderFillRects(renderer, fills);

  SDL_RenderCopy(
    renderer,
    image,
    null,
    SDL_Rect(100, 300, 100, 100),
  );

  SDL_RenderCopyEx(
    renderer,
    image,
    null,
    SDL_Rect(300, 300, 100, 100),
    20,
    null,
    SDL_RendererFlip.SDL_FLIP_NONE,
  );

  SDL_RenderCopy(renderer, iconTex, null, SDL_Rect(400, 10, 100, 100));

  SDL_RenderPresent(renderer);
}
