global	ft_strdup
extern	malloc

ft_strlen:
	push	rbp
	mov	rbp,	rsp
	mov	rax,	0
	cmp	rdi,	0
	je	return
check_loop:
	cmp	[rdi+rax],	byte 0
	je	return
	inc	rax
	jmp	check_loop
return:
	mov	rsp,	rbp
	pop	rbp
	ret

return_error:
	mov	rsp,	rbp
	pop	rbp
	ret

ft_strdup:
	push	rbp
	mov	rbp,	rsp
	mov	rbx,	rdi
	call	ft_strlen
	cmp	rax,	0
	je	return_error
	mov	rdi,	rax
	inc	rdi
	call	malloc wrt ..plt
	cmp	rax,	0
	je	return_error
	mov	rcx,	0
check_loop_cpy:
	cmp	[rbx+rcx],	byte 0
	je	return_cpy
	mov	rdx,	[rbx+rcx]
	mov	[rax+rcx],	rdx
	inc	rcx
	jmp	check_loop_cpy
return_cpy:
	mov	[rax+rcx],	byte 0
	mov	rsp,	rbp
	pop	rbp
	ret