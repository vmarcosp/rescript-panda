open Generator_AST

let name = "styles"

let rec extractTokens = (
  dict: Js.Dict.t<Js.Json.t>,
  tokens: array<string>,
  ~prefix: option<string>=?,
) => {
  let isTokenDefinition = dict =>
    dict->Dict.get("value")->Option.map(_ => true)->Option.getOr(false)
  if isTokenDefinition(dict) {
    tokens
  } else {
    let entries = dict->Js.Dict.entries
    let extractedTokens = entries->Array.reduce([], (acc, (key, value)) => {
      switch value {
      | Object(dict) =>
        if isTokenDefinition(dict) {
          let tokenName = prefix->Option.map(prefix => `${prefix}.${key}`)->Option.getOr(key)
          [...acc, tokenName]
        } else {
          let prefix = prefix->Option.map(prefix => `${prefix}.${key}`)->Option.getOr(key)
          extractTokens(dict, acc, ~prefix)
        }
      | _ => acc
      }
    })
    [...extractedTokens, ...tokens]
  }
}

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
        | Object(colors) => extractTokens(colors, [])
        | _ => []
        }
      )
      ->Option.getOr([])
      ->Array.map(color => {
        variantName: color,
        isString: color->String.split(".")->Array.length > 0,
      })

    let nativeColors = Styles_Constants.cssColors->Array.map(color => {variantName: color})

    let variants = Array.concatMany([], [nativeColors, customColors])

    TypeDeclaration({
      name: "colors",
      type_: PolyVariant(variants),
    })
  }
}

let make = (config: Config.t) => {
  let colorType = UserDefinedType(Colors.name)

  let propertiesThatUseColors = Styles_Constants.propertiesThatUseColors->Array.map(name => {
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
