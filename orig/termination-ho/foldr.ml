
let check1 f =
  let x = f () in
  if x = 0 then 1
  else 0
in
let pred (fx:unit->int):unit->int =
  let x = fx () in
  (fun u -> x - 1)
in
let add (f1:unit->int) (f2:unit->int):unit->int =
  let x1 = f1 () in
  let x2 = f2 () in
  (fun u -> x1 + x2)
in
let sum fm fn = add fm fn
in
let rec foldr (h:(unit -> int) -> (unit -> int) -> unit -> int) (fe:unit->int) fl =
  let b = check1 fl in
  if b =  1 then fe
  else
    let m = Random.int 0 in
    let fr = foldr h fe (pred fl) in
    h (fun u -> m) fr
  in
let rec xx (flag:int) fm fl =
  if flag = 1 then
    foldr sum fm fl
  else
    xx 1 fm fl
in
let mm l =
  if l >= 0 then
    let m = Random.int 0 in
    xx 0 (fun u -> m) (fun u -> l) ()
  else
    0
in
mm (Random.int 0)
