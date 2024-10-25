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
      ->Option.map(dict => dict->Dict.keysToArray)
      ->Option.getOr([])
      ->Array.map(color => (color, None))

    let nativeColors = Styles_Colors.cssColors->Array.map(color => (color, None))

    let variants = Array.concatMany([], [nativeColors, customColors])

    TypeDeclaration({
      name: "colors",
      type_: PolyVariant(variants),
    })
  }
}

let make = (config: Config.t) => {
  let colorType = UserDefinedType(Colors.name)

  let stylesDefinition = TypeDeclaration({
    name,
    type_: Record([
      {name: "color", type_: colorType, isOptional: true},
      {name: "backgroundColor", type_: colorType, isOptional: true},
    ]),
  })

  [Colors.make(config), stylesDefinition]
}
