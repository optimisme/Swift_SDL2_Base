import SDL

print("Initiating SDL...")

// Initialize SDL
if SDL_Init(Uint32(SDL_INIT_VIDEO)) != 0 {
    print("SDL could not initialize! SDL_Error: \(String(cString: SDL_GetError()))")
    exit(1)
}
print("SDL initialized.")

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
print("SDL window created.")

// Create renderer
let renderer = SDL_CreateRenderer(window, -1, Uint32(SDL_RENDERER_ACCELERATED.rawValue))
if renderer == nil {
    print("Renderer could not be created! SDL_Error: \(String(cString: SDL_GetError()))")
    SDL_DestroyWindow(window)
    SDL_Quit()
    exit(1)
}
print("Renderer created.")

// Main loop
print("Entering main loop.")
var isRunning = true
var event = SDL_Event()

// Variables to track rectangle position and dragging state
var fillRect = SDL_Rect(x: 200, y: 200, w: 400, h: 300)
var isDragging = false
var dragOffsetX: Int32 = 0
var dragOffsetY: Int32 = 0

while isRunning {
    while SDL_PollEvent(&event) != 0 {
        switch event.type {
        case SDL_QUIT.rawValue:
            isRunning = false
        case SDL_MOUSEBUTTONDOWN.rawValue:
            if event.button.button == SDL_BUTTON_LEFT {
                let mouseX = event.button.x
                let mouseY = event.button.y
                // Check if the click is inside the rectangle
                if (mouseX >= fillRect.x && mouseX <= fillRect.x + fillRect.w) &&
                   (mouseY >= fillRect.y && mouseY <= fillRect.y + fillRect.h) {
                    isDragging = true
                    dragOffsetX = mouseX - fillRect.x
                    dragOffsetY = mouseY - fillRect.y
                }
            }
        case SDL_MOUSEBUTTONUP.rawValue:
            if event.button.button == SDL_BUTTON_LEFT {
                isDragging = false
            }
        case SDL_MOUSEMOTION.rawValue:
            if isDragging {
                fillRect.x = event.motion.x - dragOffsetX
                fillRect.y = event.motion.y - dragOffsetY
            }
        default:
            break
        }
    }

    // Clear screen
    SDL_SetRenderDrawColor(renderer, 0, 0, 0, Uint8(SDL_ALPHA_OPAQUE))
    SDL_RenderClear(renderer)

    // Set render color to white
    SDL_SetRenderDrawColor(renderer, 255, 255, 255, Uint8(SDL_ALPHA_OPAQUE))

    // Render the rectangle
    var fillRect = SDL_Rect(x: 200, y: 200, w: 400, h: 300)
    SDL_RenderFillRect(renderer, &fillRect)

    // Update screen
    SDL_RenderPresent(renderer)

    // Delay to control frame rate
    SDL_Delay(16) // approximately 60 frames per second
}
print("Exiting main loop.")

// Clean up
SDL_DestroyRenderer(renderer)
SDL_DestroyWindow(window)
SDL_Quit()
print("SDL quit.")
