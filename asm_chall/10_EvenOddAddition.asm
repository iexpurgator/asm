INCLUDE Irvine32.inc
INCLUDE Macros.inc

.DATA
	arr DWORD 101 DUP (?)
	ev DWORD 0
	od DWORD 0
.CODE
main PROC
	mWrite < "Nhap so phan tu: ", 0 >
	call readInt
	push eax
	mov ecx, eax
	mov edi, offset arr
	mov esi, edi
	L1:
		call readInt
		stosd ;store EAX into [EDI]
	LOOP L1
	pop ecx
	L2:
		lodsd ;load [ESI] into EAX
		test eax, 1
		je ler
		add ev, eax
		jmp contd
	ler:
		add od, eax
	contd:
	LOOP L2
	mWrite < "Tong chan: ", 0 >
	mov eax, ev
	call writeDec
	mWrite < 10, "Tong le: ", 0 >
	mov eax, od
	call writeDec
	push 0
	call ExitProcess
main ENDP
END main
