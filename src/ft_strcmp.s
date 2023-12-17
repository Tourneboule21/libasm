global	ft_strcmp

ft_strcmp:
	push	rbp
	mov	rbp,	rsp
	mov	rbx,	0
check_loop:
	mov	rax,	[rdi+rbx]
	sub	rax,	[rsi+rbx]
	cmp	rax,	byte 0
	jne	end_loop
	cmp	[rsi+rbx],	byte 0
	je	end_loop
	inc	rbx
	jmp	check_loop
end_loop:
	mov	rsp,	rbp
	pop	rbp
	ret