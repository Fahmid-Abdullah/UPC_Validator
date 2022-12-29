		AREA question1, CODE, READONLY
		ENTRY						
		MOV r6, #1					; Store a Positive decimal number in r6
		LDR r1, =UPC				; Loads a valid or invalid UPC string to r1

Repeat	LDRB r2, [r1, r0]			; Loops, Loads byte to r2, Responsible for doing the first sum and second sum of step a and b
		SUB r2, r2, #48				; Subtracts a Positive decimal number from r2 and stores it to r2, to convert from ascii to a hexadecimal
		ADD r3, r3, r2				; Adds r2 to r3 and stores it to r3
		ADD r0, r0, #2				; Adds a Positive decimal number to r0 and stores it to r0
		LDRB r4, [r1, r6]			; Loops, Loads byte to r4
		SUB r4, r4, #48				; Subtracts a Positive decimal number from r4 and stores it to r4
		ADD r5, r5, r4				; Adds r4 to r5 and stores it to r5
		ADD r6, r6, #2				; Adds a Positive decimal number to r6 and stores it to r6
		CMP r6, #11					; Compares a Positive decimal number to r6
		BNE Repeat					; Repeats until equal
		LDRB r2, [r1, #10]			; Loops, Loads byte to r2, Since the loop requirement is not equal, we need to do one more cycle for first sum
		SUB r2, r2, #48				; Subtracts a Positive decimal number from r2 and stores it to r2
		ADD r3, r3, r2				; Adds r2 to r3 and stores it to r3
		ADD r3, r3, r3, LSL #1		; Adds r2 to r3 and stores it to r3, Multiplied by 3 for step c
		ADD r3, r3, r5				; Adds r5 to r3 and stores it to r3, Added first sum and second sum together for step c
		LDRB r7, [r1, #11]			; Loads byte to r7, Loaded the last digit of the UPC code for step d
		SUB r7, r7, #48				; Subtracts a Positive decimal number from r7 and stores it to r7
		ADD r3, r3, r7				; Adds r3 to r7 and stores it to r3, added the sum to the last digit for step d

While	SUB r3, r3, #10				; Loops, Subtracts a Positive decimal number from r3 and stores it to r3, Subtracts 10 repeatedly until less than 10
		CMP r3, #0					; Compares a decimal number to r3
		BGT While					; Repeats until less than
		
Leave	CMP r3, #0					; Loops, Compares a decimal number to r3, if equal to 0 then it is valid thus setting r0 to 1, if not it is invalid thus setting r0 to 2
		BEQ valid					; Repeats until not equal
		MOV r0, #2					; Store a Positive decimal number in r6
		B	Leave					; Ends loop
valid	MOV r0, #1					; Else, Store a Positive decimal number in r6
		
Loop	B	Loop					

UPC			DCB		"013800150738"	; Test case
UPC2		DCB		"060383755577"	; Test case
UPC3		DCB		"065633454712"	; Test case
		END