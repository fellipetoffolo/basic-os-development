# Basic OS development project

This is a basic projet for developing skills and notions about operating systems and everything related to this world. It will uses the qemu virtual machine and nasm as the assembler, as well as other programming tools.

## Running

To run the project, first ensure that you have installed all the dependencies (there is a script for doing so, called install_dependencies.sh)

1. Comand for generating the binary files boot.bin, kernel.bin and main_floppy.img in one step (skip if you already have it):

    ``` make ```

    Note that the Makefile includes all the current steps needed for assembling the code. Feel free to customize it as you want.

2. Command for running the program on qemu:

    ``` qemu-system-x86_64 -fda src/bootloader/main_floppy.img ```

## Versioning

The different versions will be divided by creating branches everytime one big new feature is added.

### Current version: 0.2

#### Version 0.2 (05/18/2025)

Changelog:

- Modularization of the code;
- Separation in Kernel and Bootloader;
- Creation of a floopy disk img that has the boot.bin bootloader file burned to it;
- Creationg of a minimalist file system that carries the kernel executable to run it after the initialization;
- Disk reading operation that cannot be checked at all (yet), only when running Qemu with a non-MSDOS system (try boot.bin).

Features:

- Bootloader that writes "Hello, World!" to the std output;
- Still, that's it...

#### Version 0.1 (10/28/2024)

Features:

- Bootloader that writes "Hello, World!" to the std output;
- Sorry, that's it...

## Deprecated

This section includes all of the formerly used commands/features that are not working or that are not suggested
to be used anymore.

The command

``` qemu-system-x86_64 -drive file=boot.bin,format=raw ```

was formerly used to start the VM, however the option *-drive* chose a generic file, considering it a Hard Disk, when
we actually wanted to boot from a Floppy Disk.
