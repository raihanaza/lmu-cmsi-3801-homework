#include <stdexcept>
#include <string>
#include <memory>
using namespace std;

#define MAX_CAPACITY 32768
#define INITIAL_CAPACITY 16

template <typename T>
class Stack {
  unique_ptr<T[]> elements;
  int capacity;
  int top;

  Stack(const Stack<T>&) = delete;
  Stack<T>& operator=(const Stack<T>&) = delete;
  
public:
  Stack(): 
    top(0),
    capacity(INITIAL_CAPACITY),
    elements(make_unique<T[]>(INITIAL_CAPACITY)) {
  }

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
    T popped = std::move(elements[--top]);
    elements[top] = T();
    if (top > 0 && top <= capacity / 4) {
      reallocate(capacity / 2);
    }
    return popped;
  }

private:
  void reallocate(int new_capacity) {
    if (new_capacity > MAX_CAPACITY) {
        new_capacity = MAX_CAPACITY;
        throw overflow_error("Stack capacity has exceeded maximum limit");
    }
    if (new_capacity < INITIAL_CAPACITY) {
        new_capacity = INITIAL_CAPACITY;
    }
    auto new_elements = std::make_unique<T[]>(new_capacity);
    std::copy(elements.get(), elements.get() + top, new_elements.get());

    elements = std::move(new_elements);
    capacity = new_capacity;
  }
};
