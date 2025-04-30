clear

# Set up paths
ROOT_DIR="$(dirname "$(realpath "$0")")"
ROOT_DIR="$(dirname "$ROOT_DIR")"
NASM="/opt/homebrew/bin/nasm"
DOSBOX_BIN="/Users/$USER/Documents/dosbox.app/Contents/MacOS/DOSBox"

# Ask the user for the directory containing the ASM file
read -p "Enter the path to the directory containing the ASM file: " GAME_DIR

# Ask the user for the ASM filename (with .asm extension)
read -p "Enter the ASM file name (e.g., helloworld.asm): " GAME_FILE

# Full path to the ASM file
GAME="$GAME_DIR/$GAME_FILE"

# Assemble the game
"$NASM" "$GAME" -f bin -o "$GAME_DIR/output.com"

# Run the game with the explicit config
"$DOSBOX_BIN" -c "MOUNT c $GAME_DIR" -c "c:" -c "output.com" #-c "exit"
