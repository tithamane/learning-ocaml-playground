open Core

type statement = INSTRUCTION | VALUE
[@@deriving show]

type token = {
    identifier: statement;
    value: string;
}

let build_token acc =
    (* TODO: Check that "acc" has a value and return and optional *)
    match acc with
    "add" | "sub" -> {identifier = INSTRUCTION; value = acc}
    | _ ->  {identifier = VALUE; value = acc}

let check_acc tokens acc =
    let t = build_token acc in
    tokens @ [t]

let rec next_char tokens acc code code_index max_code_index =
    if code_index = max_code_index then
        (* TODO: Check if "acc" and handle Optional. *)
        check_acc tokens acc
    else
        match code.[code_index] with
        | ' ' | '\n' -> 
            let new_tokens = (check_acc tokens acc) in
            next_char new_tokens "" code (code_index + 1) max_code_index
        | _ -> 

            let new_acc = acc ^ String.make 1 code.[code_index] in (* What on earth is happening here?*)
            next_char tokens new_acc code (code_index + 1) max_code_index

let parse (code: string) =
    next_char [] "" code 0 (String.length code)