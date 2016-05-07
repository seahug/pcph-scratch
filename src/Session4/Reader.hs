-- Part 5

module Session4.Reader (test) where

import Prelude ((.), (+), (*), IO, Int, return)

data Reader e a = Reader (e -> a)

get :: Reader e a -> e -> a
get (Reader f) = f

class Functor f where
    fmap :: (a -> b) -> f a -> f b

-- | get
-- Examples:
-- >>> get (fmap (*2) (Reader (+100))) 123
-- 446
instance Functor (Reader e) where
    fmap g (Reader f) = Reader (g . f)

test :: IO ()
test = do
    let _ = get (fmap (*2) (Reader (+100))) 123 :: Int
    return ()
