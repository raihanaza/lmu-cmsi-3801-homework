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
- Q1 (first then lower case): Cecilia
- Q2 (powers generator): Lauren
- Q3 (say): Raihana
- Q4 (line count): Z
- Q5 (Quaternion class): Lauren 

**Python**
- Q1 (first then lower case): Cecilia
- Q2 (powers generator): Lauren
- Q3 (say): Raihana
- Q4 (line count): Z
- Q5 (Quaternion class): Raihana/Z

## Homework 2 (Enterprise) Submission 

### Description
- Q1 (first then lower case): 
    - The first then lower case function takes a sequence of strings and a predicate as input, and the first string to match that predicate is returned in all lowercase letters. If there is no string matching that predicate or the sequence is empty, then nil (Lua), undefined (Javascript), or None (Python) is returned.
- Q2 (say):  
    - The say function utilizes recursive calls to chain multiple strings together into a final outputted phrase. If there are no input call, it will output an empty string. 
- Q3 (line count): 
    - The line count function reads a file line by line and returns how many lines satisfy these three requirements: lines that are not all whitespace, lines that do not have # as their first non-whitespace character, and lines that are not empty.
- Q4 (Quaternion class or table): 
    - The Quaternion class creates the blueprint for creating Quaternion objects. Users can create, add, multiply, list the coefficients, calculate the conjugate, determine equality between conjugates, and print Quaternions as strings.
- Q5 (Binary Search Tree):
    - Creating an immutable and persistent binary tree implementation that supports element count, insertion, and item lookup.

**Java**
- Q1 (first then lowercase): Z
- Q2 (say): Cecilia
- Q3 (line count): Raihana
- Q4 (Quaternion): Cecilia
- Q5 (BST): Lauren

**Kotlin**
- Q1 (first then lowercase): Z
- Q2 (say): Cecilia
- Q3 (line count): Raihana
- Q4 (Quaternion): Lauren
- Q5 (BST): Cecilia

**Swift**
- Q1 (first then lowercase): Z
- Q2 (say): Cecilia
- Q3 (line count): Raihana
- Q4 (Quaternion): Lauren
- Q5 (BST): Raihana/Z

## Homework 3 (Theory) Submission 

### Description
- Q1 (first then apply): 
    - The first then apply function takes an array and finds the first thing in the array that complies with a given predicate.
- Q2 (powers generator):  
    - The powers generator function is a generator that takes a base number and a limit, and yields the increasing powers of the base while the resulting number is less than or equal to the limit.
- Q3 (line count): 
    - The line count function reads a file line by line and returns how many lines satisfy these three requirements: lines that are not all whitespace, lines that do not have # as their first non-whitespace character, and lines that are not empty.
- Q4 (shapes): 
    - The shapes function defines three-dimensional geometric forms (spheres and rectangular boxes) and provides operations to calculate their surface area and volume.
- Q5 (Binary Search Tree):
    - Creating an immutable and persistent binary tree implementation that supports element count, insertion, and item lookup. 

+1 Homework point because Z pointed out that for the Binary Search Tree in Ocaml, you need to export Empty but the Node should be invisible. Therefore, cannot make the Ocaml BST function secure. 10/31/24

**Typescript**
- Q1 (first then apply): Lauren
- Q2 (powers generator): Z
- Q3 (line count): Cecilia
- Q4 (shapes): Raihana
- Q5 (BST): Cecilia

**Ocaml**
- Q1 (first then apply): Lauren
- Q2 (powers generator): Z
- Q3 (line count): Cecilia
- Q4 (shapes): Raihana
- Q5 (BST): Raihana/Z

**Haskell**
- Q1 (first then apply): Lauren
- Q2 (powers generator): Z
- Q3 (line count): Cecilia
- Q4 (shapes): Raihana
- Q5 (BST): Lauren

## Homework 4 (Systems) Submission

**C, C++, Rust**

### Description
**C**
- stack_response create()
    - Creates a Stack and returns a stack_response. If there is no memory left to store the stack type or the INITIAL_CAPACITY of the stack elements, the function will return an out_of_memory response code and NULL response stack. If there is enough memory to store a stack, then a success response code and a response stack will be returned.
- int size(const stack s)
    - Returns the size of the stack by accessing the value of the variable top that is stored inside stack. The variable top keeps track of the size whenever elements are pushed or popped from the stack. 
- bool is_empty(const stack s)
    - Returns true when the stack is empty and false when the stack contains 1 or more elements. We can tell when the stack is empty when the size is equal to 0.
- bool is_full(const stack s)
    - Returns true when the stack is full (when the stack size is equal to MAX_CAPACITY) and false otherwise.
- response_code push(stack s, char* item)
    - Pushes an element to the end of the stack and returns a string_response. Returns an out_of_memory response code if s is NULL or item is NULL, returns stack_element_too_large if the length of the item to be inserted into the stack is too large, and returns a stack_full response_code if the stack is full and cannot store anymore elements. If none of those response codes are returned, memory is reallocated in the stack to store another item, and a success code is returned unless the stack runs out of memory.
- string_response pop(stack s)
    - Pops, or removes, an element from the end of the stack and returns a string_response. Returns a string_response with a stack_empty message and NULL element if the stack to be popped from is empty or an out_of_memory message and NULL element if there is no more memory to reallocate the stack in order to remove an element. A success message and the popped element are returned in a string_response otherwise.
- void destroy(stack* s)
    - This frees all the mallocs that were allocated in other functions, including all individual elements in the elements array inside the stack variable s, the pointer to the elements array, the stack s, and sets the pointer to s to NULL.

**C++**
- Stack(const Stack<T>&) = delete; 
    - Deletes the copy constructor to prevent copying of Stack objects.
- Stack<T>& operator=(const Stack<T>&) = delete;
    - Deletes the copy assignment operator to prevent copying of Stack objects with the copy assignment operator.
- Stack() 
  - Creates a Stack with an initial top of 0 (since the initial size of teh stack is 0), a capacity equal to INITIAL_CAPACITY, and the elements to be inserted in the stack.
- int size() const
    - Returns the size of the stack by accessing the top attribute that keeps track of the stack size.
- bool is_empty() const
    - Returns true when the stack is empty and false when the stack contains 1 or more elements. We can tell when the stack is empty when top is equal to 0.
- bool is_full() const
    - Returns true when the stack is full (when the stack size is equal to MAX_CAPACITY) and false otherwise.
- void push(T new_element)
    - Adds an element to the end of the stack as long as the stack size is less than its MAX_CAPACITY and increments the top variable if an element is added succesfully.
- T pop()
    - Removes an element from one of the stack and returns it as long as the stack is not empty, and returns the removed element.
- void reallocate(int new_capacity)
    - Reallocates elements in the stack to take up more or less memory depending on whether elements are added to or removed from the stack.

**Rust**
- pub fn new() -> Self 
    - Creates a new Stack object that contains an empty stack of the generic type Vec.
- pub fn push(&mut self, item: T)
    - Adds an item to the end of the stack by appending an item to the end of the items list.
- pub fn pop(&mut self) -> Option<T>
    - Removes the last element of the stack, and returns an Optional because it will return the element removed if items is not empty and return None if items is empty.
- pub fn peek(&self) -> Option<&T>
    - Returns the last element of the stack, and returns an Optional because it will return the element if items is not empty and return None if items is empty.
- pub fn is_empty(&self) -> bool
    - Returns true if the stack is empty and false if the stack contains 1 or more elements.
- pub fn len(&self) -> usize
    - Returns the length of the stack as a usize (which is a number).

## Homework 5 (Concurrency) Submission
**Go**

- do(seconds int, action ...any) 
    - Simulates performing a task for a random duration. Computes a random number of milliseconds between 5000 and 10000, log the action, and sleep the current goroutine for that much time.
- Order struct
    - An order for a meal is placed by a customer and taken by a cook. An Order contains an id (uint64), the name of the customer (string) who placed the order, reply (chan Order) so that the cook can send the finished meal to the customer, and preparedBy (string) to contain the name of the chef that made the order.
- cook(name string, waiter chan Order)
    - A cook with a name (string) fetches orders from the waiter channel (chan Order) that contains orders, cooks the requested meal, and sends the meal back through the
    order's reply channel.
- customer(name string, waiter chan Order, wg *sync.WaitGroup)
    - Each time a customer enters the restaurant, they place an order with the waiter. If the waiter is too busy (the waiter channel already contains 3 orders), the customer waits for 5 seconds before abandoning the order and placing another order. If the order does get placed, then they wait as long as necessary for the meal to be cooked and delivered. A customer leaves the restaurant and goes home after eating five meals.
- main()
    - This is a goroutine which performs the different function calls so that the restaurant can operate. The waiter channel is a buffered channel that can only contain 3 orders at a time. The waiter takes orders from customers and send them to the cook. The cook then sends the prepared meal back to the waiter who gives the meal to the customer.



+1 Homework point because Cecilia helped Dr. Toal in-class by pointing out the Reset Button on A Tour of Go lecture on 12/2/2024. 

+2 Homework points because Ceclia pointed out to make a channel in Go during the A Tour of Go lecture wrapup on 12/4/2024.

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
