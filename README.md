# SIMPLE-BOOTLOADER

> [!WARNING]  
> Bootloader is not finished, probably abandoned. It is capable of loading a 1 sector kernel `512 bytes` in real mode

Simple-Bootloader is more of a code-snippet for a future projects rather then a stand-alone project. Fill free to use and explore it if you need to.

The simplicity of a bootloader gives you an opportunity to understand how to load data from disk, a `kernel` ins this case.

## Usage

> [!NOTE]  
> The Makefile in this project is created for 'Windows', so some commands may need to be changed if you want it to work on Linux or any other os.

> [!NOTE]  
> The Makefile contains alias for `QEMU` installed in a custom folder.
> If you want to use Makefile, you should correct the installation path 
> of the 'QEMU_WIN' variable.

### _Dependencies:_
1. [NASM](https://www.nasm.us/)
2. Any virtualisation software
> In this project [QEMU](https://www.qemu.org/) was used.

### _Build and installation:_
1. Clone repository:
```bash
git clone https://detosis/simple-bootloader/
```
2. Build the project using the `Makefile`:
```bash
make
```
Or run `QEMU` automaticly after building:
```bash
make run 
```
_Make sure to read the notes above regarding usage_

### Some Useful Info

The Makefile creates an `.img` file, wich is a concatination of a `bootloader` and a `kernel`. 

The Kernel provided in the project does not do anything, apart of halting the CPU, but it is loaded successfully, so you can expand on it.