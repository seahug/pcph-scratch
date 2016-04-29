-- Part 1

module Main (main) where
import Prelude hiding (foldr, map, product, sum)

-- a.k.a. "null"
empty :: [a] -> Bool
empty [] = True
empty _ = False

map :: (a -> b) -> [a] -> [b]
map _ [] = []
map f (x : xs) = f x : map f xs

-- a.k.a. "length"
len :: [a] -> Int
len [] = 0
len (_ : xs) = 1 + len xs

sum :: [Int] -> Int
sum [] = 0
sum (x : xs) = (+) x (sum xs)

product :: [Double] -> Double
product [] = 1
product (x : xs) = (*) x (product xs) 

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr f z [] = z
foldr f z (x : xs) = f x (foldr f z xs)

main :: IO ()
main = do
    print $ foldr (+) 0 [1, 2, 3, 4]
    print $ foldr (*) 1 [1, 2, 3, 4]
