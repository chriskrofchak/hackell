# haCKell 

All haCKell source files are in src. Current supported types are characters, integers, floats, strings and boolean. 

Here are some examples

```
haCK>1+1+1+1+1+1+2 == 3*3 - 1       
> True
haCK>( lam x .. 5 ) 2
> 5
haCK>'a' == 'a'
> True
haCK>"bee" == "beehive"
> False
haCK>"bee" == "bee"
> True
haCK>(lam x .. lam y .. x + 3f * y ) 2.1 3.3
> 12.0
haCK>(lam x .. lam y .. x + 3f * y ) 2.1 3.4        
> 12.300001
```

## Language Extensions 

* Extend REPL environment to declare variables
* Array type support
* Control flow (if then else in expressions)
* User data types (product and sum) and type inferrence

## Metaprogramming 

This might be nuclear but I am very interested in hosting efficient macro writing capabilities like in Rust and potentially "reflection" as is the case in languages like Smalltalk and Ruby. I've heard from a few different people that metaprogramming in Ruby is really something so I'd have to investigate.