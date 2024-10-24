@@uncurried

module Process = NodeJs.Process

type t = {outdir: string, importMap: string}

type error =
  | MissingImportMap
  | Otherwise

let configPath = NodeJs.Path.join([Process.process->Process.cwd, "panda.config.js"])
let schema = S.object(s => {
  outdir: s.field("outdir", S.string),
  importMap: s.field("importMap", S.string),
})

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
