module Main where

import           Prelude
import qualified Session4.Recursion as S4P1
import qualified Session4.Trees as S4P2
import qualified Session4.Functor as S4P3
import qualified Session4.Identity as S4P4
import qualified Session4.Reader as S4P5
import qualified Session5.State as S5P1

main :: IO ()
main = do
    S4P1.test
    S4P2.test
    S4P3.test
    S4P4.test
    S4P5.test
    S5P1.test
