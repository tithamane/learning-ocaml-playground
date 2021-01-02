open Core
open Lib

let rec print_tokens (t: Parser.token list) =
    match t with
    [] -> ()
    | hd::tl ->
        let _ = print_endline hd.value in
        print_tokens tl
    

let rec length items =
    match items with
    [] -> 0
    | _::tail -> 1 + (length tail)

(* let rec print_tokens token =
    match token with
    [] -> ()
    | hd::tl -> 
        let _ = print_endline hd in
        print_tokens tl  *)

let () =
    let code = In_channel.read_all "./script.thabang" in
    let tokens = Parser.parse code in
    let _ = print_endline (string_of_int (length tokens)) in
    let _ = print_endline "------------------------" in
    print_tokens tokens

