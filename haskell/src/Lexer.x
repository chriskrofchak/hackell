{
module Lexer where
}

%wrapper "basic"

$digit = 0-9			-- digits
$alpha = [a-zA-Z]		-- alphabetic characters
$alun  = [$alpha \_] -- alph + underscore

tokens :-

  $white+				;
  "--".*				;
  enum                { \s -> TokEnum }      
  import              { \s -> TokImport }     
  begin               { \s -> TokBegin }  
  end                 { \s -> TokEnd }      
  if                  { \s -> TokIf } 
  then                { \s -> TokThen }  
  else                { \s -> TokElse }  
  and                 { \s -> TokAnd } 
  or                  { \s -> TokOr } 
  lam                 { \s -> TokLam } 
  cons                { \s -> TokCons }   
  fst                 { \s -> TokFst }   
  rst                 { \s -> TokRst }  
  let	 				        { \s -> TokLet }
  main                { \s -> TokMain }
  true                { \s -> TokTTrue }
  false               { \s -> TokTFalse }
  $digit+		          { \s -> TokIntLit (read s) }
  $digit+f		        { \s -> TokFloatLit (read (init s)) }
  $digit+\.$digit+    { \s -> TokFloatLit (read s) }
  float               { \s -> TokFloatType }
  int                 { \s -> TokIntType }
  char                { \s -> TokCharType }
  str                 { \s -> TokStrType }
  list                { \s -> TokList }
  \&\&                { \s -> TokLand    }
  \|\|                { \s -> TokLor     }
  \=\>                { \s -> TokImpl    }
  \=\=                { \s -> TokIsEq }
  \-\>                { \s -> TokArrow   } 
  \<\-                { \s -> TokBackarr } 
  \:\:                { \s -> TokNms     }
  $alpha [$alpha $digit \']*		     { \s -> TokVar s }
  \'$alpha\'         { \s -> TokCharLit (head (init (tail s))) }
  \"$alpha*\"        { \s -> TokStrLit (init (init s)) }
  \.                 { \s -> TokDot }
  \.\.               { \s -> TokBullet }
  \,                 { \s -> TokComma }
  \;                 { \s -> TokSemi }
  \:                 { \s -> TokCol }
  \=                 { \s -> TokEqs }
  \|                 { \s -> TokPipe }
  \[                 { \s -> TokLBrack }
  \]                 { \s -> TokRBrack }
  \{                 { \s -> TokLBrace }
  \}                 { \s -> TokRBrace }
  \(                 { \s -> TokLParen }
  \)                 { \s -> TokRParen }
  \+                 { \s -> TokPlus }
  \-                 { \s -> TokMinus }
  \*                 { \s -> TokTimes }
  \/                 { \s -> TokDivide } 
{
-- Each action has type :: String -> Token

-- The token type:
data Token =
  TokEnum        |
  TokImport      |
  TokBegin       |
  TokEnd         |  
  TokIf          |  
  TokThen        |
  TokElse        | 
  TokAnd         | 
  TokOr          |
  TokLam         | 
  TokCons        | 
  TokFst         |
  TokRst         |
  TokLet         |
  TokIn          |
  TokMain        |
  TokLand        |
  TokLor         |
  TokImpl        |
  TokIsEq        |
  TokArrow       |
  TokBackarr     |
  TokNms         |
  TokIntType     |
  TokTTrue       |
  TokTFalse      |
  TokFloatType   |
  TokCharType    |
  TokStrType     |
  TokList        |
  TokDot         |
  TokBullet      |
  TokComma       |
  TokSemi        |
  TokCol         |
  TokEqs         |
  TokPipe        |
  TokLBrack      |
  TokRBrack      |
  TokLBrace      |
  TokRBrace      |
  TokLParen      |
  TokRParen      |
  TokPlus        |
  TokMinus       |
  TokTimes       |
  TokDivide      |
  TokVar String  |
  TokIntLit Int  | 
  TokCharLit Char  | 
  TokStrLit  String  | 
  TokFloatLit Float 
  deriving (Eq,Show)

}