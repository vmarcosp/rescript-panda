open Ppxlib

let hex_extender = "hex"

let hex_extender_extracter = Ast_pattern.(single_expr_payload (estring __))

let create_hex_expression ~loc color =
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

let hex_expand ~ctxt color =
  let loc = Expansion_context.Extension.extension_point_loc ctxt in
  let validation_result = parse_hex_color color in
  match validation_result with
    | Ok color -> create_hex_expression ~loc color
    | Error error ->    
    let ext = Location.error_extensionf ~loc "%s" error in
    Ast_builder.Default.pexp_extension ~loc ext;;

let hex_extension =
  Extension.V3.declare hex_extender Extension.Context.expression
    hex_extender_extracter
    hex_expand

let hex_rule = Ppxlib.Context_free.Rule.extension hex_extension

let rules = [
  hex_rule
]
