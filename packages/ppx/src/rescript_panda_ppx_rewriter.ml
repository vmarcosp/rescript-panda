open Ppxlib

let rules = Base.List.concat [
  Colors.rules
]

let () = Driver.register_transformation ~rules:rules "rescript_panda_ppx"
