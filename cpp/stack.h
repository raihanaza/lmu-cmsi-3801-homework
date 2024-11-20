#include <stdexcept>
#include <string>
#include <memory>
using namespace std;

#define MAX_CAPACITY 32768
#define INITIAL_CAPACITY 16

template <typename T>
class Stack {
  unique_ptr<T[]>elements;
  int capacity;
  int top;

  Stack(const Stack<T>&) = delete;
  Stack<T>&operator=(const Stack <T>&) = delete;
  
public:
  Stack() : 
    elements(make_unique<T[]>(INITIAL_CAPACITY)), 
    capacity(INITIAL_CAPACITY),
    top(0) {}

  int size() const {
    return top;
  }

  bool is_empty() const {
    return top == 0;
  }

  bool is_full() const {
    return top == MAX_CAPACITY;
  }

  void push(T item) {
    if (top == MAX_CAPACITY) {
      throw overflow_error("Stack has reached maximum capacity");
    }
    if (top == capacity) {
      reallocate(2 * capacity);
    }
    elements[top++] = item;
  }

  T pop() {
    if (is_empty()) {
      throw underflow_error("cannot pop from empty stack");
    }
    T popped_item = elements[--top];
    if (top > 0 && top <= capacity / 4) {
      reallocate(capacity / 2);
    }
    return popped_item;
  }

private:
  void reallocate(int new_capacity) {
    if (new_capacity > MAX_CAPACITY) {
      throw overflow_error("Stack capacity has exceeded maximum limit");
    }
    if (new_capacity < INITIAL_CAPACITY) {
      new_capacity = INITIAL_CAPACITY;
    }
    unique_ptr<T[]> new_elements = make_unique<T[]>(new_capacity);
    for (int i = 0; i < top; ++i) {
      new_elements[i] = move(elements[i]);
    }
    elements = move(new_elements);
    capacity = new_capacity;
  }
};