-- Part 5

module Session4.Reader where

class Functor f where
    fmap :: (a -> b) -> f a -> f b

data Reader e a = Reader (e -> a)

instance Functor (Reader e) where
    fmap g (Reader f) = Reader (g . f)

get :: Reader e a -> e -> a
get (Reader f) = f

main :: IO ()
main = do
    let r = Reader (+100) :: Reader Int Int
        r1 = fmap (*2) r
    print $ get r1 123
