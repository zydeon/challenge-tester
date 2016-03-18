# challenge-tester
Bash script to test programs used in competitive programming.  

## Usage
In order to use the tester, one needs the program that solves the problem to read from the standard input and write to the standard output its solution. This program is passed to the tester as a bash string (see [examples](#examples) below).

In addition, the user must indicate the input tests and create the optimal outputs before hand (see the [pre-requisites](#pre-requisites)).

```bash
$ ./test.sh [-v] <program> <test-1.in> ... <test-N.in>
```
### Pre-requisites
* Program which reads the test input from `stdin` and writes the solution to `stdout`
* Test input files `<test-X.in>`, as well as their optimal solutions `<test-X.out>`.  
**Note:** the file name for optimal solutions must be exactly the same as its corresponding test input, except the extension which must be `.out`

### Options
**-v** &nbsp;&nbsp; Verbose mode. If the program is wrong, it shows the output of `diff` between the optimal solution and the one produced by the program (for each test case that was included in the tester).

### Examples
Examples of usage can be found under the folder `examples` or below:

```bash
$ vim test-1.in && vim test-1.out
$ vim test-2.in && vim test-2.out
$
$ ./test.sh "python algorithm.py" test-1.in test-2.in
```

```bash
$ mkdir tests
$ for i in {1..$N}; do
>   vim tests/test-$i.in
>   vim tests/test-$i.out
> done
$
$ ./test.sh "./algorithm" tests/*.in
```
