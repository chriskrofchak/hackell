module Main where

data BTNode a = TNil | Node a (BTNode a) (BTNode a)
  deriving (Show, Eq)

data LList a = LNil | Cons a (LList a)
  deriving (Show, Eq)

strdup :: Int -> String -> String
strdup n string = concat $ replicate n string

lmake :: [a] -> LList a 
lmake = foldr Cons LNil

lmap :: (a -> b) -> LList a -> LList b 
lmap _ LNil = LNil 
lmap f (Cons x rest) = Cons (f x) (lmap f rest)

lstr :: Show a => LList a -> String
lstr LNil = "LNil"
lstr (Cons x rest) = show x ++ ",~ " ++ lstr rest

lprint :: Show a => LList a -> IO ()
lprint = putStrLn . lstr

makespace :: Int -> String
makespace i  = strdup i " "

btstr :: Show a => Int -> BTNode a -> String 
btstr i TNil = makespace i  ++ "TNil\n"
btstr i (Node a l r) = makespace i ++ show a ++ "\n" ++ btstr (i+1) l ++ btstr (i+1) r 

main :: IO ()
main = do 
    let lis = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    let lis2 = lmap (\x -> -x) (lmake lis)
    lprint lis2
    let btree = Node 12 (Node 7 (Node 6 TNil TNil) TNil) (Node 11 TNil TNil)
    putStrLn (btstr 0 btree)