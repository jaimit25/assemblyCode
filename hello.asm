; to run nasm -f macho64 hello.asm
;ld hello.o -o hello -macosx_version_min 11.0 -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem

section .data
    msg db "Hello, world!",0x0A

section .text
    global _main

_main:
    mov rax, 0x2000004 ; system call for write
    mov rdi, 1 ; file descriptor for stdout
    lea rsi, [rel msg] ; address of string to output
    mov rdx, 14 ; number of bytes to output
    syscall ; invoke the system call

    mov rax, 0x2000001 ; system call for exit
    xor rdi, rdi ; exit status of 0
    syscall ; invoke the system call