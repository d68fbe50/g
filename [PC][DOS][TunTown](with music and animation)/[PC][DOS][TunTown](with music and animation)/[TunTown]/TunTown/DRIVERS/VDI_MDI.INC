;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
;лл                                                                         лл
;лл  VDI_MDI.INC                                                            лл
;лл                                                                         лл
;лл  IBM Audio Interface Library Version 3                                  лл
;лл                                                                         лл
;лл  Standard function library for Vendor Device Interface MIDI sound       лл
;лл  drivers                                                                лл
;лл                                                                         лл
;лл  Version 1.00 of 29-May-94: Initial version for AIL 3.0                 лл
;лл          1.12 of 21-Aug-94: Added C language specifier to MODEL         лл
;лл                             Added dev_name field to VDI_HDR             лл
;лл                                                                         лл
;лл  Author: John Miles                                                     лл
;лл                                                                         лл
;лл  8086 ASM source compatible with MASM or TASM                           лл
;лл                                                                         лл
;лллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
;лл                                                                         лл
;лл  Copyright (C) 1994-1995 Miles Design, Inc.                             лл
;лл                                                                         лл
;лл  Miles Design, Inc.                                                     лл
;лл  8301 Elander Drive                                                     лл
;лл  Austin, TX 78750                                                       лл
;лл                                                                         лл
;лл  (512) 345-2642 / FAX (512) 338-9630 / BBS (512) 454-9990               лл
;лл                                                                         лл
;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

                ;
                ;Preamble code for Microsoft/Borland assemblers
                ;

                IFDEF MASM

                OPTION SCOPED
                .MODEL TINY,C

                ELSE

                MODEL TINY,C
                LOCALS __   
                JUMPS       

                ENDIF

                ;
                ;Standard equates/definitions
                ;

FALSE           equ 0
TRUE            equ 1

IO_PARMS        STRUC
IP_IO_ADDR      dw ?
IP_IRQ          dw ?
IP_DMA_8        dw ?
IP_DMA_16       dw ?
IP_reserved     dd ?
                dd ?
                dd ?
                dd ?
IO_PARMS        ENDS

                .CODE

;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
;лл                                                                         лл
;лл VDI Driver Header Table (VDI_HDR)                                       лл
;лл                                                                         лл
;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

                ;
                ;Driver identification string must appear as bytes 0-7 in
                ;driver image
                ;

                db 'AIL3MDI',26

                ;
                ;Driver version
                ;

driver_version  dd 0112h

                ;
                ;I/O configuration
                ;

common_configs  dw ?
                dw ?

num_configs     dw ?

env_name        dw ?
                dw ?

IO_ADDR         dw ?                            ;IO_PARMS structure for
IRQ             dw ?                            ;driver -- explicit variables
DMA_8           dw ?                            ;used for MASM/TASM 
DMA_16          dw ?                            ;addressing compatibility
IO_reserved     dd 4 dup (?)

                ;
                ;Service rate in Hz if > 0, else no service required
                ;

service_rate    dw ?

busy            dw ?

                ;
                ;Driver number for this driver must appear as bytes 10-11
                ;in driver image
                ;
                ;(Initialized at load time)
                ;

driver_num      dw ?

                ;
                ;Vector to INT 66H function dispatcher must appear as 
                ;bytes 8-9 in driver image
                ;

                dw OFFSET INT66H_dispatch

                ;
                ;Vector to previous INT 66H handler in chain must appear as
                ;bytes 12-15 in driver image
                ;
                ;(Initialized at load time)
                ;

previous_ISR    dd ?

                ;
                ;Scratch workspace for communication between API and 
                ;VDI layers
                ;

scratch         db 128 dup (?)

                ;
                ;Device ASCII name field (V1.12 and higher)
                ;

dev_name        db DEVICE_NAME,0
                db 80-($-OFFSET dev_name) dup (0)

;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
;лл                                                                         лл
;лл Miscellaneous data                                                      лл
;лл                                                                         лл
;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

                ;
                ;Common function list for 300H-306H inclusive
                ;

DRV_fn_list     dw OFFSET FN_300H
                dw OFFSET FN_301H
                dw OFFSET FN_302H
                dw OFFSET FN_303H
                dw OFFSET FN_304H
                dw OFFSET FN_305H
                dw OFFSET FN_306H
end_DRV_list    LABEL WORD

                ;
                ;.MDI function list for 500H-506H inclusive
                ;

MDI_fn_list     dw OFFSET FN_500H
                dw OFFSET FN_501H
                dw OFFSET FN_502H
                dw OFFSET FN_503H
                dw OFFSET FN_504H
                dw OFFSET FN_505H
                dw OFFSET FN_506H
end_MDI_list    LABEL WORD

caller_AX       dw ?                    ;Copies of input/output variables
caller_BX       dw ?
caller_CX       dw ?
caller_DX       dw ?
caller_SI       dw ?
caller_DI       dw ?

;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
;лл                                                                         лл
;лл  Function: INT66H_dispatch                                              лл
;лл                                                                         лл
;лл   Purpose: INT 66H function dispatcher for .MDI driver                  лл
;лл                                                                         лл
;лл Call with: Function-dependent registers                                 лл
;лл                                                                         лл
;лл   Returns: Function-dependent registers                                 лл
;лл                                                                         лл
;лл      Uses: All registers preserved (except returned values)             лл
;лл                                                                         лл
;лл     Notes: Called externally via INT 66H                                лл
;лл                                                                         лл
;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

INT66H_dispatch PROC

                cmp ax,300h             ;pass control to former INT 66H
                jb __pass               ;handler if not .MDI function 
                cmp ax,5ffh
                ja __pass

                cmp bx,cs:driver_num    ;pass control to former INT 66H
                jne __pass              ;handler if BX != driver_num

                cli                     ;disable interrupts by default

                cmp cs:busy,0           ;return immediately if re-entrant call
                jne __return            ;or end-of-DMA ISR active

                inc cs:busy             ;set semaphore to prevent reentry

                push bp
                push es
                push ds

                push cs                 ;access CS: data via DS: and ES:
                push cs
                pop ds
                pop es

                cld

                mov caller_AX,ax        ;save caller registers for access
                mov caller_BX,bx        ;and possible modification by
                mov caller_CX,cx        ;function handlers
                mov caller_DX,dx
                mov caller_SI,si
                mov caller_DI,di

                mov caller_AX,-1        ;assume function not supported

                mov si,OFFSET DRV_fn_list
                sub ax,300h
                cmp ax,((end_DRV_list - DRV_fn_list) / 2)
                jb __do_call

                mov si,OFFSET MDI_fn_list
                sub ax,200h
                cmp ax,((end_MDI_list - MDI_fn_list) / 2)
                jae __exit

__do_call:      mov bx,ax
                add bx,bx
                call WORD PTR [bx][si]

__exit:         mov ax,caller_AX        ;restore (possibly modified)
                mov bx,caller_BX        ;caller registers
                mov cx,caller_CX
                mov dx,caller_DX
                mov si,caller_SI
                mov di,caller_DI
                
                pop ds
                pop es
                pop bp
                
                dec cs:busy

__return:       iret

__pass:         cmp WORD PTR cs:[previous_ISR],0
                jne __call_prev
                cmp WORD PTR cs:[previous_ISR+2],0
                je __return
                
__call_prev:    jmp cs:[previous_ISR]   ;call previous ISR if not NULL

INT66H_dispatch ENDP

;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
;лл                                                                         лл
;лл  Function: MDI_init                                                     лл
;лл                                                                         лл
;лл   Purpose: Initializes common driver variables; performs far pointer    лл
;лл            fixups based on driver CS: value                             лл
;лл                                                                         лл
;лл Call with: Nothing                                                      лл
;лл                                                                         лл
;лл   Returns: Nothing                                                      лл
;лл                                                                         лл
;лл      Uses: All registers                                                лл
;лл                                                                         лл
;лл     Notes: Must be called prior to any other VDI functions              лл
;лл                                                                         лл
;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

MDI_init        PROC

                ;
                ;DDT
                ;

                mov library_env+2,cs
                mov GTL_suffix+2,cs

                ;
                ;VDI_HDR
                ;

                mov common_configs+2,cs
                mov env_name+2,cs

                ret

MDI_init        ENDP

;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
;лл                                                                         лл
;лл  Function: ASC_val                                                      лл
;лл                                                                         лл
;лл   Purpose: Returns value of positive integer represented as ASCII       лл
;лл            string terminated with 0 or space                            лл
;лл                                                                         лл
;лл Call with: AX = Number base (2-16)                                      лл
;лл            BX = Offset of string in scratch[] array                     лл
;лл                                                                         лл
;лл   Returns: AX = Value of number, or -1 if invalid input                 лл
;лл            BX = Offset of first character after end of string           лл
;лл                                                                         лл
;лл      Uses: All registers                                                лл
;лл                                                                         лл
;лл     Notes: Used by function 303H (Parse Environment Variable)           лл
;лл            Skips leading whitespace                                     лл
;лл                                                                         лл
;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

ASC_val         PROC
                LOCAL base

                mov base,ax

                dec bx                  ;skip leading whitespace
__skip_l_ws:    inc bx
                mov cl,scratch[bx]
                cmp cl,' '
                je __skip_l_ws
                cmp cl,0                ;string is blank, exit w/failure
                je __bad

                mov ax,0                ;AX = accumulated value
                mov cx,0                ;CL = character input

__fetch:        mov cl,scratch[bx]      ;fetch character from string
                cmp cl,0                ;exit if end of string
                je __exit
                cmp cl,' '
                je __exit
                
                cmp cl,'0'              ;test for digits 0-9
                jl __bad
                cmp cl,'9'
                jle __num

                cmp cl,'a'              ;convert to uppercase and test for
                jb __uc                 ;characters A-F
                sub cl,'a'-'A'
__uc:           cmp cl,'F'
                jg __bad
                cmp cl,'A'
                jl __bad                ;reject if not in [0-9,A-F]

                sub cl,'A'              ;translate 'A'-'F' to 10-15
                add cl,10
                jmp __calc

__num:          sub cl,'0'              ;translate '0'-'9' to 0-9

__calc:         mul base                ;shift accumulator left...
                add ax,cx               ;...and add new digit
                inc bx
                jmp __fetch             ;fetch next digit

__bad:          mov ax,-1
__exit:         ret

ASC_val         ENDP


;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
;лл                                                                         лл
;лл  Function: VBL_sync_wait                                                лл
;лл                                                                         лл
;лл   Purpose: System- and CPU-independent delay                            лл
;лл            Waits for leading edge of vertical blanking signal           лл
;лл                                                                         лл
;лл Call with: AX = Number of vertical refresh periods to delay             лл
;лл                                                                         лл
;лл                 0: No delay                                             лл
;лл                 1: 0-20 millisecond delay                               лл
;лл                 2: 10-40 millisecond delay                              лл
;лл                 3: 20-60 millisecond delay ...                          лл
;лл                                                                         лл
;лл            Delay times are best/worst cases, and depend on CRT scan     лл
;лл            frequency and beam position at time of call                  лл
;лл                                                                         лл
;лл   Returns: Nothing                                                      лл
;лл                                                                         лл
;лл      Uses: All registers preserved                                      лл
;лл                                                                         лл
;лл     Notes: Suitable for use on systems equipped with CGA/EGA/VGA/XGA    лл
;лл            and compatible video hardware                                лл
;лл                                                                         лл
;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

VBL_sync_wait   PROC

                push cx
                push ax
                push dx
                push ds

                mov cx,ax
                jcxz __exit

                mov ax,40h              ;wait n VBL periods (14 ms/period min, 
                mov ds,ax               ;requires CGA/EGA/VGA/XGA video)

                mov dx,ds:[63h]         ;get CRTC Address register location
                add dl,6                ;get CRTC Status register location

__sync_1:       in al,dx                ;if in blanking interval, wait for
                test al,8               ;start of refresh
                jz __sync_1             

__sync_2:       in al,dx                ;if in refresh, wait for start of
                test al,8               ;blanking interval
                jnz __sync_2

                loop __sync_1

__exit:         pop ds
                pop dx
                pop ax
                pop cx

                ret
VBL_sync_wait   ENDP

