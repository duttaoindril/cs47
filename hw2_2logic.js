var a = 0; //index of array var_a
var b = 0; //index of array var_b
var c = 0; //index of array var_c, not an actual registry, just a+b

var m = 10; //length of var_a
var n = 7; //length of var_b

var var_a = [];
var var_b = [];
var var_c = [];

loop start:
    if m-a is greater than 0
        jump checkb

    if n-b is greater than 0
        simply add one var_b val into var_c

    if n-b is <= 0
        exit

check:
    if m-a is greater than 0
        jump loop routine

    if n-b is greater than 0
        simply add one var_b val into var_c

    if n-b is <= 0
        exit

loop routine:
    load into reg1 from var_a at index a

    load into reg2 from var_b at index b

    if reg1 > reg2
        add b into c
    else
        add a into c