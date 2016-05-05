-- Part 1: State monad as a functor

module Session5.State where

import Prelude

data State s a = State (s -> (a, s))

instance Functor (State s) where
    fmap g (State f) = State (\st -> let (a, st') = f st
                                         b = g a
                                     in (b, st'))
