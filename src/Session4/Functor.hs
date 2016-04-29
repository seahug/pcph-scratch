-- Part 3

module Session4.Functor where

import Prelude (($), (+), Int, Maybe(..), Show)

mapMaybe :: (a -> b) -> Maybe a -> Maybe b
mapMaybe _ Nothing = Nothing
mapMaybe f (Just a) = Just (f a)

class Functor f where
    fmap :: (a -> b) -> f a -> f b

-- | Functor Maybe
-- Examples:
-- >>> fmap (+100) Nothing
-- Nothing
-- >>> fmap (+100) (Just 10)
-- Just 110
instance Functor Maybe where
    fmap = mapMaybe
