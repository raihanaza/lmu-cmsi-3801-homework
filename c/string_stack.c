#include "string_stack.h"

#include <stdlib.h>
#include <string.h>

#define INITIAL_CAPACITY 16

// Complete your string stack implementation in this file.

struct _Stack {
    char** elements;
    int top;
    int capacity;
};

stack_response create() {
    // TODO - long, 11 lines
    // initialize a stack set its top to 0, and return it
    stack s = malloc(sizeof(struct _Stack));
    if (s == NULL) {
        return (stack_response){.code = out_of_memory, .stack = NULL};
    }
    s->top = 0;
    s->capacity = INITIAL_CAPACITY;
    s->elements = malloc(INITIAL_CAPACITY * sizeof(char*));
    // TODO: check for out of memory  
    return (stack_response){.code = success, .stack = s};
}

int size(const stack s) {
    return s->top;
}

bool is_empty(const stack s) {
    // TODO - size is 0, top is 0
    return size(s) == 0;
}

bool is_full(const stack s) {
    // TODO - return top is at MAX_CAPACITY
}

response_code push(stack s, char* item) {
    if (is_full(s)) {
        return stack_full;
    }
    if (s->top == s->capacity) {
        // we need to resize, we need to make it twice as big
        int new_capacity = s->capacity * 2;
        if (new_capacity > MAX_CAPACITY) {
            new_capacity = MAX_CAPACITY;
        }
        char** new_elements = realloc(s->elements, new_capacity * sizeof(char*));
        if (new_elements == NULL) {
            return out_of_memory;
        }
        s->elements = new_elements;
        s->capacity = new_capacity;

        // TODO: make sure the string that is being passed in is not too big
        // return stack_element_too_large if so

        s->elements[s->top++] = strdup(item);
        return success;
    }
}

string_response pop(stack s) {
    // check if stack is empty 
    if (is_empty(s)) {
        return (string_response) {.code = stack_empty, .string = NULL};
    }
    char* popped = s->elements[--s->top];
    // if capacity went below 1/4, we should shrink it
    int new_capacity = s->capacity / 4;
    if (new_capacity < 1) {
        new_capacity = 1;
    }
    char** new_elements = realloc(s->elements, new_capacity * sizeof(char*));
    if (new_elements == NULL) {
        return (string_response){.code = out_of_memory, .string = NULL};
    }
    s->elements = new_elements;
    s->capacity = new_capacity;

    return (string_response){.code = success, .string = popped};
}

void destroy(stack* s) {
    // TODO 
}
