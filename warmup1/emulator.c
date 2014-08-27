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
void set_instruction();

int main() {
  uint32_t i = 0x800001F5;
  set_instruction(i);
  conditional_move();
}

void set_instruction(uint32_t i) {
  instruction.regA = (i & 0x00000007);
  instruction.regB = (i & 0x00000038) >> 3;
  instruction.regC = (i & 0x000001B0) >> 6;
  instruction.value = (i & 0x0FFFFE00) >> 9;
  instruction.opcode = (i & 0xF0000000) >> 28;
}

void conditional_move() {
  printf("Moving from register %u to %u if %u is 0. Op code is: %u", instruction.regA, instruction.regB, instruction.regC, instruction.opcode);
}
