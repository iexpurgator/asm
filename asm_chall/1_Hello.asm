INCLUDE Irvine32.inc
INCLUDE Macros.inc

.DATA

.CODE
main PROC
	mWrite <"Hello World!", 13, 10, 0>
	push 0
	call ExitProcess
main ENDP
END main