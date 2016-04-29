-- Part 1

module Session4.Recursion where

import Prelude ((+), (*), Bool(..), Double, Int)

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
foldr f z [] = z
foldr f z (x : xs) = f x (foldr f z xs)
