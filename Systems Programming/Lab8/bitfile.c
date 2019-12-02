// C code file for  a file ADT where we can read a single bit at a
// time, or write a single bit at a time

#include <stdlib.h>
#include <assert.h>
#include <string.h>
#include <stdio.h>

#include "bitfile.h"

// open a bit file in "r" (read) mode or "w" (write) mode
struct bitfile * bitfile_open(char * filename, char * mode) {
  struct bitfile * file = malloc(sizeof(struct bitfile));
  file->buffer = 0;
  file->index = 7;
  file->is_EOF = 0;

  if(*mode == 'r') {
    file->is_read_mode = 1;
    file->file = fopen(filename, "r");
  } else {
    file->is_read_mode = 0;
    file->file = fopen(filename, "w");
  }
  return file;
}

// write a bit to a file; the file must have been opened in write mode
void bitfile_write_bit(struct bitfile * this, int bit) {
  this->buffer |= (bit << (7 - this->index));
  if(this->index == 0) {
    fputc(this->buffer, this->file);
    this->buffer = 0;
    this->index = 7;
  } else this->index--;
}

// read a bit from a file; the file must have been opened in read mode
int bitfile_read_bit(struct bitfile * this) {
  if(this->index == -1) this->index = 7;
  if(this->index == 7) this->buffer = fgetc(this->file);
  return (this->buffer >> (7 - this->index--)) % 2;
}

// close a bitfile; flush any partially-filled buffer if file is open
// in write mode
void bitfile_close(struct bitfile * this) {
  this->is_EOF = 1;
  if(!this->is_read_mode && this->index != 7) fputc(this->buffer, this->file);
  fclose(this->file);
}

// check for end of file
int bitfile_end_of_file(struct bitfile * this) {
   if(this->is_EOF || feof(this->file)) return 1;
   else return 0;
}
