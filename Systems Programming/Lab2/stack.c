// include parts of the C standard library
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>


// type declaration for stack of doubles
struct double_stack {
  double * items;
  int max_size;
  int top;
};

// prototypes of functions that operate on the double stack
// create a new empty stack
struct double_stack * double_stack_new(int max_size) {
   struct double_stack * result;

   // allocate space for the stack header
   result = malloc(sizeof(struct double_stack));
   result->max_size = max_size;
   result->top = -1;
   // allocate space for the data stored in the stack
   result->items = malloc(sizeof(double)*max_size);
   // return a pointer to the newly-allocated stack
   return result;
}
// push a value onto the stack
void double_stack_push(struct double_stack * this, double value){
   this->top++;
   this->items[this->top] = value;
}
// pop a value from the stack
double double_stack_pop(struct double_stack * this){
   double result = this->items[this->top];
   this->top--;
   return result;
}



int main () {
   struct double_stack * stack = double_stack_new(3);
   double_stack_push(stack,10.20);
   double_stack_push(stack,12.40);
   double_stack_push(stack,14.00);
   double_stack_push(stack,16.10);
   double number = double_stack_pop(stack);
   printf("%f\n", number);
   number = double_stack_pop(stack);
   printf("%f\n", number);
   number = double_stack_pop(stack);
   printf("%f\n", number);
   number = double_stack_pop(stack);
   printf("%f\n", number);
};

// end of code
