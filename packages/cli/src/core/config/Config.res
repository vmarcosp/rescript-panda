module Process = NodeJs.Process

type color
type tokens = {
  colors: option<Js.Json.t>,
  spacing: option<Js.Json.t>,
  sizes: option<Js.Json.t>,
  fonts: option<Js.Json.t>,
  fontSizes: option<Js.Json.t>,
  fontWeights: option<Js.Json.t>,
  letterSpacings: option<Js.Json.t>,
  lineHeights: option<Js.Json.t>,
  radii: option<Js.Json.t>,
  borders: option<Js.Json.t>,
  borderWidths: option<Js.Json.t>,
  shadows: option<Js.Json.t>,
  easings: option<Js.Json.t>,
  opacity: option<Js.Json.t>,
  zIndex: option<Js.Json.t>,
  assets: option<Js.Json.t>,
  durations: option<Js.Json.t>,
  animations: option<Js.Json.t>,
  aspectRatios: option<Js.Json.t>,
}

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
