module Process = NodeJs.Process

type color
type tokens = {colors: option<Js.Json.t>, spacing: option<Js.Json.t>}
type theme = {tokens: option<tokens>}

type t = {
  outdir: string,
  strictTokens: option<bool>,
  importMap?: string,
  theme: option<theme>,
}

type loadConfigResult = {config: t}

type error =
  | MissingImportMap
  | Otherwise

type loadConfigParams = {cwd: string, file?: string}

@module("@pandacss/config")
external loadConfig: loadConfigParams => promise<loadConfigResult> = "loadConfig"

let get = async (): result<t, error> => {
  let {config} = await loadConfig({cwd: Process.process->Process.cwd})

  switch config {
  | {importMap: ?None} => Error(MissingImportMap)
  | {outdir, strictTokens, theme, importMap: ?Some(importMap)} =>
    Ok({
      outdir,
      strictTokens,
      importMap,
      theme,
    })
  }
}
