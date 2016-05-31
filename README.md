# musikcube

a cross-platform audio engine written in C++.

# musikbox

an ncurses frontend to musikcube.

musicbox compiles and runs easily on Windows and OSX (and Linux soon).

it looks something like this on windows:

![windows screenshot](/static/screenshots/windows.png?raw=true)

and this on osx:

![osx screenshot](/static/screenshots/osx.png?raw=true)

# compiling

## windows

- grab the [Visual Studio 2015 Community Edition](https://www.visualstudio.com/en-us/downloads/download-visual-studio-vs.aspx) and install the C++ compiler and tools. the 32-bit compiler is currently used. 
- clone the musikcube sources: `git clone https://github.com/clangen/musikcube.git`
- install the [32 bit version of boost 1.60](https://sourceforge.net/projects/boost/files/boost-binaries/1.60.0/boost_1_60_0-msvc-14.0-32.exe/download). ensure it shares the same parent directory with musikcube. e.g: `c:\src\musikcube` and `c:\src\boost_1_60_0` -- the project's solution will reference it via relative path.
- open `musikcube.sln` and build/run. 

## mac

you'll need [homebrew](http://brew.sh/) to install the required dependencies. 

- `brew install cmake boost libogg libvorbis flac mpg123 taglib`
- `git clone https://github.com/clangen/musikcube.git`
- `cd musikcube`
- `cmake .`
- `make`
- `cd bin`
- `./musikbox`

## keyboard shortcuts

the user interface is very new and will change considerably over time.

the current hotkeys are generally based around holding the alt/meta key with your left thumb, and using the home row with your right hand. 

- `<TAB>` tabs between windows
- `F1` switch to console view
- `F2` switch to library view
- `ALT+i` volume up 5%
- `ALT+k` volume down 5%
- `ALT+j` previous track
- `ALT+l` next track
- `ALT+u` back 10 seconds
- `ALT+o` forward 10 seconds
- `ALT+r` repaint the screen
- `<SPACE>` pause/resume (only in library view)
- `CTRL+p` pause/resume (globally)
- `CTRL+d` quit 

*important*: on OSX make sure you configure your terminal emulator to treat your left alt key as "+Esc" or "Meta".

# sdk

musikcube is built around its own SDK interfaces. they're still in the process of being cleaned up and slimmed down. you can see what they look like here: https://github.com/clangen/musikcube/tree/master/src/core/sdk
