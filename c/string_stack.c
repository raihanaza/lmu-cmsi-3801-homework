#include "string_stack.h"
#include <stdlib.h>
#include <string.h>

#define INITIAL_CAPACITY 16
// TODO: is_full function for CPP and size, is_empty, and destroy functions

struct _Stack {
    char** elements; // pointer to an array of strings, so do char** since a pointer to an array of strings which is char*
    int top;
    int capacity;
};

stack_response create() {
    // todo - long, 11 lines
    // initialize a stack, set its top to 0 and return it
}

int size(const stack s) {
    return s->top;
}

bool is_empty(const stack s) {
    return size(s) == 0;
}

bool is_full(const stack s) { 
    return s->top == MAX_CAPACITY;
}

response_code push(stack s, char* item);  // Stores copy of string inside stack
string_response pop(stack s);             // Will include a copy of the string
                                          // from the stack, so the caller is
                                          // responsible for freeing it

void destroy(stack* s) { // frees *all* the memory
    if (!s || is_empty(s)) {
        return;
    }

    for (int i = 0; i < (*s)->top; i++) {
        free((*s)->elements[i]);
    }

    free((*s)->elements);
    free(s);
}