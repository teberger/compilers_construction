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
type Registers = Array Int Int32
type MachineState = (Registers, Memory)

main :: IO ()
main = return ()

opCode :: Int32 -> OptCode
opCode instruction =  toEnum . fromIntegral $ (instruction .&. (0x0007))

--{-
condMove :: Int32 -> State MachineState MachineState
condMove inst = do
  (regs, mem) <- get
  let idxA = fromIntegral $ inst .&. 0xE0
      idxB = fromIntegral $ inst .&. 0x1B
      regC = regs ! (fromIntegral $ inst .&. 0x07)
  if regC /= 0
    then let regA = regs !! idxA
             regB = regs !! idxB

  return (regs, mem)
--}
