// include parts of the C standard library
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>
#include <math.h>



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
// end stack code


// start postfix calc code
double evaluate_postfix_expression(char ** argv, int argc){
   int i;
   double result;
   struct double_stack * stack = double_stack_new(argc);
   for (i=0; i<argc; i++) {
      if (strcmp(argv[i], "+") == 0 ){
         float op1 = double_stack_pop(stack);
         float op2 = double_stack_pop(stack);
         result = op1 + op2;
         double_stack_push(stack, result);
      }
      else if (strcmp(argv[i], "-") == 0 ){
         float op1 = double_stack_pop(stack);
         float op2 = double_stack_pop(stack);
         result = op1 - op2;
         double_stack_push(stack, result);
      }
      else if (strcmp(argv[i], "X") == 0 ){
         float op1 = double_stack_pop(stack);
         float op2 = double_stack_pop(stack);
         result = op1 * op2;
         double_stack_push(stack, result);
      }
      else if (strcmp(argv[i], "/") == 0 ){
         float op1 = double_stack_pop(stack);
         float op2 = double_stack_pop(stack);
         result = op1 / op2;
         double_stack_push(stack, result);
      }
      else if (strcmp(argv[i], "^") == 0 ){
         float op1 = double_stack_pop(stack);
         float op2 = double_stack_pop(stack);
         result = pow(op1, op2);
         double_stack_push(stack, result);
      }
      else {
         result = strtod(argv[i],NULL);
         double_stack_push(stack, result);
      }
   }
   return double_stack_pop(stack);
}
// end postfix calc code

// main function for a simple bench calculator with command
// line inputs
int main(int argc, char ** argv) {
  if ( argc == 1 ) {
    // command line contains only the name of the program
    printf("Error: No command line parameters provided\n");
    printf("Usage: %s postfix|infix <expression>\n", argv[0]);
    exit(1);
  }
  else if ( argc == 2 ) {
    // command line contains name of prog and one other parameter
    printf("Error: No expression to evaluate provided\n");
    printf("Usage: %s postfix|infix <expression>\n", argv[0]);
    exit(1);
  }
  else {
    // command line has enough parameters for an expression
    double result;
    if ( strcmp(argv[1], "postfix") == 0 ) {
      // pass the command line parameters, but with the first two removed
      result = evaluate_postfix_expression(argv+2, argc-2);
      printf("Result is %lf\n", result);
    }
    else {
      printf("Error: You must specify whether the expression is infix or postfix\n");
      printf("Usage: %s postfix|infix <expression>\n", argv[0]);
      exit(1);
    }

  return 0;
  }
}


// end of code
