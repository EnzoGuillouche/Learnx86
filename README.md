# Learnx86
This repository stands for gathering **x86 assembly courses and exercises**.

## Setup

To code x86 programs, we will need the DOS emulator **DOSBox** and the Netwide Assembler **NASM**.

### DOSBox

1. Go to the official DOSBox website: https://www.dosbox.com/download.php?main=1
2. Download the current version: Click "Download Now" and it will redirect you to download the installer.
3. Run the installer: Double-click the downloaded .exe file.
4. Follow the setup.
5. Accept license, choose install location (default is fine), and finish the installation.

**On Windows**: Click on the ⊞ Windows key and search for 'DOSBox' to verify the installation.

**On macOS**: Press simultaneously `command + space` and search for 'DOSBox' to verify the installation.

### NASM

**On Windows**:
1. Go to the official NASM website: https://www.nasm.us/pub/nasm/releasebuilds/2.16.03/win64/
2. Download the Windows Installer (e.g., nasm-2.16.03-installer-x64.exe).
3. Run the installer: Double-click the downloaded .exe file.
4. Double-click to install NASM and follow the wizard.
5. Add NASM to PATH (if not done automatically).

**On macOS**: Install NASM via Homebrew on your terminal: `brew install nasm`

Type `nasm -v` onto your terminal to verify the installation → You should see the NASM version.

### IDE

Make sure you have an IDE like Visual Studio Code (recommended) installed on your machine, it will be easier to develop with it.<br>
If you have VSCode, install _NASM/x86_ extensions.
