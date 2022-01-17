# haCKell 

Originally sought out to make a toy programming language for two reasons: to learn LLVM and to explore how languages host metaprogramming features for users. As of right now these goals have not yet been met, as school picks up this project is going to be extended on break at the end of term and throughout the summer.

haCKell as of right now (Jan '22) is nothing more than a glorified lambda calculus interpreter and calculator... However I have familiarized myself with Haskell, Alex and Happy which means extending the language will be easier than the work I have done up to this point.

So far the syntax is as you would expect for any kind of arithmetic, and then, for lambda expressions, the "bullet" is a double dot and lambda is the keyword `lam`. Each lambda expression to be evaluated expects the lambda expression parenthesized and followed by as many terms as there are lambdas, which get evaluated left to right (and from the outside inwards in the lambda). For example

```
haCK> ( lam x .. lam y .. lam z .. x*(y+1)*(z+2) ) 2 3 5
> 56
```
since `2*(3+1)*(5+2) = 8*7 = 56`. If only 2 and 3 were provided, a "TypeError" will show up and similarly if there were only two lambdas and three arguments.

## Haskell 

The following two folders hold the interpreter written in Haskell using Alex basic lexing (`Lexer.x`) and Happy monadic parser (`Parser.y`) to parse the input and then some simple tree traversal functions to evaluate input in `Eval.hs`.

Simply evoke `make` and make sure you have Alex and Happy installed (via cabal, or I think you can even download it with Homebrew (also make sure to check that it's in your path, I had to add it to path manually to get them to work)). You also need `ghc`, it is optimized to compile with `ghc` because from the documentation the `-g` flag makes it much faster when it knows the compiler so I thought why not, most use `ghc` anyways. 

## Rust 

Rust was abandoned basically a few hours into coding this given that the meta-programming capabilities which make me so fond of Rust were not going to be much use when making this compiler and I thought Haskell was syntactically much simpler. As I basically copy a lot of Haskell syntax (hence the name) I thought it easier to just use Haskell. However, in these files you'll see the use of `logos` which is a Rust crate made by a very smart team of programmers and offers really fast lexing. I also found a domain specific language similar to Happy but for use in Rust (both of which are basically yacc), so in the future it could be fun to implement in Rust and investigate how Rust procedural macros affect hosting metaprogramming...