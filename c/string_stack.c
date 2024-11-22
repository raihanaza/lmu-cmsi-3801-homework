#include "string_stack.h"
#include <stdio.h>
#include <stdlib.h>

#define INITIAL_CAPACITY 16
typedef enum {
    SUCCESS,
    STACK_FULL,
    OUT_OF_MEMORY,
    STACK_REALLOCATION_FAILED
} response_code;
typedef struct {
    void** elements;
    size_t top;
    size_t capacity;
    size_t element_size;
} Stack;

int is_full(Stack* stack) {
    return stack->top >= MAX_CAPACITY;
}

response_code push(Stack* stack, void* element) {
    if (!stack || !element) {
        return OUT_OF_MEMORY; 
    }

    if (is_full(stack)) {
        return STACK_FULL;
    }

    if (stack->top == stack->capacity) {
        size_t new_capacity = stack->capacity * 2;
        if (new_capacity > MAX_CAPACITY) {
            return STACK_FULL;
        }

        void** new_elements = realloc(stack->elements, new_capacity * sizeof(void*));
        if (!new_elements) {
            return STACK_REALLOCATION_FAILED;
        }

        stack->elements = new_elements;
        stack->capacity = new_capacity;
    }

    stack->elements[stack->top] = malloc(stack->element_size);
    if (!stack->elements[stack->top]) {
        return OUT_OF_MEMORY;
    }
    memcpy(stack->elements[stack->top], element, stack->element_size);

    stack->top++;
    return SUCCESS;
}
