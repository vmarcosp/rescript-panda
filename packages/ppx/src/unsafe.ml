open Ppxlib

let unsafe_extender = "x"

let unsafe_extender_extracter = Ast_pattern.(single_expr_payload (estring __))

let create_unsafe_expression ~loc color =
  let open Ast_builder.Default in
  let expr = estring ~loc color in
  [%expr Obj.magic [%e expr]]

let parse_hex_color color = 
  let list_size = Base.String.length color in
  if list_size = 0 then
    Error "You must provide a hexadecimal color."
  else
    let first_char = Base.String.get color 0 in
    match first_char with
    | '#'  -> Ok ("[" ^ color ^ "]")
    | _ -> Error "Hexadecimal values must start with '#'."

let unsafe_expand ~ctxt color =
  let loc = Expansion_context.Extension.extension_point_loc ctxt in
    create_unsafe_expression ~loc ("[" ^ color ^ "]")

let unsafe_extension =
  Extension.V3.declare unsafe_extender Extension.Context.expression
    unsafe_extender_extracter
    unsafe_expand

let unsafe_rule = Ppxlib.Context_free.Rule.extension unsafe_extension

let rules = [
  unsafe_rule
]
