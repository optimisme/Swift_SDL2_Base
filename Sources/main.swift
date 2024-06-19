import SDL

print("Iniciant SDL...")

// Initialize SDL
if SDL_Init(Uint32(SDL_INIT_VIDEO)) != 0 {
    print("SDL could not initialize! SDL_Error: \(String(cString: SDL_GetError()))")
    exit(1)
}
print("SDL inicialitzat correctament.")

// Create window
let window = SDL_CreateWindow("SDL2 Swift Window",
                              Int32(SDL_WINDOWPOS_CENTERED_MASK),
                              Int32(SDL_WINDOWPOS_CENTERED_MASK),
                              800, 600,
                              Uint32(SDL_WINDOW_SHOWN.rawValue))
if window == nil {
    print("Window could not be created! SDL_Error: \(String(cString: SDL_GetError()))")
    SDL_Quit()
    exit(1)
}
print("Finestra creada correctament.")

// Create renderer
let renderer = SDL_CreateRenderer(window, -1, Uint32(SDL_RENDERER_ACCELERATED.rawValue))
if renderer == nil {
    print("Renderer could not be created! SDL_Error: \(String(cString: SDL_GetError()))")
    SDL_DestroyWindow(window)
    SDL_Quit()
    exit(1)
}
print("Renderer creat correctament.")

// Main loop
print("Entrant al bucle principal.")
var isRunning = true
var event = SDL_Event()
while isRunning {
    while SDL_PollEvent(&event) != 0 {
        if event.type == SDL_QUIT.rawValue {
            isRunning = false
        }
    }

    // Clear screen
    SDL_SetRenderDrawColor(renderer, 0, 0, 0, Uint8(SDL_ALPHA_OPAQUE))
    SDL_RenderClear(renderer)

    // Set render color to white
    SDL_SetRenderDrawColor(renderer, 255, 255, 255, Uint8(SDL_ALPHA_OPAQUE))
    
    // Render a white rectangle
    var fillRect = SDL_Rect(x: 200, y: 200, w: 400, h: 300)
    SDL_RenderFillRect(renderer, &fillRect)

    // Update screen
    SDL_RenderPresent(renderer)

    // Delay to control frame rate
    SDL_Delay(16) // approximately 60 frames per second
}
print("Sortint del bucle principal.")

// Destroy window and renderer
SDL_DestroyRenderer(renderer)
SDL_DestroyWindow(window)
SDL_Quit()
print("SDL finalitzat correctament.")
