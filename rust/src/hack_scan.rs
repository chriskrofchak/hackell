use logos::Logos;

#[derive(Logos, Debug, PartialEq)]
enum Token {
    // KEYWORDS
    #[token("fast")]
    Fast,
    #[token("enum")]
    Enum,
    #[token("begin")]
    Begin,
    #[token("end")]
    End,
    #[token("if")]
    If,
    #[token("then")]
    Then, 
    #[token("else")]
    Else,
    #[token("and")]
    And,
    #[token("or")]
    Or,
    #[token("lam")]
    Lam, 
    #[token("cons")]
    Cons,
    #[token("fst")]
    Fst,
    #[token("rst")]
    Rst,

    // TYPES
    #[token("i32")]
    I32, 
    #[token("u32")]
    U32,
    #[token("float")]
    Float,
    #[token("int")]
    Int,
    #[token("char")]
    Char,
    #[token("list")]
    List,
    #[token("vector")]
    Vector,

    // SYMBOLS 
    #[token("&&")] 
    Land,
    #[token("||")] 
    Lor,
    #[token(";")]  
    Semicolon,
    #[token("=")]  
    Equal,
    #[token("=>")] 
    Impl,
    #[token("->")] 
    Arrow,
    #[token("<-")] 
    Backarr,
    #[token("::")] 
    Nms,
    #[token(":")]  
    Colon,
    #[token(",")]  
    Comma,
    #[token(".")]  
    Dot,
    #[token("(")]  
    Lparen,
    #[token(")")]  
    Rparen,
    #[token("[")]  
    Lbrack,
    #[token("]")]  
    Rbrack,
    #[token("{")]  
    Lbrace,
    #[token("}")]  
    Rbrace,

    // Or regular expressions.
    #[regex("[_a-zA-Z][_a-zA-Z0-9]+", priority = 1)]
    Id,

    #[regex(r"[\n]+", logos::skip)]
    Nl,

    #[regex(r"[ \t\f]+")]
    Whitespace,

    // Logos requires one token variant to handle errors,
    // it can be named anything you wish.
    #[error]
    // We can also use this variant to define whitespace,
    // or any other matches we wish to skip.
    Error,
}
