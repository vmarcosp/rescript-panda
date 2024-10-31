open Generator_AST

let styleSystemTypeName = "t"
let moduleName = "StyleSystem"
let moduleTypeName = `${moduleName}.${styleSystemTypeName}`

let isAStringVariant = value => value->String.split(".")->Array.length > 0

let extractTokens = (colors: Js.Json.t) =>
  switch colors {
  | Object(colors) => TokenExtractor.extract(colors, [])
  | _ => []
  }

module Colors = {
  let typeName = "colors"
  let make = (config: Config.t) => {
    let variants =
      config.theme
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

    TypeDeclaration({
      name: typeName,
      type_: PolyVariant(variants),
    })
  }
}

module Spacing = {
  let typeName = "spacing"
  let make = (config: Config.t) => {
    let variants =
      config.theme
      ->Option.flatMap(theme => theme.tokens)
      ->Option.flatMap(tokens => tokens.spacing)
      ->Option.map(extractTokens)
      ->Option.getOr([])
      ->Array.map(color => {
        variantName: color,
        isString: isAStringVariant(color),
      })

    TypeDeclaration({
      name: typeName,
      type_: PolyVariant(variants),
    })
  }
}

let spacingTypeName = `${moduleName}.${Spacing.typeName}`
let colorsTypeName = `${moduleName}.${Colors.typeName}`

let make = (config: Config.t) => {
  let colorType = UserDefinedType(Colors.typeName)
  let spacingType = UserDefinedType(Spacing.typeName)

  let propertiesThatUseColors = StyleSystem_Constants.propertiesThatUseColors->Array.map(name => {
    name,
    type_: colorType,
    isOptional: true,
  })

  let propertiesThatUseSpacing = StyleSystem_Constants.propertiesThatUseSpcing->Array.map(name => {
    name,
    type_: spacingType,
    isOptional: true,
  })

  let stylesDefinition = TypeDeclaration({
    name: styleSystemTypeName,
    type_: Record([...propertiesThatUseColors, ...propertiesThatUseSpacing]),
  })

  ModuleDeclaration(moduleName, [Spacing.make(config), Colors.make(config), stylesDefinition])
}
