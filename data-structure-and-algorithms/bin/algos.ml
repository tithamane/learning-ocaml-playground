open Core

let get_fixture_contents number =
    (* TODO: @thabang - Need to check if the file exists. *)
    let file_name = Printf.sprintf "./fixtures/%s.txt" number in
    In_channel.read_all file_name

let () =
  let contents = get_fixture_contents "10" in
  Printf.printf "%s\n" contents