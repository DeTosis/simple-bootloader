# SIMPLE-BOOTLOADER

> [!WARNING]  
> Bootloader is not finished, probably abandoned. It is capable of loading a 1 sector kernel `512 bytes` in real mode

Simple-Bootloader is more of a code snipped for a future projects rather then a stand-alone project. Fill free to use and explore it if you need to.

Simplicity of a bootloader gives you an opportunity to get an understanding of a loading data from a disk, `kernel` in this case.

## Usage

> [!NOTE]  
> Makefile in project is created for 'Windows' so some commands should be switched if you want it to work on 'Linux', or any other os.

> [!NOTE]  
> Make file contains alias for `QEMU` that is isntalled in a custom folder
> so, if you want to use Makefile you should correct the installating path 
> of a 'QEMU_WIN' variable.

### _Dependencies:_
1. [NASM](https://www.nasm.us/)
2. Any virtualisation software
> In case of Makefile in this project [QEMU](https://www.qemu.org/) was used.

### _Build and installation:_
1. Clone repository:
```bash
git clone https://detosis/simple-bootloader/
```
2. Build a project using `Makefile`:
```bash
make
```
or use:
```bash
make run # to run `QEMU` automaticly after build. *READ NOTES FOR THE USAGE FIRST*
```

### Some Useful Info

Makefile creates an `.img` file wich is a concatination of a `bootloader` and a `kernel`. 

Kernel provided in project does not do anything, apart of halting the cpu, but it is loaded successfully, so you can expand on it.