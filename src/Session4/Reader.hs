-- Part 5

module Session4.Reader where

import Prelude ((.), (+), (*))

class Functor f where
    fmap :: (a -> b) -> f a -> f b

data Reader e a = Reader (e -> a)

instance Functor (Reader e) where
    fmap g (Reader f) = Reader (g . f)

-- | get
-- Examples:
-- >>> get (fmap (*2) (Reader (+100))) 123
-- 446
get :: Reader e a -> e -> a
get (Reader f) = f
