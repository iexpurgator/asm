INCLUDE Irvine32.inc
INCLUDE Macros.inc

.DATA

.CODE
main PROC
	CALL readInt
	mov ecx, eax
	mov eax, 0 ;ebx = 0
	mov ebx, 1 ;eax = 1
	L1:
		CALL writeDec ;print eax
		add ebx, eax ;ebx += eax
		push eax ;push eax to stack
		mov eax, ebx ;eax = ebx
		pop ebx ;pop tack to ebx
		mWrite 32 ;print space
	LOOP L1
	push 0
	call ExitProcess
main ENDP
END main