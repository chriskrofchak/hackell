module Main where

import Parser
import Syntax
import Control.Monad ( unless )
import Control.Monad.Except ( runExceptT, runExcept, Except )
import Lexer (alexScanTokens)
import Data.Functor.Identity(runIdentity) 
import Data.Map ( fromList )
import Eval
import qualified Data.Sequence as Data.Map

parse :: String -> Except String Stmt
parse = hackp . alexScanTokens

excParse :: String -> Either String Stmt
excParse s = runIdentity $ do runExceptT $ do parse s

main :: IO ()
main = do 
  inStr <- getLine
  unless (inStr == "q") $ do
    let res = excParse inStr
    case res of
      Left err -> print ("Failed on input: " ++ err)
      Right t  -> do
        print t
        let env = fromList [ ("env", LInt 1) ]
        print (eval t env)
    main
  