module Syntax where

type Var = String
type Typelist = [Type]
type Args = [Var]

data Type = IntType | FloatType | CharType | StrType | ListType Type
  deriving (Eq, Show)

data Stmt 
  --  = Stmt Var Args Typelist Lamexpr 
  = Lamexpr Lamexpr
  | Eval Lamexpr [Term]
  deriving (Eq, Show)

data Lamexpr
  = SLamexpr Var Lamexpr 
  | Expr Term 
  | Lam Lamexpr Lamexpr 
  deriving (Eq, Show)

data Term
  = Factor Factor
  | Op Binop Term Term
  deriving (Eq,Show)

data Factor 
  = Brack Term 
  | Lit Lit
  deriving (Eq, Show)

data Lit
  = Var    Var
  | LInt   Int
  | LFloat Float
  | LBool  Bool
  | LChar  Char
  | LStr   String
  deriving (Show, Eq, Ord)

data Binop = Add | Sub | Mul | Eql | Div
  deriving (Eq, Ord, Show)