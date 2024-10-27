module Process = NodeJs.Process

type color

type tokens = {colors: option<Js.Json.t>}
type themeFields = {tokens: option<tokens>}
type theme = {...themeFields, extend: option<themeFields>}
type t = {outdir: string, importMap: string, theme: option<theme>, strictTokens: option<bool>}

let tokensSchema = S.object(s => {
  colors: s.field("colors", S.option(S.json(~validate=true))),
})

let themeFieldsSchema =  S.object(s => {
  tokens: s.field("tokens", tokensSchema->S.option),
})

let themeSchema = S.object(s => {
  extend: s.field("extend", themeFieldsSchema->S.option),
  tokens: s.field("tokens", tokensSchema->S.option),
})

let schema = S.object(s => {
  outdir: s.field("outdir", S.string),
  importMap: s.field("importMap", S.string),
  theme: s.field("theme", themeSchema->S.option),
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
  let result = await mod->S.parseAsyncWith(schema)
  result->Result.mapError(parseError)
}
