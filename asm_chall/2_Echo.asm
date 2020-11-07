INCLUDE Irvine32.inc
INCLUDE Macros.inc

.DATA
	s BYTE ?
.CODE
main PROC
	mov edx, offset s
	mov ecx, 51
	call ReadString
	call WriteString
	push 0
	call ExitProcess
main ENDP
END main