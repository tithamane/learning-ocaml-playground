open Core

(** Loads the contents of a file as a single string. *)
let get_fixture_contents number =
  (* TODO: @thabang - Need to check if the file exists. *)
  let file_name = Printf.sprintf "./fixtures/%s.txt" number in
  In_channel.read_all file_name

(** Helper method to convert a string list to an int list

The resulting list will is the reverse of what it initially received.
*)
let rec _string_to_int_converter (values: string list) (acc: int list) =
  match values with
  [] -> acc
  | [a] -> (int_of_string a) :: acc
  | hd::tl ->
    let new_acc = (int_of_string hd) :: acc  in
    _string_to_int_converter tl new_acc

(** Converts a string list to an int list*)
let convert_to_ints items =
  let values = _string_to_int_converter items [] in  
  List.rev values

(** Helper method to print an int list. *)
let rec _print_list (acc: string) (items: int list) =
  match items with
  [] -> acc
  | hd::tl ->
    let new_acc = Printf.sprintf "%s %d" acc hd in
    _print_list new_acc tl

(** Prints a list of numbers *)
let print_list (items: int list) =
  let content = _print_list "" items in
  Printf.printf "%s\n" (Printf.sprintf "[%s ]" content)


let () =
  let contents = get_fixture_contents "10" in
  let contents_as_list = Str.split (Str.regexp "\n") contents in
  let values = convert_to_ints contents_as_list in
  print_list values