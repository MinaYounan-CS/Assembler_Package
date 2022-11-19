;-------------------------------------------------------------------------------------
; program to input values for x, y and z
; and evaluate the expression - (x + y - 2z + 1)
; author:  Dr. Mina S. Younan
;-------------------------------------------------------------------------------------
.386
.MODEL FLAT
;-------------------------------------------------------------------------------------
ExitProcess PROTO NEAR32 stdcall, dwExitCode:DWORD

include io.h            ; header file for input/output

cr      equ     0dh     ; carriage return character
Lf      equ     0ah     ; line feed

.STACK  4096             ; reserve 4096-byte stack
;-------------------------------------------------------------------------------------
.DATA                   ; reserve storage for data
Prompt1   BYTE   "This program will evaluate the expression",cr,Lf,Lf
            	BYTE   "    - (x + y - 2z + 1)",cr,Lf,Lf
            	BYTE   "for your choice of integer values.",cr,Lf,Lf
            	BYTE   "Enter value for x:  ",0
Prompt2   BYTE   "Enter value for y:  ",0
Prompt3   BYTE   "Enter value for z:  ",0
Value       	BYTE   16 DUP (?)
Answer    	BYTE   cr,Lf,"The result is "
Result      	BYTE   6 DUP (?)
            	BYTE   cr,Lf,0
;-------------------------------------------------------------------------------------
.CODE                           	; start of main program code
_start:
            output Prompt1          	; prompt for x
            input  Value,16         	; read ASCII characters
            atoi   Value            	; convert to integer
            mov    dx,ax            	; x

            output Prompt2          	; prompt for y
            input  Value,16	; read ASCII characters
            atoi   Value           	; convert to integer
            add    dx,ax           	; x + y

            output Prompt3         	; prompt for z
            input  Value,16         	; read ASCII characters
            atoi   Value           	; convert to integer
            add    ax,ax           	; 2*z
            sub    dx,ax           	; x + y - 2*z
            inc    dx               	; x + y - 2*z + 1
            neg    dx              	; - (x + y - 2*z + 1)

            itoa   Result,dx        	; convert to ASCII characters
            output Answer           	; output label and result
            ;---------------------------------------------------------------------------
            INVOKE ExitProcess, 0   	; exit with return code 0
PUBLIC _start                       		; make entry point public
END                                 		; end of source code
;-------------------------------------------------------------------------------------