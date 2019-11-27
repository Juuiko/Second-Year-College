#include "postfix.h"

// evaluate expression stored as an array of string tokens
double evaluate_postfix_expression(char ** args, int nargs) {
   int i;
   double result;
   struct double_stack * stack = double_stack_new(nargs);
   for (i=0; i<nargs; i++) {
      if (strcmp(args[i], "+") == 0 ){
         double op1 = double_stack_pop(stack);
         double op2 = double_stack_pop(stack);
         result = op2 + op1;
         double_stack_push(stack, result);
      }
      else if (strcmp(args[i], "-") == 0 ){
         double op1 = double_stack_pop(stack);
         double op2 = double_stack_pop(stack);
         result = op2 - op1;
         double_stack_push(stack, result);
      }
      else if (strcmp(args[i], "X") == 0 ){
         double op1 = double_stack_pop(stack);
         double op2 = double_stack_pop(stack);
         result = op2 * op1;
         double_stack_push(stack, result);
      }
      else if (strcmp(args[i], "/") == 0 ){
         double op1 = double_stack_pop(stack);
         double op2 = double_stack_pop(stack);
         result = op2 / op1;
         double_stack_push(stack, result);
      }
      else if (strcmp(args[i], "^") == 0 ){
         double op1 = double_stack_pop(stack);
         double op2 = double_stack_pop(stack);
         result = pow(op2, op1);
         double_stack_push(stack, result);
      }
      else {
         result = strtod(args[i],NULL);
         double_stack_push(stack, result);
      }
   }
   return double_stack_pop(stack);
}
