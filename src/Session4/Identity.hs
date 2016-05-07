-- Part 4

module Session4.Identity (test) where

import Prelude (IO, Show, return)

data I a = I a deriving Show

class Functor f where
    fmap :: (a -> b) -> f a -> f b

-- | I
-- Examples:
-- >>> fmap (*1000) (I 1234)
-- I 1234000
instance Functor I where
    fmap f (I x) = I (f x)

test :: IO ()
test = return ()
