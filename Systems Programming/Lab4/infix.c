#include "infix.h"

// make operator opStack
struct op_stack {
  char ** items;
  int max_size;
  int top;
};

struct op_stack * op_stack_new(int max_size) {
   struct op_stack * result;

   // allocate space for the stack header
   result = malloc(sizeof(struct op_stack));
   result->max_size = max_size;
   result->top = 0;
   // allocate space for the data stored in the stack
   result->items = malloc(sizeof(char *)*max_size);
   // return a pointer to the newly-allocated stack
   return result;
}

// push a value onto the stack
void op_stack_push(struct op_stack * this, char * value) {
   this->top++;
   this->items[this->top] = value;
}

// pop a value from the stack
char * op_stack_pop(struct op_stack * this) {
   char * result = this->items[this->top];
   this->top--;
   return result;
}



// evaluate expression stored as an array of string tokens
double evaluate_infix_expression(char ** args, int nargs) {
   int i, j = 0;
   char * postfixExp[nargs];
   struct op_stack * opStack = op_stack_new(nargs);
   int bracketCount = 0;
   op_stack_push(opStack, "0"); //SET END POINT FOR opStack
   for (i=0; i<nargs; i++) {
      if (strcmp(args[i], "(") == 0 ){
         bracketCount++;
         op_stack_push(opStack, args[i]);
      }
      else if (strcmp(args[i],"^")==0){
         while (strcmp(opStack->items[opStack->top],"^") == 0 ){
            postfixExp[j] = op_stack_pop(opStack);
            j++;
         }
         op_stack_push(opStack, args[i]);
      }
      else if (strcmp(args[i],"X")==0 || strcmp(args[i],"/")==0){
         while (strcmp(opStack->items[opStack->top],"^") == 0 ||strcmp(opStack->items[opStack->top],"X") == 0 || strcmp(opStack->items[opStack->top],"/") == 0 ){
            postfixExp[j] = op_stack_pop(opStack);
            j++;
         }
         op_stack_push(opStack, args[i]);
      }
      else if (strcmp(args[i],"+")==0 || strcmp(args[i],"-")==0){
         while (strcmp(opStack->items[opStack->top],"^") == 0 || strcmp(opStack->items[opStack->top],"X") == 0 || strcmp(opStack->items[opStack->top],"/") == 0  || strcmp(opStack->items[opStack->top],"+") == 0  || strcmp(opStack->items[opStack->top],"-") == 0 ){
            postfixExp[j] = op_stack_pop(opStack);
            j++;
         }
         op_stack_push(opStack, args[i]);
      }
      else if (strcmp(args[i],")")==0){
         bracketCount++;
         while (strcmp(opStack->items[opStack->top],"(") != 0){
            postfixExp[j] = op_stack_pop(opStack);
            j++;
         }
         op_stack_pop(opStack);
      }
      else {
         postfixExp[j] = args[i];
         j++;
      }
   }
   while (strcmp(opStack->items[opStack->top],"0") != 0){
      postfixExp[j] = op_stack_pop(opStack);
      j++;
   }
   return evaluate_postfix_expression(postfixExp, nargs-bracketCount);
}
