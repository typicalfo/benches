exception DivError of string

let div x y =
  if y = 0.0 then
    raise (DivError "division by zero")
  else
    x /. y

let () =
  let x = 1.0 in
  let y = 0.0 in
  try
    let z = div x y in
    Printf.printf "The result is: %f\n" z
  with
  | DivError msg -> Printf.eprintf "Division failed: %s\n" msg