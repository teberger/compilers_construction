import Control.IO
import Data.Bits
import Data.Int

data OptCode = Opt1 "" |
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
opCode = undefined