array
array length / end 0
temp???
sorted length
min index
current traversal index

#======================================
#$t0 is general use number
#======================================
#$t1 is var_a
#======================================
#$a1 is index of var_a
#$a2 is the sorted barrier of the sort
#======================================
#$s1 is length of var_a, var_m
#======================================
#$s2 is the current minimum
#======================================

-- HUMAN RESOURCE MACHINE PROGRAM --

    JUMP     e
a:
b:
    COPYFROM 24
    COPYTO   20
c:
    COPYFROM [20]
    OUTBOX
    BUMPUP   20
    COPYFROM 15
    SUB      20
    JUMPN    d
    JUMP     c
d:
e:
    COPYFROM 24
    COPYTO   22
    COPYTO   20
f:
    INBOX
    JUMPZ    g
    COPYTO   [20]
    BUMPUP   20
    JUMP     f
g:
    BUMPDN   20
    COPYTO   15
h:
i:
    COPYFROM 20
    COPYTO   21
    COPYFROM [21]
    COPYTO   23
j:
    BUMPDN   20
    SUB      22
    JUMPN    k
    COPYFROM [20]
    SUB      23
    JUMPN    i
    JUMP     j
k:
    COPYFROM [22]
    COPYTO   23
    COPYFROM [21]
    COPYTO   [22]
    COPYFROM 23
    COPYTO   [21]
    BUMPUP   22
    COPYFROM 15
    SUB      22
    JUMPN    b
    JUMPZ    a
    ADD      22
    COPYTO   20
    JUMP     h


DEFINE LABEL 15
eJzzZmBgUBdskVMXrLJ2FmAMdhYwSjHgOz6dgTfwhbx64AugNIOwqVSqt3H3Nm9joXMgvrr5t/zTNh1Z
s/12ZoD47y3SZgc7T5sJkVt6wtpH7giI/S16Z/WtmEfnQeyqKO8ytxSBqYsK2Y5aFc3Yb1VkOjescG0R
SG5dp3eyXNvODKemV5VxjeqNQo1ps7laire3tZ7c69a193hQ/9ITTROuHkubKHdEauKeLa/6BVecm7B+
xqaJGlOqJndNkJtp0jVrlkz32jmRkybOXT8jcr7/IZC5jGu/xpRudNoJYrMuyo+QXXMhpPbghRAQv/dc
dWLh+dSO1ovT15y8MvMSSGzlgyNxLU9M5ya80D4LUeO3fu/56Wsa7xQtkXm6eBHDKBgFwxAAADizeMI;

DEFINE LABEL 20
eJxzYWBg6Feu1NivUlMSrnpyL7fq0ttAIQZ/0RAFf2sDbRBbXHzfrdWmOg9A7MduxuXT3RoObHY9eQHC
rynRd5euSA44Pt0pRuicWqzzGav47m1+iRH1folSqSA1WcXJSVyFGy+C2EllX2PyqvMjnJryI/zav8Ys
67mYnte3tuhV/73mpgnTZgb1P1i5rEdr169O88NhLb/OJZUtvR2UGXMPpNd1rlSq69yCOqZZxdu3zYw5
DRI7OO9uwdUFBdmpS16m/Vx/NxYkVjpPcMXRZZcXWK5mmQ/ii86ZeWnnlndHQWzBXdWJoRdkugUf1K8F
8T/eMAz8eGNH6NPLO6s3njLbwDAKRsEIAwAf0G+h;

DEFINE LABEL 21
eJzTZWBgOC02V1ZepLY9XMhvfbhQxhWgEMNkCTFJbckceWUZA+3TmlV+wQY7M7yNj8S52xloszs/k5ru
dtu83zM5aXKg1i7lUIieW/nzw+LynHY+yjG/BuIfi3qZlpVQneiVwxvDVGIXVdRsFwUST0pmv5GU3Hvn
XorL/aICl/v7mt/dAIn/m3gkTmrini1mE67dDOrf9AQk1jRBLdprUnWi4HKhc7HLa0purvgawzAKRsEo
oBoAAC8UQ1M;

DEFINE LABEL 22
eJybwsDAcF/CWtFf1FpxBu9EdQ6ubfoqnJ/NLLgN7PxFJ/tqS4ZF5sssyGSXNS7/LLWzul7MocGHV70x
gyeiHqiVoVtvu1Oy1nanes02F2aN1T7MGrwxk7W/5efrv6p8bBxRv9+8oC7ZtqZE274ji9/BLkreSsI+
3GKSlbfxZzOQfmGPwxa3Pb2Tb3veLQDxub1zjZ77HVL9HJwjPy+sRe5WjLXipfiJ6kyJNiZMiQwOi+JC
3f5FHPbuDpns6+y52me6m6rHpoidGZ/SIO6ZVD5RXaviVSWIPS2nRc5swlYZEPtXJ4PDva4k/0Pd35tA
fLcuW/dtMw3sQOyu3ovpTlOTk0Bsre5F/UH9Mt07F0LUbV0zyeruBuNyEHvm2nkGtpvFdVbuEtd5u3ee
wdb9PGaGBxkcTh5M8t+6vzqxd/fdgp1bIO5oi+/eVpe08eKppKafIP6rsO5tzxKvbJbKvrIZxJeK+PMl
LfvPFxD7U2X0Drsq4Yd51ae/gfh51XJH5tWYH06ru3rMqnXfrU89+99+6vl17l7Xkq0g+UszZDfKzXz/
um0GRL3fLLMNonPWrz4478HKqwserKxc5rf+7SqnnbXr3h09ue7djcw1gS++Ltf9rLgw69fEuZZ/wqZb
/gHp27vnxKq9eyBu6N0tu3HvnrR1qudN54L4Jw9mXDE9+esciB26t+zD0wOun1yvZT4H8Vc+kN3440XP
SYNfCq9A/Jbv62f8+fBzd8sTiFmjYGgBAAXF+AI;

DEFINE LABEL 23
eJyzYWBgWKzqoaWuYuterLKwJlx12sxwVfPDxSoNl4FSDKv5Pykr639SdjbjVma2DlEAiWnbvwi+b6eW
t9zh8oLPDhlXQGLl9oaBr51X+zD7hbqlRYS6gcTmO/+Ymu0rMBXE7nYMuLrbqeHyao+NF/9FzLwEEluV
F+p2K7+m5Fveo/MgvlP+POd9BV882WoKsr81fm+61eTQsKhlbVFQv4Hdv4lfY45NXtcaN+XdDZDajUts
3QMXnbwAYnsuPe/IueqwxdO1PGasW2+bp273tH24I8916g7G4MCtyUlr198tkFxyr9l2QW07wygYBaMA
BQAA8jpfag;

DEFINE LABEL 24
eJwLYGBgaOFO0FwstFKNX3ei+mbXc3rebq2G/10PW/A72EUxWx8tPG7i05mvnzZbWn7piXLJkxeElUpO
bTa6eux+4NVjQO0Mn9ImWeVlLMicl6m1C8Q/lZRoU9WwTf9a73NdEL8q927Bu8LwHKXqBZkg/qvM7m1a
FetXL2pxXMbX47gMJOY6d7vTxLlvN4HY76ZPsuKdP88gcNE5Pc5V2/TXrl9lWbrxuUPnZsmgzs1r4iM3
GaU8XVuQ7bjCPrdxcUG25BK+fN1lKaU7t/yY+vRA2rrc49E7QOYsvfHZ7OSV5w6Ml5P8t14qqEu86jsn
8saDlV8fRO+48OTnbp7XD/fkvBXa3fC+ePuKz0VLOL79mNryfV1rxo8FmRbf7aJUvq72mfLxvGPO2yrr
NS94zBrvbNPfemmbPucFG5Ob51ZZfj2b58owCkbBEAcAiTaWSQ;
