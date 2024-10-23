module BundleNRequire = {
  type t<'mod> = {mod: 'mod}
  @module("bundle-n-require")
  external bundleNRequire: string => promise<t<'mod>> = "bundleNRequire"
}

module Process = NodeJs.Process

module Config = {
  type t = {outdir: string, importMap: string}
  let configPath = NodeJs.Path.join([Process.process->Process.cwd, "panda.config.js"])
  let get = async (): t => {
    let {mod} = await BundleNRequire.bundleNRequire(configPath)
    mod
  }
}

let createBindingsModule = (config: Config.t) => {
  open ReScriptAST

  let styledSystemDir = NodeJs.Path.join([
    Process.process->Process.cwd,
    config.outdir,
    "PandaCSS.res",
  ])

  let nodes = [
    ExternalDeclaration(Module(`${config.importMap}/css`), Identifier("css"), Function([OpenObject], String), "css"),
  ]
  
  let fileContent = nodes->ReScriptCodegen.generate

  NodeJs.Fs.writeFileSync(styledSystemDir, fileContent->NodeJs.Buffer.fromString)

  Js.log("✅ Created PandaCSS module.")
}

let run = async () => {
  let config = await Config.get()
  createBindingsModule(config)
}

run()->ignore
