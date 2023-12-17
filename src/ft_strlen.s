global	ft_strlen

ft_strlen:
	push	rbp
	mov	rbp,	rsp
	mov	rax,	0
check_loop:
	cmp	[rdi+rax],	byte 0
	je	end_loop
	inc	rax
	jmp	check_loop
end_loop:
	mov	rsp,	rbp
	pop	rbp
	ret 