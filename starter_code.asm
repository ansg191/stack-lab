.orig x3000
;this stack lab computes the polish notation of a set of calls

; Setup Stack
	LD	R6,	STACK_PTR

;push_val(4) pushes the value 4 onto the stack [4]
	LD	R5,	PUSH_VAL_PTR
	AND	R0,	R0,	0
	ADD	R0,	R0,	4
	JSRR	R5

;push_val(3) pushes the value 3 onto the stack [4,3]
	AND	R0,	R0,	0
	ADD	R0,	R0,	3
	JSRR	R5


;push_val(2) pushes the value 2 onto the stack [4,3,2]
	AND	R0,	R0,	0
	ADD	R0,	R0,	2
	JSRR	R5


;add_val() pop 3,2 and push the result of 3+2 onto the stack [4,5]
	LD	R5,	ADD_VAL_PTR
	JSRR	R5


;add_val() pop 4,5 and push the result of 4+5 onto the stack[9]
	JSRR	R5

;move the top value of the stack into r4
	ADD	R6,	R6,	-1
	LDR	R4,	R6,	0

	HALT

; data
	STACK_PTR       .FILL	x4200
	PUSH_VAL_PTR    .FILL	x3400
	ADD_VAL_PTR     .FILL	x3800
.end


;------------------------------------------------------------------------------
;	Subroutine:		push_val
;	Parameter (R0):	Value to be pushed onto stack
;	Parameter (R6):	Stack Pointer
;	Postcondition:	Pushes value onto stack
;------------------------------------------------------------------------------
.orig x3400 ;;push_val(int val)implement your push function that will push a value onto the stack
	ST	R7,	BACKUP_R7_3400
	
	STR	R0,	R6,	0
	ADD	R6,	R6,	1

	LD	R7,	BACKUP_R7_3400
	RET

	; Data
		BACKUP_R7_3400  .BLKW	1
.end

;------------------------------------------------------------------------------
;	Subroutine:		add_val
;	Parameter (R6):	Stack Pointer
;	Postcondition:	Pops 2 values from the stack and pushes the result onto the stack
;------------------------------------------------------------------------------
.orig x3800 ;; add_val() pops two values from the top of the stack and pushes the result of adding the poppped value into the stack
	ST	R0,	BACKUP_R0_3800
	ST	R1,	BACKUP_R1_3800
	ST	R7,	BACKUP_R7_3800

	ADD	R6,	R6,	-1
	LDR	R0,	R6,	0
	ADD	R6,	R6,	-1
	LDR	R1,	R6,	0

	ADD	R0,	R0,	R1
	STR	R0,	R6,	0
	ADD	R6,	R6,	1

	LD	R0,	BACKUP_R0_3800
	LD	R1,	BACKUP_R1_3800
	LD	R7,	BACKUP_R7_3800
	RET

	; Data
		BACKUP_R0_3800	.BLKW	1
		BACKUP_R1_3800	.BLKW	1
		BACKUP_R7_3800	.BLKW	1


.end



.orig x4200 ;;data you might need
	STACK   .BLKW	10
.end


