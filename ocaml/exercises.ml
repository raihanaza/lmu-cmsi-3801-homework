exception Negative_Amount

let change amount =
  if amount < 0 then
    raise Negative_Amount
  else
    let denominations = [25; 10; 5; 1] in
    let rec aux remaining denominations =
      match denominations with
      | [] -> []
      | d :: ds -> (remaining / d) :: aux (remaining mod d) ds
    in
    aux amount denominations

(* Write your first then apply function here *)

(* Write your powers generator here *)

let meaningful_line_count filename = 
  let file = open_in filename in
  let finally () = close_in file in
  let is_meaningful line = 
    let trimmed = String.trim line in
    trimmed <> "" && not (String.starts_with ~prefix:"#" trimmed)
  in
  let rec count_lines count = 
    match input_line file with
    | line ->
      let new_count = if is_meaningful line then count + 1 else count in count_lines new_count
    | exception End_of_file -> 
      count
  in Fun.protect ~finally (fun () -> count_lines 0)
  
(* Write your shape type and associated functions here *)

(* Write your binary search tree implementation here *)
