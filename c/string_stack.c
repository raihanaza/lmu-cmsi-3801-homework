#include "string_stack.h"

// Complete your string stack implementation in this file.
// TODO: is_full function for CPP and size, is_empty, and destroy functions

struct _Stack {
    // TODO: define stack representation
    char** elements; // pointer to an array of strings, so do char** since a pointer to an array of strings which is char*
    int top;
    int capacity;
};

stack_response create() {
    // todo - long, 11 lines
    // initialize a stack, set its top to 0 and return it
}

int size(const stack s) {
    // top will always be the same thing as the size
    // stacks are always pointers, so can find the value of what it points to like this. alternative that means same thing is (*s).top
    return s->top;
}

bool is_empty(const stack s) {
    // size is 0 and top is 0
    return size(s) == 0;
}

bool is_full(const stack s) { 
    // TODO: return top is at MAX_CAPACITY
    return s->top == MAX_CAPACITY;
}

response_code push(stack s, char* item);  // Stores copy of string inside stack
string_response pop(stack s);             // Will include a copy of the string
                                          // from the stack, so the caller is
                                          // responsible for freeing it

void destroy(stack* s) { // frees *all* the memory
    free((*s)->elements);
    free(s);
}