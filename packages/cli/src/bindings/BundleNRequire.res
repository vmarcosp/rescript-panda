type t<'mod> = {mod: 'mod}
@module("bundle-n-require")
external bundleNRequire: string => promise<t<'mod>> = "bundleNRequire"
