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

static response_code reallocate(stack s, int new_capacity) {
    if (new_capacity > MAX_CAPACITY)  {
        return stack_full;
    }
    if (new_capacity < INITIAL_CAPACITY) {
        new_capacity = INITIAL_CAPACITY;
    }

    char** new_elements = realloc(s->elements, new_capacity * sizeof(char*));
    if (!new_elements) {
        return out_of_memory;
    }

    s->elements = new_elements;
    s->capacity = new_capacity;
    return success;
}

stack_response create() {
    stack_response response;
    stack s = malloc(sizeof(struct _Stack));
    if (!s) {
        response.code = out_of_memory;
        response.stack = NULL;
        return response;
    }

    s->elements = malloc(INITIAL_CAPACITY *sizeof(char*));
    if (!s->elements) {
        free(s);
        response.code = out_of_memory;
        response.stack = NULL;
        return response;
    }

    s->top = 0;
    s->capacity = INITIAL_CAPACITY;

    response.code = success;
    response.stack = s;
    return response;
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
    return s->top == MAX_CAPACITY;
}

response_code push(stack s, char* item) {
    if (!s || !item) {
        return out_of_memory;
    }

    size_t len = strlen(item);
    if (len >= MAX_ELEMENT_BYTE_SIZE) {
        return stack_element_too_large;
    }

    if (is_full(s)) {
        return stack_full;
    }

    if (s->top == s->capacity) {
        response_code result = reallocate(s, s->capacity * 2);
        if (result != success) {
            return result;
        }
    }

    s->elements[s->top] = malloc((len+1) * sizeof(char));
    if (!s->elements[s->top]) {
        return out_of_memory;
    }

    strcpy(s->elements[s->top], item);
    s->top++;
    return success;
} 

string_response pop(stack s) {
    if (is_empty(s)) {
        return (string_response) {.code = stack_empty, .string = NULL};
    }
    char* popped = s->elements[--s->top];
    s->elements[s->top] = NULL;
    int new_capacity = s->capacity / 4;
    if (s->top > 0 && s->top <= new_capacity) {
        char** new_elements = realloc(s->elements, new_capacity * sizeof(char*));
        if (new_elements == NULL) {
            return (string_response){.code = out_of_memory, .string = NULL};
        }
        s->elements = new_elements;
        s->capacity = new_capacity;
    }
    return (string_response){.code = success, .string = popped};
}

void destroy(stack* s) {
    if (!s || !*s) return;

    for (int i = 0; i < (*s)->top; i++) {
        free((*s)->elements[i]);
    }

    free((*s)->elements);
    free(*s);
    *s = NULL;
}   