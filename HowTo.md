
# Install SDL2

## macOS

1. Install [Brew](https://brew.sh/)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Install SDL2 using [Brew](https://brew.sh/)

```bash
brew install sdl2
```

## Linux

1. Install SDL2
```bash
sudo apt update
sudo apt install libsdl2-2.0-0 libsdl2-dev
sudo apt install libsdl2-image-2.0-0 libsdl2-image-dev
sudo apt install libsdl2-mixer-2.0-0 libsdl2-mixer-dev
sudo apt install libsdl2-ttf-2.0-0 libsdl2-ttf-dev
```

2. Install [Swift for linux](https://www.swift.org/install/linux/)

3. Set up **PATH** for Swift (for Ubuntu):

```bash
nano ~/.bashrc
```

Add a line at the end with "Swift package location", for example if it is located at '/home/username/swift':
```bash
export PATH=/home/username/swift/usr/bin:"${PATH}"
```

Save "~/.bashrc", and set new config:
```bash
source ~/.bashrc
```

## Windows

1. Download [SDL2-devel-?.??.?-VC.zip
](https://github.com/libsdl-org/SDL/releases/), SDL2 for Windows

2. Copy the extracted files to **C:\SDL**

3. Search for "Edit System Variables"

4. Edit "Environment Variables", and change 'Path' (from 'System Variables') to add: 'C:\SDL2\include', 'C:\SDL2\lib\x64'

5. Init a new PowerShell terminal, to check if the new variables are OK

```bash
$env:Path
```

6. Install [Swift for windows](https://www.swift.org/install/windows/winget/)

7. Set settings "System > For developers" to activate [development mode](https://learn.microsoft.com/ca-es/windows/apps/get-started/enable-your-device-for-development)

8. Install Visual Studio components

```bash
winget install --id Microsoft.VisualStudio.2022.Community --exact --force --custom "--add Microsoft.VisualStudio.Component.Windows11SDK.22000 --add Microsoft.VisualStudio.Component.VC.Tools.x86.x64"
```

9. Install Swift

```bash
winget install --id Swift.Toolchain -e
```
# Run this project

## macOS

```bash
swift build
swift run
```

## Linux

```bash
swift build
swift run
```

## Windows

```bash
swift build -Xlinker -L"C:\SDL2\lib\x64" -Xcc -I"C:\SDL2\include"
swift run -Xlinker -L"C:\SDL2\lib\x64" -Xcc -I"C:\SDL2\include"
```

# Tips

1. Create a new Swift project:

```bash
mkdir ProjectName
cd ProjectName
swift package init --type executable
```

2. Clean and rebuild:

```bash
swift package clean
swift build
```