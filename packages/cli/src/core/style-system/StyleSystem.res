open Generator_AST

let name = "styles"

module Colors = {
  let name = "colors"

  let make = (config: Config.t) => {
    let customColors =
      config.theme
      ->Option.flatMap(theme => theme.extend)
      ->Option.flatMap(extend => extend.tokens)
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
    name,
    type_: Record([...propertiesThatUseColors]),
  })

  [Colors.make(config), stylesDefinition]
}
