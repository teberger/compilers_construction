import Control.IO
import Data.Bits
import Data.Int
import Data.Array.Boxed

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
               Load_Immediate


main :: IO ()
main = return ()

opCode :: Int32 -> OptCode
opCode a = a .&. (0x0007)


