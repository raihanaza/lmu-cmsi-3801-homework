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

(* Write your line count function here *)

type shape =
  | Sphere of float
  | Box of float * float * float

let volume v =
  match v with 
  | Sphere r -> Float.pi *. (r ** 3.) *. 4. /. 3.
  | Box (l, w, h) -> l *. w *. h;;

let surface_area sa =
  match sa with 
  | Sphere r -> 4. *. Float.pi *. (r ** 2.)
  | Box (l, w, h) -> 2. *. (l *. w +. l *. h +. w *. h);;

type 'a binary_search_tree = 
  | Empty 
  | Node of 'a binary_search_tree * 'a * 'a binary_search_tree

let rec insert value tree = 
  match tree with 
  | Empty -> Node (Empty, value, Empty)
  | Node (left, v, right) -> 
    if value < v then
      Node (insert value left, v, right)
    else
      Node (left, v, insert value right);;
      

let rec size tree = 
  match tree with 
  | Empty -> 0
  | Node (left, _, right) -> 1 + size left + size right;;

let rec contains value tree =
  match tree with 
  | Empty -> false
  | Node (left, v, right) ->
    if value = v then 
      true
    else if value < v then 
      contains value left
    else
      contains value right;;

let rec inorder tree = 
  match tree with 
  | Empty -> []
  | Node (left, v, right) -> inorder left @ [v] @ inorder right;;