#Stepstring Discrepancy 

Define the discrepancy of a string of any two symbols (I'll use a and b) to be the absolute difference 
between the counts of each of the two symbols in the string. For example, all of the following strings have a 
discrepancy of 3:

```
aaa 
bbb 
abbbb 
aababaa 
baababbababababababbbaabbaaaabaaabbaa 
```

Define a stepstring of a string to be any string that can be formed by starting at any position x in the string, 
stepping through the string n characters at a time, and ending before any position y. 
In python, this is any string that can be formed using slice notation s[x:y:n]. 
For example, some stepstrings of the string "abcdefghij" are:

```
d
defg
acegi
bdfhj
dfh
beh
ai
abcdefghij
```

Your problem is, given a string of up to 10,000 characters, find the largest discrepancy of any 
stepstring of the string. For instance, this string:

```
bbaaabababbaabbaaaabbbababbaabbbaabbaaaaabbababaaaabaabbbaaa 
```

has this string as a stepstring (corresponding to the python slice notation s[4:56:4]):

```
aaaabaaaaabaa 
```

which has a discrepancy of 9. Furthermore, no stepstring has a discrepancy greater than 9. 
So the correct solution for this string is 9.

[http://www.reddit.com/r/dailyprogrammer/comments/358pfk/20150508_challenge_213_hard_stepstring_discrepancy/]
