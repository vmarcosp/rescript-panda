open Generator_AST

let styleSystemTypeName = "t"
let moduleName = "StyleSystem"
let moduleTypeName = `${moduleName}.${styleSystemTypeName}`

@module("./extract-and-merge-theme.js")
external extractAndMergeTheme: (Config.theme) => Config.themeFields = "extractAndMergeTheme"

module Colors = {
  let name = "colors"

  let make = (config: Config.t) => {
    let mergedTheme =  config.theme->Option.map(theme => extractAndMergeTheme(theme))
    Console.log2("MergedTheme", mergedTheme)

    let customColors =
      config.theme
      ->Option.map(extractAndMergeTheme)
      ->Option.flatMap(theme => theme.tokens)
      ->Option.flatMap(tokens => tokens.colors)
      ->Option.map(colors =>
        switch colors {
        | Object(colors) => TokenExtractor.extract(colors, [])
        | _ => []
        }
      )
      ->Option.getOr([])
      ->Array.map(color => {
        variantName: color,
        isString: color->String.split(".")->Array.length > 0,
      })

    let nativeColors = switch config.strictTokens {
    | None
    | Some(false) =>
      StyleSystem_Constants.cssColors->Array.map(color => {variantName: color})
    | Some(true) => []
    }

    let variants = Array.concatMany([], [nativeColors, customColors])

    TypeDeclaration({
      name: "colors",
      type_: PolyVariant(variants),
    })
  }
}

let make = (config: Config.t) => {
  let colorType = UserDefinedType(Colors.name)

  let propertiesThatUseColors = StyleSystem_Constants.propertiesThatUseColors->Array.map(name => {
    name,
    type_: colorType,
    isOptional: true,
  })

  let stylesDefinition = TypeDeclaration({
    name: styleSystemTypeName,
    type_: Record([...propertiesThatUseColors]),
  })

  ModuleDeclaration(moduleName, [Colors.make(config), stylesDefinition])
}
