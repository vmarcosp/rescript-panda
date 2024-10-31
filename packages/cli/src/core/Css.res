open Generator_AST

let make = (config: Config.t) => {
  ExternalDeclaration(
    Module(`${config.importMap->Option.getOr("")}/css`),
    Identifier("css"),
    Function([UserDefinedType(StyleSystem.moduleTypeName)], String),
    "css",
  )
}
