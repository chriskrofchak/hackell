use std::fs::File;
use std::io::prelude::*;
use std::path::Path;
use std::env;
// use voca_rs::case::capitalize;

// thank you Rust documentation!! 
fn read_file(path: &String) -> String {
    // Create a path to the desired file
    let path = Path::new(path);
    let display = path.display();

    // Open the path in read-only mode, returns `io::Result<File>`
    let mut file = match File::open(&path) {
        Err(why) => panic!("couldn't open {}: {}", display, why),
        Ok(file) => file,
    };

    // Read the file contents into a string, returns `io::Result<usize>`
    let mut s = String::new();
    match file.read_to_string(&mut s) {
        Err(why) => panic!("couldn't read file {}: {}", display, why),
        Ok(_) => {},
    }

    s
}

pub fn read_files(paths: &Vec<String>) -> Vec<String> {
    paths.iter().map(|path| read_file(path)).collect::<Vec<String>>()
}

fn make_ascii_titlecase(s: &mut String) {
    if let Some(r) = s.get_mut(0..1) {
        r.make_ascii_uppercase();
    }
}

fn capitalize(tok: &str, low: &bool) -> String {
    let mut tok_lower: String = match *low {
        true  => tok.to_lowercase().to_string(),
        false => tok.to_string()
    };
    make_ascii_titlecase(&mut tok_lower);
    tok_lower
}

pub fn make_token(tok: &str, name: Option<&str>) -> String {
    match name {
        Some(s) => format!("    #[token(\"{}\")]\n    {},\n", tok, s),
        None    => format!("    #[token(\"{}\")]\n    {},\n", tok, capitalize(tok, &true))
    }
}

fn parse_lines(vec_s: &Vec<String>, to_parse: &bool) -> Vec<String> {
    vec_s.iter().map(
                    |x| x.split_whitespace().collect::<Vec<&str>>()
                )
                .map(
                    |x| match *to_parse {
                        true  => make_token(&x[0], Some(&x[1])),
                        false => make_token(&x[0], None)
                    }
                )
                .collect::<Vec<String>>()
}

pub fn make_enum(vec_s: &Vec<String>, to_parse: &Vec<bool>) -> String {
    let mid: Vec<String> = vec_s.iter()
                                .map(
                                    |s| s.lines()
                                         .map(|x| x.trim().to_string())
                                         .collect::<Vec<String>>()
                                ) 
                                .zip(to_parse)
                                .map(|s| parse_lines(&s.0, s.1))
                                .flatten()
                                .collect::<Vec<String>>();
    let pre: Vec<&str> = vec! [
        "use logos::Logos;\n\n", 
        "#[derive(Logos, Debug, PartialEq)]\n",
        "enum Token {\n",
    ];
    let post: Vec<&str> = vec! [
        "    #[regex(\"[_a-zA-Z][_a-zA-Z0-9]+\", priority = 1)]\n    Id,\n",
        "    #[regex(\"[0-9]+\")]\n    IntNum,\n",
        "    #[regex(\"[0-9]+.[0-9]+\", priority = 2)]\n    FloatNum,\n",
        "    #[regex(r\"[\\n]+\", logos::skip)]\n    Nl,\n",
        "    #[regex(r\"[ \\t\\f]+\")]\n    Whitespace,\n",
        "    #[error]\n    Error,\n}"
    ];
    pre.join("") + &mid.join("") + &post.join("")
}

pub fn make_hack_logos() {
    let files: Vec<&str> = vec![ "kws.txt", "sym_kw.txt", "type_kw.txt" ];
    let file_paths: Vec<String> = files.iter()
                                     .map( |x| "../langfiles/".to_string() + &x.to_string() )
                                     .collect::<Vec<String>>();
    let parse_comm: Vec<bool> = vec![ false, true, false ];
    let file_vec: Vec<String> = read_files(&file_paths);
    let made_enum: String = make_enum(&file_vec, &parse_comm);
    println!("{}", made_enum);
}

fn main() {
    let args: Vec<String> = env::args().collect();
    println!("{:?}", args);

    let odds: Vec<i32> = (1..11).filter(|&x| x%2 == 1).collect::<Vec<i32>>());
    println!("{:?}", (2..11).filter(|&x| x%2 == 0).collect::<Vec<i32>>());
    // let file_names = args.get((1..args.len()).step(2))
    // make_hack_logos();
}