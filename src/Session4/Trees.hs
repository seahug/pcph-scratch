-- Part 2

module Session4.Trees where

import Prelude (($), (+), Int, Maybe(..), Show)

mapMaybe :: (a -> b) -> Maybe a -> Maybe b
mapMaybe _ Nothing = Nothing
mapMaybe f (Just a) = Just (f a)

data Tree a = Empty | Node (Tree a) a (Tree a) deriving Show

-- | sumT
-- Examples:
-- >>> sumT $ Node (Node Empty 2 Empty) 1 (Node Empty 3 Empty)
-- 6
sumT :: Tree Int -> Int
sumT Empty = 0
sumT (Node l x r) = sumT l + x + sumT r

-- | mapT
-- Examples:
-- >>> mapT (+100) $ Node (Node Empty 2 Empty) 1 (Node Empty 3 Empty)
-- Node (Node Empty 102 Empty) 101 (Node Empty 103 Empty)
mapT :: (a -> b) -> Tree a -> Tree b
mapT _ Empty = Empty
mapT f (Node l x r) = Node (mapT f l) (f x) (mapT f r)
