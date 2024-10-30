open Ppxlib

let color_extender = "hex"

let color_extender_extracter = Ast_pattern.(single_expr_payload (estring __))

let color_expression ~loc color =
  let open Ast_builder.Default in
  (* Create the string expression *)
  let expr = estring ~loc ("[" ^ color ^ "]") in
  (* Wrap the expression in Obj.magic to coerce its type *)
  [%expr Obj.magic [%e expr]]

let color_expand ~ctxt color =
  let loc = Expansion_context.Extension.extension_point_loc ctxt in
  let first_char = Base.String.get color 0 in
  match first_char with
    | '#' ->color_expression ~loc color
    | _ ->
      let ext =
        Location.error_extensionf ~loc "Invalid value for hexadecimal. Hexadecimal colors must start with '#'"
      in
      Ast_builder.Default.pexp_extension ~loc ext 

let color_extension =
  Extension.V3.declare color_extender Extension.Context.expression
    color_extender_extracter
    color_expand

(* Register the extender *)
let color_rule = Ppxlib.Context_free.Rule.extension color_extension

let () = Driver.register_transformation ~rules:[ color_rule ] color_extender
