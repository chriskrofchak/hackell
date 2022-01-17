{-# OPTIONS_GHC -fwarn-incomplete-patterns #-}

module Eval where

import Prelude
import Syntax
import Data.Map (lookup, insert, Map, (!))
import Data.Maybe (fromMaybe, Maybe )

data Result = TypeError String | Inc | Nil | I Int | F Float | B Bool | C Char | S String
  deriving(Eq)

instance Show Result where
  show Nil = "No return value"
  show Inc = "Not implemented yet..."
  show (TypeError s) = "TypeError: " ++ s
  show (I x) = show x
  show (F x) = show x
  show (B x) = show x
  show (C x) = show x
  show (S x) = show x


eval :: Stmt -> Map String Lit -> Result
eval (Lamexpr l) env = evalL l env
eval (Eval l t) env = do 
    let rev = reverse t
    evalLam l env rev

evalLam :: Lamexpr -> Map String Lit -> [Term] -> Result 
evalLam (SLamexpr v lams) env (x:xs) = evalLam lams (insert v (resultLit (evalE x env)) env) xs
evalLam (SLamexpr _ _) env []        = TypeError "not enough literals to evaluate lambdas."
evalLam (Expr t) env []              = evalE t env
evalLam (Expr t) env (x:xs)          = TypeError "too few lambdas to evaluate all literals."
evalLam (Lam l1 l2) env _            = Inc

evalL :: Lamexpr -> Map String Lit -> Result
evalL (SLamexpr v sl) env = Inc 
evalL (Expr t) env        = evalE t env
evalL (Lam l1 l2) env     = Inc

evalE :: Term -> Map String Lit -> Result
evalE (Factor f) env = evalF f env
evalE (Op bin t1 t2) env = evalBin bin (evalE t1 env) (evalE t2 env)

-- brute forcing it... this is so inelegant but...
evalBin :: Binop -> Result -> Result -> Result 
evalBin Add (I l) (I r) = I (l + r) 
evalBin Add (F l) (F r) = F (l + r) 
evalBin Sub (I l) (I r) = I (l - r)
evalBin Sub (F l) (F r) = F (l - r)
evalBin Mul (I l) (I r) = I (l * r)
evalBin Mul (F l) (F r) = F (l * r)
evalBin Div (I l) (I r) = I (l `div` r)
evalBin Div (F l) (F r) = F (l / r)
evalBin Eql l r = B (l == r)
evalBin _ _ _   =  TypeError "mismatched types in binary operation"

evalF :: Factor -> Map String Lit -> Result
evalF (Lit l) env = evalLit l env
evalF (Brack t) env = evalE t env

evalLit :: Lit -> Map String Lit -> Result
evalLit (Var v)    env = do
    case Data.Map.lookup v env of
        Just x  -> evalLit x env 
        Nothing -> TypeError ("variable " ++ show v ++ " not in scope")
evalLit (LInt x)   env = I x
evalLit (LFloat x) env = F x
evalLit (LBool x)  env = B x
evalLit (LChar x)  env = C x
evalLit (LStr x)   env = S x

resultLit :: Result -> Lit
resultLit (I x) = LInt x
resultLit (F x) = LFloat x
resultLit (B x) = LBool x
resultLit (C x) = LChar x
resultLit (S x) = LStr x
resultLit  _    = Var "" -- SHOULD NEVER HAPPEN
