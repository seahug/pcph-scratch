-- Part 3

module Session4.Functor where

import Prelude (($), (+), Int, Maybe(..), Show)

class Functor f where
    fmap :: (a -> b) -> f a -> f b

-- | Functor Tree
-- Examples:
-- >>> fmap (+100) $ Node (Node Empty 2 Empty) 1 (Node Empty 3 Empty)
-- Node (Node Empty 102 Empty) 101 (Node Empty 103 Empty)
instance Functor Tree where
    fmap = mapT

-- | mapMaybe
-- Examples:
-- >>> mapMaybe (+100) Nothing
-- Nothing
-- >>> mapMaybe (+100) (Just 10)
-- Just 110
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
