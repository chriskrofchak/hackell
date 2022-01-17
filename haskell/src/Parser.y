{
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Parser where

import Lexer
import Syntax

import Control.Monad.Except

}

-- Entry point: hackp since hackell parse lol
%name hackp

-- Lexer structure 
%tokentype { Token }

-- Parser monad
%monad { Except String } { (>>=) } { return }
%error { parseError }

-- Token Names

%token
  enum                { TokEnum }      
  import              { TokImport }     
  begin               { TokBegin }  
  end                 { TokEnd }      
  if                  { TokIf } 
  then                { TokThen }  
  else                { TokElse }  
  and                 { TokAnd } 
  or                  { TokOr } 
  lam                 { TokLam } 
  cons                { TokCons }   
  fst                 { TokFst }   
  rst                 { TokRst }  
  let	 	       { TokLet }
  main                { TokMain }
  true                { TokTTrue }
  false               { TokTFalse }
  intlit   	       { TokIntLit $$ }
  floatlit            { TokFloatLit $$ }
  charlit   	       { TokCharLit $$ }
  strlit              { TokStrLit $$ }
  float               { TokFloatType }
  int                 { TokIntType }
  char                { TokCharType }
  str                 { TokStrType }
  list                { TokList } 
  '&&'                { TokLand    }
  '||'                { TokLor     }
  '=>'                { TokImpl    }
  '=='                 { TokIsEq }
  '->'                { TokArrow   } 
  '<-'                { TokBackarr } 
  '::'                { TokNms     }
  '..'                { TokBullet  }
  ident   		  { TokVar $$ }
  '.'                 { TokDot }
  ','                 { TokComma }
  ';'                 { TokSemi }
  ':'                 { TokCol }
  '='                 { TokEqs }
  '|'                 { TokPipe }
  '['                 { TokLBrack }
  ']'                 { TokRBrack }
  '{'                 { TokLBrace }
  '}'                 { TokRBrace }
  '('                 { TokLParen }
  ')'                 { TokRParen }
  '+'                 { TokPlus }
  '-'                 { TokMinus }
  '*'                 { TokTimes }
  '/'                 { TokDivide } 

-- Operators
%left '=='
%left '+' '-'
%left '*' '/'
%%

Stmt :: { Stmt }
Stmt : Lamx                        { Lamexpr $1 } -- args empty for now
     | '(' Lamx ')' Terms          { Eval $2 $4 }

Terms :: { [Term] }
Terms : Terms Term                 { $2:$1 }
      | {- EMPTY -}                { [] } 

Lamx :: { Lamexpr }
Lamx : lam ident '..' Lamx         { SLamexpr $2 $4 }
     | Term                        { Expr $1 }

Term : Term '+' Term               { Op Add $1 $3 }
     | Term '-' Term               { Op Sub $1 $3 }
     | Term '*' Term               { Op Mul $1 $3 }
     | Term '/' Term               { Op Div $1 $3 }
     | Term '==' Term              { Op Eql $1 $3 }
     | Factor                      { Factor $1 }

Factor :: { Factor }
Factor : '(' Term ')'              { Brack $2 }
     | Id                          { Lit $1 }

Id :: { Lit }
Id  : ident                        { Var $1 }
    | intlit                       { LInt $1 }
    | floatlit                     { LFloat $1 }
    | charlit                      { LChar $1 }
    | strlit                       { LStr $1 }
    | true                         { LBool True }
    | false                        { LBool False }
    
{
-- COMES FROM THE EXAMPLES ONLINE... 
-- I think this is literally from Happy documentation

parseError :: [Token] -> Except String a
parseError (l:ls) = throwError (show l)
parseError [] = throwError "Unexpected end of Input"

}