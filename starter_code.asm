.orig x3000
;this stack lab computes the polish notation of a set of calls
;push_val(4) pushes the value 4 onto the stack [4]


;push_val(3) pushes the value 3 onto the stack [4,3]



;push_val(2) pushes the value 2 onto the stack [4,3,2]



;add_val() pop 3,2 and push the result of 3+2 onto the stack [4,5]



;add_val() pop 4,5 and push the result of 4+5 onto the stack[9]




;move the top value of the stack into r4
.end





.orig x3400 ;;push_val(int val)implement your push function that will push a value onto the stack





.end
.orig x3800 ;; add_val() pops two values from the top of the stack and pushes the result of adding the poppped value into the stack





.end



.orig x4200 ;;data you might need

.end


