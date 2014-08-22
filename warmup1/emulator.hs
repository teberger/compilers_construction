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
               Load_Immediate deriving Enum


main :: IO ()
main = return ()

opCode :: Int32 -> OptCode
opCode a = case a .&. (0x0007) 
           of 1 -> ConditionalMove
              2 -> Array_Index 
              3 ->  Array_Update 
              4 -> Addition  
              5 -> Multiplication 
              6 -> Division 
              7 -> Nand 
              8 -> Halt 
               Allocation 
               Deallocation  
               Output 
               Input  
               Load 
               Load_Immediate


