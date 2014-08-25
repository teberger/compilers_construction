#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#define MAX_REGISTERS 8
#define REG_A instruction.regA
#define REG_B (instruction.regB >> 3)
#define REG_C (instruction.regC >> 3)
#define OPCODE (instruction.opcode >> 28)


struct
{
  unsigned int regA   : 3;
  unsigned int regB   : 3;
  unsigned int regC   : 3;
  unsigned int value  : 19;
  unsigned int opcode : 4;
} instruction;

enum OpCodeEnum
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

static uint32_t ** memory;
static uint32_t * registers;

void conditional_move();

int main() {
  instruction = (struct) 0b00000000000000000000000111110101;
  conditional_move();
}

void conditional_move() {
  printf("Moving from register %u to %u if %u is 0", REG_A, REG_B, REG_C);
}
