module Main (main) where
import Prelude hiding (Functor, fmap)

class Functor f where
    fmap :: (a -> b) -> f a -> f b

instance Functor Tree where
    fmap = mapT



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

main :: IO ()
main = do
    let t = Node (Node Empty 2 Empty) 1 (Node Empty 3 Empty)
    print $ fmap (+100) t
