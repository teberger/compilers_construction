import Data.Bits
import Data.Int
import Data.Array
import Control.Monad.State


data OptCode = Conditional_Move |
               Array_Index |
               Array_Update | 
               Addition | 
               Multiplication | 
               Division |
               Nand |
               Halt |
               Allocation |
               Deallocation | 
               Output |
               Input | 
               Load |
               Load_Immediate deriving (Enum, Eq, Show)
                                                                              
type Memory = Array Int32 (Array Int32 Int32)
type Instruction = Int32
type Register = Int32
type Registers = Array Int Int32
type MachineState = (Registers, Memory)

main :: IO ()
main = return ()

opCode :: Instruction -> OptCode
opCode instruction =  toEnum . fromIntegral $ (instruction .&. (0x0007))

arrayIndex :: Instruction -> State MachineState MachineState
arrayIndex inst = do
  (regs, mem) <- get
  let arrId  = regs ! (fromIntegral $ inst .&. 0x1B)
      idxA   = (fromIntegral $ inst .&. 0xE0)
      offset = regs ! (fromIntegral $ inst .&. 0x07)
      val = (mem ! arrId) ! offset
  return (regs // (idxA, val), mem)

{- -}
condMove :: Instruction -> State MachineState MachineState
condMove inst = do
  (regs, mem) <- get
  let idxA = fromIntegral $ inst .&. 0xE0 
      idxB = fromIntegral $ inst .&. 0x1B 
      regC = regs ! (fromIntegral $ inst .&. 0x07)
  if regC /= 0
    then return (newRegs regs idxA idxB, mem)
    else return (regs, mem)
  
  where newRegs regs ia ib = regs // [(ia, regs ! ib),
                                      (ib, regs ! ia)]
--}
