section	.note.GNU-stack

section .text
	global	ft_strdup
	extern	malloc
	extern	ft_strlen

ft_strdup:
	push	rbp
	mov	rbp,	rsp
	push	rbx
	lea	rbx,	[rdi]
	call	ft_strlen
	mov	rdi,	rax
	inc	rdi
	call	malloc wrt ..plt
	cmp	rax,	0
	je	return_error
	mov	rcx,	0
check_loop_cpy:
	cmp	[rbx+rcx],	byte 0
	je	return_cpy
	mov	dl,	byte [rbx+rcx]
	mov	[rax+rcx],	dl
	inc	rcx
	jmp	check_loop_cpy
return_cpy:
	pop	rbx
	mov	[rax+rcx],	byte 0
	mov	rsp,	rbp
	pop	rbp
	ret
return_error:
	pop	rbx
	mov	rsp,	rbp
	pop	rbp
	ret
