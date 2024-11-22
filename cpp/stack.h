// A class for an expandable stack. There is already a stack class in the
// Standard C++ Library; this class serves as an exercise for students to
// learn the mechanics of building generic, expandable, data structures
// from scratch with smart pointers.

#include <stdexcept>
#include <string>
#include <memory>
using namespace std;

// A stack object wraps a low-level array indexed from 0 to capacity-1 where
// the bottommost element (if it exists) will be in slot 0. The member top is
// the index of the slot above the top element, i.e. the next available slot
// that an element can go into. Therefore if top==0 the stack is empty and
// if top==capacity it needs to be expanded before pushing another element.
// However for security there is still a super maximum capacity that cannot
// be exceeded.

#define MAX_CAPACITY 32768
#define INITIAL_CAPACITY 16

template <typename T>
class Stack {
  unique_ptr<T[]>elements;
  int top;
  int capacity;
  // Add three fields: elements, a smart pointer to the array of elements,
  // capacity, the current capacity of the array, and top, the index of the
  // next available slot in the array.

  // Prohibit copying and assignment
  
public:
  // Write your stack constructor here

  // Write your size() method here

  // Write your is_empty() method here

  // Write your is_full() method here

  void push(T new_element) {
    if (top >= MAX_CAPACITY) {
      throw std::overflow_error("Error: Stack is at or above maximum capacity");
    }
    if (top == MAX_CAPACITY) {
      reallocate(2 * capacity)
    }
    elements[top++] = new_element;
  }

  T pop() {
    if (is_empty()) {
      throw std::underflow_error("Error: Stack is Empty");
    }
    T element_popped = elements[--top];
    if (top > 0 && top <= capacity / 4) {
      reallocate(capacity / 2);
    }
    return element_popped;
  }

private:
  // We recommend you make a PRIVATE reallocate method here. It should
  // ensure the stack capacity never goes above MAX_CAPACITY or below
  // INITIAL_CAPACITY. Because smart pointers are involved, you will need
  // to use std::move() to transfer ownership of the new array to the stack
  // after (of course) copying the elements from the old array to the new
  // array with std::copy().

};
