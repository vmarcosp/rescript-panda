open Generator_AST
module Properties = StyleSystem_Constants.Properties

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

module Fonts = {
  let typeName = "fonts"

  let make = (config: Config.t) => {
    let variants =
      config.theme
      ->Option.flatMap(theme => theme.tokens)
      ->Option.flatMap(tokens => tokens.fonts)
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

module Sizes = {
  let typeName = "sizes"
  let make = (config: Config.t) => {
    let variants =
      config.theme
      ->Option.flatMap(theme => theme.tokens)
      ->Option.flatMap(tokens => tokens.sizes)
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

module FontSizes = {
  let typeName = "fontSizes"
  let make = (config: Config.t) => {
    let variants =
      config.theme
      ->Option.flatMap(theme => theme.tokens)
      ->Option.flatMap(tokens => tokens.fontSizes)
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

module FontWeights = {
  let typeName = "fontWeights"
  let make = (config: Config.t) => {
    let variants =
      config.theme
      ->Option.flatMap(theme => theme.tokens)
      ->Option.flatMap(tokens => tokens.fontWeights)
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
let sizesTypeName = `${moduleName}.${Sizes.typeName}`
let fontsTypeName = `${moduleName}.${Fonts.typeName}`
let fontSizes = `${moduleName}.${FontSizes.typeName}`
let fontWeights = `${moduleName}.${FontWeights.typeName}`

let make = (config: Config.t) => {
  let colorType = UserDefinedType(Colors.typeName)
  let spacingType = UserDefinedType(Spacing.typeName)
  let sizesType = UserDefinedType(Sizes.typeName)
  let fontsType = UserDefinedType(Fonts.typeName)
  let fontSizesType = UserDefinedType(FontSizes.typeName)
  let fontWeightsType = UserDefinedType(FontWeights.typeName)

  let colorsProps = Properties.colors->Array.map(name => {
    name,
    type_: colorType,
    isOptional: true,
  })

  let spacingProps = Properties.spacing->Array.map(name => {
    name,
    type_: spacingType,
    isOptional: true,
  })

  let sizesProps = Properties.sizes->Array.map(name => {
    name,
    type_: sizesType,
    isOptional: true,
  })

  let fontsProps = Properties.fontFamily->Array.map(name => {
    name,
    type_: fontsType,
    isOptional: true,
  })

  let fontSizesProps = Properties.fontSizes->Array.map(name => {
    name,
    type_: fontSizesType,
    isOptional: true,
  })

  let fontWeightsProps = Properties.fontWeights->Array.map(name => {
    name,
    type_: fontWeightsType,
    isOptional: true,
  })

  let stylesDefinition = TypeDeclaration({
    name: styleSystemTypeName,
    type_: Record(
      [
        ...colorsProps,
        ...spacingProps,
        ...sizesProps,
        ...fontsProps,
        ...fontWeightsProps,
        ...fontSizesProps,
      ],
    ),
  })

  ModuleDeclaration(
    moduleName,
    [
      Colors.make(config),
      Spacing.make(config),
      Sizes.make(config),
      Fonts.make(config),
      FontSizes.make(config),
      FontWeights.make(config),
      stylesDefinition,
    ],
  )
}
