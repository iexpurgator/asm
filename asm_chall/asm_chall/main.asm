INCLUDE /Irvine/Irvine32.inc

.data
	n DWORD ?
	s BYTE ?
.code
    main proc
		mov eax, 3
		mov ebx, 7
		add eax, ebx
		ret
	main endp
	end main