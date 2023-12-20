global	ft_strlen

ft_strlen:
	push	rbp
	mov	rbp,	rsp
	mov	rax,	0
check_loop:
	cmp	[rdi+rax],	byte 0
	je	return
	inc	rax
	jmp	check_loop
return:
	mov	rsp,	rbp
	pop	rbp
	ret