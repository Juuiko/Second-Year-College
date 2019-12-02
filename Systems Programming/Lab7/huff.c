// code for a huffman coder
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <ctype.h>

#include "huff.h"
#include "bitfile.h"

// create a new huffcoder structure
struct huffcoder *  huffcoder_new()
{
  struct huffcoder * hCoder = malloc(sizeof(struct huffcoder));
	for(int i = 0; i < 256; i++) {
		hCoder->freqs[i] = 0;
		hCoder->code_lengths[i] = 0;
		hCoder->codes[i] = 0;
	}
	return hCoder;
}

// count the frequency of characters in a file; set chars with zero
// frequency to one
void huffcoder_count(struct huffcoder * this, char * filename) {
   unsigned char c;
   FILE * file;

   file = fopen(filename, "r");
   assert(file != NULL);
   c = fgetc(file);
   while(!feof(file)) {
      this->freqs[(int) c]++;
      c = fgetc(file);
   }

   for(int i = 0; i < 256; i++){
      if(this->freqs[i] == 0) this->freqs[i] = 1;
   }

   fclose(file);
}

void swap(struct huffchar ** node1, struct huffchar ** node2) {
	struct huffchar * swapNode = *node1;
	*node1 = *node2;
	*node2 = swapNode;
}

void sort(struct huffchar * nodes[], int size) {
	for(int i = 0; i < size; i++){
      for(int j = 0; j < size - i - 1; j++){

         if(nodes[j]->freq < nodes[j + 1]->freq){
            swap(&nodes[j], &nodes[j + 1]);
         } else if (nodes[j]->freq == nodes[j + 1]->freq &&
                           nodes[j]->seqno < nodes[j + 1]->seqno){
            swap(&nodes[j], &nodes[j + 1]);
         }
      }
   }
}

struct huffchar * compundChar(struct huffchar * node1, struct huffchar * node2, int seqno) {
	struct huffchar * compChar = malloc(sizeof(struct huffchar));
	compChar->freq = node1->freq + node2->freq;
	compChar->is_compound = 1;
	compChar->seqno = seqno;
   if(node1->freq < node2->freq){
      swap(&node1, &node2);
   } else if (node1->freq == node2->freq &&
                     node1->seqno < node2->seqno){
      swap(&node1, &node2);
   }
	compChar->u.compound.right = node1;
   compChar->u.compound.left = node2;
	return compChar;
}

void addLeaves(struct huffcoder * this, struct huffchar * nodes[], int size) {
	for(int i = 0; i < size; i++) {
		struct huffchar * leaf = malloc(sizeof(struct huffchar));
		leaf->freq = this->freqs[i];
		leaf->is_compound = 0;
		leaf->seqno = i;
		leaf->u.c = i;
		nodes[i] = leaf;
	}
}

// using the character frequencies build the tree of compound
// and simple characters that are used to compute the Huffman codes
void huffcoder_build_tree(struct huffcoder * this) {
	int size = 256;
	struct huffchar * nodes[size];
	addLeaves(this, nodes, size);
	for(int i = 0, seqNum = 256; i < size-1; i++) {
		int arraySize = size-i;
		sort(nodes, arraySize);
		nodes[arraySize-2] = compundChar(nodes[arraySize-1], nodes[arraySize-2], seqNum++);
	}
	this->tree = nodes[0];
}

void huffcoder_tree2table_r(struct huffcoder * this, struct huffchar * node, int * path, int depth) {
	if(node->is_compound) {
		*path <<= 1;
		int temp = *path;
		huffcoder_tree2table_r(this, node->u.compound.left, path, depth + 1);
		*path = temp + 1;
		huffcoder_tree2table_r(this, node->u.compound.right, path, depth + 1);
	} else {
		this->code_lengths[node->u.c] = depth;
		this->codes[node->u.c] = *path;
	}
}

// using the Huffman tree, build a table of the Huffman codes
// with the huffcoder object
void huffcoder_tree2table(struct huffcoder * this) {
  huffcoder_tree2table_r(this, this->tree, malloc(sizeof(int)), 0);
}



// print the Huffman codes for each character in order;
// you should not modify this function
void huffcoder_print_codes(struct huffcoder * this)
{
  int i, j;
  char buffer[NUM_CHARS];

  for ( i = 0; i < 256; i++ ) {
    // put the code into a string
    assert(this->code_lengths[i] < 256);
    for ( j = this->code_lengths[i]-1; j >= 0; j--) {
      buffer[j] = ((this->codes[i] >> (this->code_lengths[i] - 1 - j)) & 1) + '0';
    }
    // don't forget to add a zero to end of string
    buffer[this->code_lengths[i]] = '\0';

    // print the code
    printf("char: %d, freq: %d, code: %s\n", i, this->freqs[i], buffer);;
  }
}

// encode the input file and write the encoding to the output file
void huffcoder_encode(struct huffcoder * this, char * input_filename,
    char * output_filename)
{
}

// decode the input file and write the decoding to the output file
void huffcoder_decode(struct huffcoder * this, char * input_filename,
    char * output_filename)
{
}
