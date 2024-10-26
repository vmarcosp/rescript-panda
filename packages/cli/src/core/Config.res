module Process = NodeJs.Process

type color

type tokens = {colors: option<Js.Json.t>}
type extend = {tokens: option<tokens>}
type theme = {extend: option<extend>}
type t = {outdir: string, importMap: string, theme: option<theme>, strictTokens: option<bool>}

let tokensSchema = S.object(s => {
  colors: s.field("colors", S.option(S.json(~validate=true))),
})

let extendSchema = S.object(s => {
  tokens: s.field("tokens", tokensSchema->S.option),
})

let schemaTheme = S.object(s => {
  extend: s.field("extend", extendSchema->S.option),
})

let schema = S.object(s => {
  outdir: s.field("outdir", S.string),
  importMap: s.field("importMap", S.string),
  theme: s.field("theme", schemaTheme->S.option),
  strictTokens: s.field("strictTokens", S.bool->S.option),
})

type error =
  | MissingImportMap
  | Otherwise

let configPath = NodeJs.Path.join([Process.process->Process.cwd, "panda.config.js"])

let parseError = (error: S.error) => {
  switch error {
  | {path, code: InvalidType({received})}
    if path->S.Path.toString === `["importMap"]` && received->Js.typeof === "undefined" =>
    MissingImportMap
  | _ => Otherwise
  }
}

let get = async () => {
  let {mod}: BundleNRequire.t<Js.Json.t> = await BundleNRequire.bundleNRequire(configPath)
  Console.log2("panda.config.js", mod)

  let result = await mod->S.parseAsyncWith(schema)
  result->Result.mapError(parseError)
}
