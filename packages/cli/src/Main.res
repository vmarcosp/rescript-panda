module BundleNRequire = {
  type t<'mod> = {
    mod:  'mod
  }
  @module("bundle-n-require")
  external bundleNRequire: string => promise<t<'mod>> = "bundleNRequire"
}

let cssFunction = `
@module("./css")
external css: {..} => string = "css"
`

module Config = {
  type t = {outdir: string}
  let configPath = Node.Path.join([Node.Process.cwd(), "panda.config.js"])
  let get = async (): t => { 
    let {mod} = await BundleNRequire.bundleNRequire(configPath)
    mod
  }
}

let createBindingsModule = (config: Config.t) => {
  let styledSystemDir = Node.Path.join([Node.Process.cwd(), config.outdir, "PandaCSS.res"])

  let content = `
    ${cssFunction}
  `

  Node.Fs.writeFileAsUtf8Sync(styledSystemDir, content)

  Js.log("✅ Created PandaCSS module.")
}

let run = async () => {
  let config = await Config.get()
  Js.log(config)
  createBindingsModule(config)
}

run()->ignore
