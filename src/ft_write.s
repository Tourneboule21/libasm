global	ft_write
extern	__errno_location

ft_write:
	push	rbp
	mov	rbp,	rsp
	mov	rax,	1
	syscall
	cmp	rax,	0
	jge	no_error
	neg	rax
	push	rax
	call	__errno_location wrt ..plt
	mov	rbx,	rax
	pop	rax
	mov	[rbx],	rax
	mov	rax,	-1
no_error:
	mov	rsp,	rbp
	pop	rbp
	ret