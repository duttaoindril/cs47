-- HUMAN RESOURCE MACHINE PROGRAM --
-- THIS IS SELECTION SORT IN HRM --
-- Very innefficient, but pretty cool --

    JUMP     e
a:
b:
    COPYFROM Zero
    COPYTO   Index
c:
    COPYFROM [Index]
    OUTBOX
    BUMPUP   Index
    COPYFROM Length
    SUB      Index
    JUMPN    d
    JUMP     c
d:
e:
    COPYFROM Zero
    COPYTO   SortedIndex
    COPYTO   Index
f:
    INBOX
    JUMPZ    g
    COPYTO   [Index]
    BUMPUP   Index
    JUMP     f
g:
    BUMPDN   Index
    COPYTO   Length
h:
i:
    COPYFROM Index
    COPYTO   Min
    COPYFROM [Min]
    COPYTO   Temp
j:
    BUMPDN   Index
    SUB      SortedIndex
    JUMPN    k
    COPYFROM [Index]
    SUB      Temp
    JUMPN    i
    JUMP     j
k:
    COPYFROM [SortedIndex]
    COPYTO   Temp
    COPYFROM [Min]
    COPYTO   [SortedIndex]
    COPYFROM Temp
    COPYTO   [Min]
    BUMPUP   SortedIndex
    COPYFROM Length
    SUB      SortedIndex
    JUMPN    b
    JUMPZ    a
    ADD      SortedIndex
    COPYTO   Index
    JUMP     h