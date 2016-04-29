module Main (main) where

import           Prelude
import qualified System.FilePath.Glob as Glob
import qualified Test.DocTest as DocTest

includeDirs :: [String]
includeDirs = []

doctestWithIncludeDirs :: [String] -> IO ()
doctestWithIncludeDirs fs =
    DocTest.doctest $
        ["-XNoImplicitPrelude"] ++ (map ("-I" ++) includeDirs ++ fs)

main :: IO ()
main = Glob.glob "src/**/*.hs" >>= doctestWithIncludeDirs
