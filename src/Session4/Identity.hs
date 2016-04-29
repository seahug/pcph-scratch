-- Part 4

module Session4.Identity where

import Prelude ((+), (*), ($), Int, Maybe(..), Show)

class Functor f where
    fmap :: (a -> b) -> f a -> f b

instance Functor Tree where
    fmap = mapT

-- | I
-- Examples:
-- >>> fmap (*1000) (I 1234)
-- I 1234000
data I a = I a deriving Show

instance Functor I where
    fmap f (I x) = I (f x)

mapMaybe :: (a -> b) -> Maybe a -> Maybe b
mapMaybe _ Nothing = Nothing
mapMaybe f (Just a) = Just (f a)

data Tree a = Empty | Node (Tree a) a (Tree a) deriving Show

sumT :: Tree Int -> Int
sumT Empty = 0
sumT (Node l x r) = sumT l + x + sumT r

mapT :: (a -> b) -> Tree a -> Tree b
mapT _ Empty = Empty
mapT f (Node l x r) = Node (mapT f l) (f x) (mapT f r)
