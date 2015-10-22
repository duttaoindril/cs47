.include    "cs47_macro.asm"

.data
prompt: .asciiz "Please enter a positive integer: "
error:  .asciiz "A POSITIVE integer. It's not that difficult. Try again.\n"
result: .asciiz "! = "
endl:   .asciiz "\n"

.text
START:  print_str(prompt)       # print the prompt message to user
    read_int($a0)           # read integer (n) from user

    bltz    $a0, ERROR      # if (n < 0) goto ERROR
    addi    $v1, $zero, 1       # result = 1
    print_reg_int($a0)     # print n, so we can say "n! = ..." at the end
    beq $a0, $zero, REPORT  # if (n == 0) goto REPORT

LOOP:   mul $v1, $v1, $a0       # result = result * n
    addi    $a0, $a0, -1        # n = n - 1
    bne $a0, $0, LOOP       # while (n != 0)

REPORT: print_str(result)       # print out "! = "
    print_reg_int($v1)     # print out the result
    print_str(endl)         # new line
    exit                # au revoir!

ERROR:  print_str(error)        # administer verbal abuse
    j   START           # go back to beginning
