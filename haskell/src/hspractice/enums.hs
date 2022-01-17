data Result = Nil | I Int | F Float | B Bool | C Char | S String
  deriving(Show, Eq)

showEval :: Result -> String
showEval Nil = "No return value"
showEval (I x) = show x
showEval (F x) = show x
showEval (B x) = show x
showEval (C x) = show x
showEval (S x) = show x



main :: IO ()
main = do 
    let ee = [ Nil, I 2, F 3.4, B True, C 'a', S "hiiii" ]
    mapM_ (putStrLn . showEval) ee