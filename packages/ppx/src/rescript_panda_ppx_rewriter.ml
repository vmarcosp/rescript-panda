open Ppxlib

let extender_name = "one"

let extender_extracter = Ast_pattern.(pstr nil)


let expression ~loc = Ast_builder.Default.eint ~loc 2

(* Define the expansion logic *)
let expand ~ctxt =
  let loc = Expansion_context.Extension.extension_point_loc ctxt in
  expression ~loc

(* Define the extension *)
let extension =
  Extension.V3.declare extender_name Extension.Context.expression
    extender_extracter
    expand

(* Register the extender *)
let rule = Ppxlib.Context_free.Rule.extension extension
let () = Driver.register_transformation ~rules:[ rule ] extender_name
