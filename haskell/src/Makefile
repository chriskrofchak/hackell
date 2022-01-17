default:
	alex -g Lexer.x
	happy -g Parser.y
	ghc Lexer.hs
	ghc Syntax.hs
	ghc Parser.hs
	ghc Eval.hs
	ghc Main.hs -o hack

clean:
	rm *.o *.hi hack