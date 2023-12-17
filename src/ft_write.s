global	ft_write
extern	__errno_location

ft_write:
	push	rbp
	mov	rbp,	rsp
	mov	rax,	1
	syscall
	cmp	rax,	0
	jge	no_error
	mov	rbx,	rax
	xor	rbx,	0xffffffffffffffff
	inc	rbx
	call	__errno_location wrt ..plt
	mov	[rax],	rbx
	mov	rax,	-1
no_error:
	mov	rsp,	rbp
	pop	rbp
	ret