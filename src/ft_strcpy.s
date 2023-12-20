global	ft_strcpy

ft_strcpy:
	push	rbp
	mov	rbp,	rsp
	mov	rcx,	0

check_loop:
	cmp	[rsi+rcx],	byte 0
	je	return
	mov	dl,	byte [rsi+rcx]
	mov	[rdi+rcx],	dl
	inc	rcx
	jmp	check_loop


return:
	mov	[rdi+rcx],	byte 0
	mov	rax,	rdi
	mov	rsp,	rbp
	pop	rbp
	ret