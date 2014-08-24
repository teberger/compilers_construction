import Data.Bits
import Data.Int
import Data.Array

type Register = Int32

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
type Registers = [Int32]
type MachineState = (Register, Memory)

main :: IO ()
main = return ()

opCode :: Int32 -> OptCode
opCode a =  toEnum . fromIntegral $ (a .&. (0x0007))

