# CMSI 3801 Homework

## Homework 1 (Scripting) Submission 

*Collaborators: Cecilia Zaragoza, Lauren Campbell, Raihana Zahra, Z Anderson*

### Description
- Q1 (first then lower case): 
    - The first then lower case function takes a sequence of strings and a predicate as input, and the first string to match that predicate is returned in all lowercase letters. If there is no string matching that predicate or the sequence is empty, then nil (Lua), undefined (Javascript), or None (Python) is returned.
- Q2 (powers generator):
    - The powers generator function is a generator that takes a base number and a limit, and yields the increasing powers of the base while the resulting number is less than or equal to the limit
- Q3 (say):  
    - The say function utilizes recursive calls to chain multiple strings together into a final outputted phrase. If there are no input call, it will output an empty string. 
- Q4 (line count): 
    - The line count function reads a file line by line and returns how many lines satisfy these three requirements: lines that are not all whitespace, lines that do not have # as their first non-whitespace character, and lines that are not empty.
- Q5 (Quaternion class or table): The Quaternion class creates the blueprint for creating Quaternion objects. Users can create, add, multiply, list the coefficients, calculate the conjugate, determine equality between conjugates, and print Quaternions as strings.

+1 Homework point because Cecilia helped Dr. Toal in-class by pointing out how to call a function on a Vector object in Javascript on 9/11/24.
<br>

**Lua**
- Q1 (first then lower case): Cecilia
- Q2 (powers generator): Lauren 
- Q3 (say): Raihana 
- Q4 (line count): Z
- Q5 (Quaternion table): Cecilia
  
**Javascript**
- Q1: Cecilia
- Q2: Lauren
- Q3: Raihana
- Q4: Z
- Q5: Lauren 

**Python**
- Q1: Cecilia
- Q2: Lauren
- Q3: Raihana
- Q4: Z
- Q5: Raihana and Z

## Homework 2 (Enterprise) Submission 

TBD

Java, Kotlin, Swift

## Homework 3 (Theory) Submission 

TBD

TypeScript, OCaml, Hasketll

## Homework 4 (Systems) Submission

TBD

C, C++, Rust

## Homework 5 (Concurrency) Submission

TBD

Go

## Original Instructions for Reference

Fork this repo for your homework submissions. Make sure your fork has a nice, descriptive name. Leaving the name as “lmu-cmsi-3801-template” is misleading, and keeping it indicates you are not taking sufficient pride in your work. After forking, **please replace the contents of this readme** file with information about your submissions, including the name(s) of the students, and a description of each assignment (as they are turned in).

Don’t bother with notes to the graders. Such notes go into your BrightSpace submissions, not your GitHub repository.

Your homework submissions will consist of programs in the following languages. To keep things simple, there is a separate folder for each language.

- **Homework 1 (Scripting)**: Lua, Python, JavaScript
- **Homework 2 (Enterprise)**: Java, Kotlin, Swift
- **Homework 3 (Theory)**: TypeScript, OCaml, Haskell
- **Homework 4 (Systems)**: C, C++, Rust
- **Homework 5 (Concurrency)**: Go

At each homework deadline, the graders will clone your repo and run the tests. I will be inspecting the source code, grading your work on style, clarity, and appropriate use of language idioms. Do not throw away points in these areas: **use code formatters and linters**. Please consider it a moral obligation to use these tools. Not doing so is a violation of professional ethics. _You must respect the naming, capitalization, formatting, spacing, and indentation conventions of each language_.

## The Test Suites

The test files are included in the repo already. They are available for YOU! They will help you not only learn the languages and concepts covered in this course, but to help you with professional practice. You should get accustomed to writing code to make tests pass. As you grow in your profession, you will get used to writing your tests early.

The test suites are run like so (assuming you have a Unix-like shell, modify as necessary if you have Windows):

### Lua

```
lua exercises_test.lua
```

### Python

```
python3 exercises_test.py
```

### JavaScript

```
npm test
```

### Java

```
javac *.java && java ExercisesTest
```

### Kotlin

```
kotlinc *.kt -include-runtime -d test.jar && java -jar test.jar
```

### Swift

```
swiftc -o main exercises.swift main.swift && ./main
```

### TypeScript

```
npm test
```

### OCaml

```
ocamlc exercises.ml exercises_test.ml && ./a.out
```

### Haskell

```
ghc ExercisesTest.hs && ./ExercisesTest
```

### C

```
gcc string_stack.c string_stack_test.c && ./a.out
```

### C++

```
g++ -std=c++20 stack_test.cpp && ./a.out
```

### Rust

```
cargo test
```

### Go

```
go run restaurant.go
```

## Grading Notes

Your grade is a reflection not only of your ability to write code to pass existing tests, but also of your ability to construct software in a professional setting. Therefore, the following will contribute rather heavily to your score:

- **Following all submission instructions**! Pay attention to every requirement such as replacing the contents of this readme file and including the names of all participants of any group work.
- **Keeping a pristine GitHub repository**. Do not push any file that does not belong (including but not limited to that silly `DS_Store`). Make sure all generated executables, intermediate files, third-party libraries, etc. are not committed. Your repo contents should be limited to your solution files, tests, configuration files, and `.gitignore` files.
- **Adherence to naming and formatting conventions for the language you are writing in**. Inconsistent indentation, for example, has no place in professional or student software. Neither does end-of-line whitespace, huge chunks of contiguous blank lines, and other types of messy coding practices that show friends, family, colleagues, and potential employers that you don’t care about your work.
- (As always) The **readability and maintainability** of your code.
