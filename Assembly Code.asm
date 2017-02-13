.data
Prompt:      .asciiz "Enter the number\n"
result1:     .asciiz "Yes, the number is divisible by 17"
result2:     .asciiz "No, the number is not divisible by 17"
.text
main:
		li  $v0 , 4						  #issue prompt
		la  $a0 , Prompt 
		syscall
		li  $v0 , 5
		syscall
		move  $t0 , $v0					  #storing the value of $v0 in $t0
		li  $t1 , 17			    	  #storing 17 in $t1
for1:              
        bgt  $t1 , $t0 , endf2
	    sub $t0 , $t0 , $t1			      
		b    for1 		  
endf2:
        beq  $t0 , $zero , endf1          #if $t0==0 go to endf1
		li   $v0 , 4					  #print result2
		la   $a0 , result2
		syscall
		b endf
		
endf1:
		li   $v0 , 4					  #print result1
		la   $a0 , result1
		syscall
		
endf:		li   $v0 , 10                     #terminate the program
		syscall