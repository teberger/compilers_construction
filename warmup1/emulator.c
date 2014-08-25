#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#define MAX_REGISTERS 8

struct
{
  unsigned int regA   : 3;
  unsigned int regB   : 3;
  unsigned int regC   : 3;
  unsigned int value  : 19;
  unsigned int opcode : 4;
} instruction;

enum OP_CODE
{
  CMOV = 0,
  A_IDX,
  A_UPD,
  ADD,
  MUL,
  DIV,
  NAND,
  HALT,
  ALLOC,
  DALLAC,
  OUTPUT,
  INPUT,
  LOAD,
  LOAD_IM
};

uint32** memory;
uint32* registers;

int main() {
  printf("%u", instruction);
}

