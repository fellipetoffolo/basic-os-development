# Basic OS development project

#### This is a basic projet for developing skills and notions about operating systems and everything related to this world. It will uses the qemu virtual machine and nasm as the assembler

## Running

To run the project, first ensure that you have installed all the dependencies (there is a script for doing so called install_dependencies.sh)

1.1 Comand for generating the binary file boot.bin in one step (skip if you already have it):

``` nasm -f bin -o boot.bin boot.asm ```

1.2. (Alternative that will only work when removing the "ORG 0x7c00" directive from boot.asm") Commands for generating the .bin file from the .asm file (skip this step if you already have boot.bin)

``` nasm -f elf32 -o boot.o boot.asm  ```
``` ld -m elf_i386 -o boot.bin boot.o ```
 


2. Command for running the program on qemu:

``` qemu-system-x86_64 -drive file=boot.bin,format=raw ```

## Versioning

#### The different versions will be divided by creating branches everytime one new big feature is added.

##### Current version: 0.1

##### Version 0.1 (10/28/2024) Features:

- Bootloader that writes "Hello, World!" to the stdio
- Sorry, that's it...
