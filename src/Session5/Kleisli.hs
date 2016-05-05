-- Part 2: Kleisli composition operator

module Session5.Kleisli where

instance Functor (State s) where
    fmap g (State f) = State (\st -> let (a, st') = f st
                                         b = g a
                                     in (b, st'))

(>=>) :: _
f >=> g = \a -> let bs = f a
                    css = fmap g bs
                in concat css
