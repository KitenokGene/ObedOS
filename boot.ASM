org 7C00h

 start:
    cli              ;Disable interrupts (so that nothing distracts)
    xor ax, ax       ;Zero register ax
    mov ds, ax       ;Set dataSegment to zero address
    mov es, ax       ;Setting the es segment to address zero
    mov ss, ax       ;Set StackSegment to zero address
    mov sp, 07C00h   ;Point to the current top of the stack
    sti              ;Disable interrupts

  ;Cleaning screen
  mov ax, 3
  int 10h

  mov ah, 2h
  mov dh, 0 ; moving cursor
  mov dl, 0
  xor bh, bh
  int 10h

  ;Printing text 1
  mov ax, 1301h
  mov bp, message1
  mov cx, 12 ; length of the string
  mov bl, 05h ; color. 02 - green, 05 - purple
  int 10h

  ;Printing text 2
  mov dh, 1 ; moving cursor
  mov ax, 1301h
  mov bp, message2
  mov cx, 32 ; length of the string
  mov bl, 05h ; color. 02 - green, 05 - purple
  int 10h

  jmp $

message1 db 'Hello Party!',0
message2 db 'Dudnik OS by KitenokObed loaded!',0

times 510 - ($ - $$) db 0 ;Filling the remaining bytes with zeros up to the 510th byte
db 0x55, 0xAA ;Boot Signature