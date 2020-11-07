INCLUDE Irvine32.inc
INCLUDE Macros.inc

.DATA

.CODE
main PROC
	mWrite < "a = ", 0 >
	call readInt
	mov ebx, eax
	mWrite < "b = ", 0 >
	call readInt
	add eax, ebx
	mWrite < "a + b = ", 0 >
	call writeDec
	push 0
	call ExitProcess
main ENDP
END main
