global	ft_strcpy

ft_strcpy:
	push	rbp
	mov	rbp,	rsp
	mov	rax,	rdi
	mov	rbx,	0
check_loop:
	cmp	[rsi+rbx],	byte 0
	mov	r12,	[rsi+rbx]
	mov	[rax+rbx],	r12
	je	end_loop
	inc	rbx
	jmp	check_loop
end_loop:
	mov	rsp,	rbp
	pop	rbp
	ret