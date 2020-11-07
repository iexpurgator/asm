INCLUDE Irvine32.inc
INCLUDE Macros.inc
; uppercase
.DATA
	s BYTE ?
.CODE
main PROC
	mov edx, offset s
	mov ecx, 33
	CALL ReadString
	mov ecx, eax
	mov edi, 
	L1:
		;
	LOOP L1
	push 0
	call ExitProcess
main ENDP
END main