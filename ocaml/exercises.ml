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

let first_then_apply (lst: 'a list) (predicate: 'a -> bool) (func: 'a -> 'b option) : 'b option =
  let rec aux = function
    | [] -> None
    | x :: xs -> if predicate x then func x else aux xs
  in 
  aux lst

(* Write your powers generator here *)

(* Write your line count function here *)

(* Write your shape type and associated functions here *)

(* Write your binary search tree implementation here *)
