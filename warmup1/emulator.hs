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
type Register = Int32
type Registers = [Int32]
type MachineState = (Registers, Memory)

main :: IO ()
main = return ()

opCode :: Int32 -> OptCode
opCode instruction =  toEnum . fromIntegral $ (instruction .&. (0x0007))

--{-
condMove :: Int32 -> State MachineState MachineState
condMove inst = do
  (regs, mem) <- get
  let idxA = inst .&. 0xE0
      idxB = inst .&. 0x1B
      idxC = inst .&. 0x7
      newRegisters = [ r | r <- regs, (regs !! idxC) != 0]
  
  
  return (regs, mem)
--}
