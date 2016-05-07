-- Part 1

module Session4.Recursion (test) where

import Prelude ((+), (*), Bool(..), Double, IO, Int, return)

-- | empty a.k.a. null
-- Examples:
-- >>> empty []
-- True
-- >>> empty [1, 2, 3, 4]
-- False
empty :: [a] -> Bool
empty [] = True
empty _ = False

-- | map
-- Examples:
-- >>> map (+100) []
-- []
-- >>> map (+100) [1, 2, 3, 4]
-- [101,102,103,104]
map :: (a -> b) -> [a] -> [b]
map _ [] = []
map f (x : xs) = f x : map f xs

-- | len a.k.a. length
-- Examples:
-- >>> len []
-- 0
-- >>> len [1, 2, 3, 4]
-- 4
len :: [a] -> Int
len [] = 0
len (_ : xs) = 1 + len xs

-- | sum
-- Examples:
-- >>> sum []
-- 0
-- >>> sum [1, 2, 3, 4]
-- 10
sum :: [Int] -> Int
sum [] = 0
sum (x : xs) = (+) x (sum xs)

-- | product
-- Examples:
-- >>> product []
-- 1.0
-- >>> product [1, 2, 3, 4]
-- 24.0
product :: [Double] -> Double
product [] = 1
product (x : xs) = (*) x (product xs) 

-- | foldr
-- Examples:
-- >>> foldr (+) 0 [1, 2, 3, 4]
-- 10
-- >>> foldr (*) 1 [1, 2, 3, 4]
-- 24
foldr :: (a -> b -> b) -> b -> [a] -> b
foldr _ z [] = z
foldr f z (x : xs) = f x (foldr f z xs)

test :: IO ()
test = do
    let _ = foldr (+) (0 :: Int) [1, 2, 3, 4]
        _ = empty ([1, 2, 3, 4] :: [Int])
        _ = len ([1, 2, 3, 4] :: [Int])
        _ = map (+100) [] :: [Int]
        _ = sum [1, 2, 3, 4]
        _ = product [1, 2, 3, 4]
    return ()
