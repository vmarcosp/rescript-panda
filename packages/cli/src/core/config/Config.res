module Process = NodeJs.Process

type color
type tokens = {colors: option<Js.Json.t>}
type theme = {tokens: option<tokens>}
type preset = {
  name: string,
  theme: theme,
}
type extensibleTheme = {...theme, extend: option<theme>}
type baseConfig = {outdir: string, strictTokens: option<bool>}
type pandaConfig = {
  ...baseConfig,
  presets: option<array<preset>>,
  importMap: option<string>,
  theme: option<extensibleTheme>,
}
type t = {
  ...baseConfig,
  importMap: string,
  theme: option<theme>,
}

type error =
  | MissingImportMap
  | Otherwise

let configPath = NodeJs.Path.join([Process.process->Process.cwd, "panda.config.js"])

@module("./extract-and-merge.js")
external extractAndMerge: (extensibleTheme, option<array<preset>>) => theme = "extractAndMerge"

let get = async (): result<t, error> => {
  let {mod}: BundleNRequire.t<pandaConfig> = await BundleNRequire.bundleNRequire(configPath)
  switch mod {
  | {importMap: None} => Error(MissingImportMap)
  | {outdir, strictTokens, theme, presets, importMap: Some(importMap)} => Ok({
      outdir,
      strictTokens,
      importMap,
      theme: theme->Option.map(theme => extractAndMerge(theme, presets)),
    })
  }
}

let get = async (): result<t, error> => {
  let {mod}: BundleNRequire.t<pandaConfig> = await BundleNRequire.bundleNRequire(configPath)
  switch mod {
  | {importMap: None} => Error(MissingImportMap)
  | {outdir, strictTokens, theme, presets, importMap: Some(importMap)} =>  Ok({
      outdir,
      strictTokens,
      importMap,
      theme: theme->Option.map(theme => extractAndMerge(theme, presets)),
    })
  }
}
