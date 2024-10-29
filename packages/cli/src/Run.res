exception InvalidPandaConfig(string)

module Process = NodeJs.Process

let createBindingsModule = (config: Config.t) => {
  open Generator_AST
  
  let codegenerationDisclaimer = "    // ⚠️ Generated by rescript-panda. Only edit this file if you want to stop using rescript-panda codegen."

  let mainModulePath = NodeJs.Path.join([
    Process.process->Process.cwd,
    config.outdir,
    Constants.mainModuleFileName,
  ])

  let utilitiesModulePath = NodeJs.Path.join([
    Process.process->Process.cwd,
    config.outdir,
    Constants.utilitiesModuleFileName,
  ])

  
  let utilitiesImplementation = Generator.generate([
    UtilitiesGenerator.make()
  ])
  
  let utilitiesFileContent = `
    ${codegenerationDisclaimer}
    ${utilitiesImplementation}
    `


  NodeJs.Fs.writeFileSync(utilitiesModulePath, utilitiesFileContent->NodeJs.Buffer.fromString)

  let mainModuleImplementation = Generator.generate([
    StyleSystem.make(config),
    ExternalDeclaration(
      Module(`${config.importMap->Option.getOr("")}/css`),
      Identifier("css"),
      Function([UserDefinedType(StyleSystem.moduleTypeName)], String),
      "css",
    ),
  ]
)

  let mainFileContent = `
    ${codegenerationDisclaimer}
    ${mainModuleImplementation}
  `

  NodeJs.Fs.writeFileSync(mainModulePath, mainFileContent->NodeJs.Buffer.fromString)

  NodeJs.ChildProcess.spawnSync(
    "npx",
    ["rescript", "format", "-all"],
    {
      stdio: "ignore",
    },
  )->ignore

  Js.log(
    `✔️ \`${Chalk.green(
        `${config.outdir}/${Constants.mainModuleFileName}`,
      )}\` has been successfully created.`,
  )
}

let run = async () => {
  let config = await Config.get()
  switch config {
  | Ok(config) => createBindingsModule(config)
  | Error(error) =>
    switch error {
    | MissingImportMap =>
      Console.log(
        `⚠️ You forgot to define an ${Chalk.green(
            "importMap",
          )} in your Panda config. \nThe importMap field is required for rescript-panda to generate bindings properly.\n🔎 Check out https://panda-css.com/docs/references/config#importmap`,
      )
    | Otherwise => Console.log("Something went wrong.")
    }
  }
}
