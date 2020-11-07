INCLUDE Irvine32.inc
INCLUDE Macros.inc

.DATA
	arr DWORD 105 DUP (?)
	minn DWORD 2147483647
	maxx DWORD 0
.CODE
main PROC
	mWrite < "Nhap so phan tu: ", 0 >
	call readInt
	push eax
	mov ecx, eax
	mWrite < "Nhap phan tu:", 10, 0 >
	mov edi, offset arr
	mov esi, edi
	L1:
		call readInt
		stosd ;store EAX into [EDI]
	LOOP L1
	pop ecx
	jmp L2
	cmin:
		mov minn, eax
		jmp cont1
	cmax:
		mov maxx, eax
		jmp cont2
	L2:
		lodsd ;load [ESI] into EAX
		cmp eax, minn
		jb cmin
	cont1:
		cmp eax, maxx
		ja cmax
	cont2:
	LOOP L2
	mWrite < "MAX: ", 0 >
	mov eax, maxx
	call writeDec
	mWrite < 10, "MIN: ", 0 >
	mov eax, minn
	call writeDec
	push 0
	call ExitProcess
main ENDP
END main
