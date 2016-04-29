-- Part 1

module Session4.Recursion where

-- >>> map (+100) []
-- []
-- >>> map (+100) [1, 2, 3, 4]
-- [101, 102, 103, 104]
-- >>> len []
-- 0
-- >>> len [1, 2, 3, 4]
-- 4
-- >>> sum []
-- 0
-- >>> sum [1, 2, 3, 4]
-- 10
-- >>> product []
-- 1
-- >>> product [1, 2, 3, 4]
-- 24

-- | empty
-- >>> empty []
-- True
-- >>> empty [1, 2, 3, 4]
-- False
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

-- | foldr
-- Examples:
-- >>> foldr (+) 0 [1, 2, 3, 4]
-- 10
-- >>> foldr (*) 1 [1, 2, 3, 4]
-- 24
foldr :: (a -> b -> b) -> b -> [a] -> b
foldr f z [] = z
foldr f z (x : xs) = f x (foldr f z xs)
