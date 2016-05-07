-- Part 1: State monad as a functor

module Session5.State (test) where

import Prelude

data State s a = State (s -> (a, s))

instance Functor (State s) where
    fmap g (State f) = State (\st -> let (a, st') = f st
                                         b = g a
                                     in (b, st'))

(>=>) :: (a -> [b]) -> (b -> [c]) -> a -> [c]
f >=> g = \a -> let bs = f a
                    css = fmap g bs
                in concat css

test :: IO ()
test = do
    let f0 :: Int -> [String]
        f0 _ = []
        f1 :: String -> [Double]
        f1 _ = []
        g = f0 >=> f1
    print $ g 0
    return ()
