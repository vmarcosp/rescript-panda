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

module type IVariantsGenerator = {
  let getTokens: Config.tokens => option<Js.Json.t>
  let typeName: string
  let props: array<string>
}

module MakeVariantGenerator = (VariantsGeneratorConfig: IVariantsGenerator) => {
  let typeName = VariantsGeneratorConfig.typeName
  let globalTypeName = `${moduleName}.${VariantsGeneratorConfig.typeName}`
  let t = UserDefinedType(typeName)
  let props = VariantsGeneratorConfig.props->Array.map(name => {
    name,
    type_: t,
    isOptional: true,
  })

  let make = (config: Config.t) => {
    let variants =
      config.theme
      ->Option.flatMap(t => t.tokens)
      ->Option.flatMap(VariantsGeneratorConfig.getTokens)
      ->Option.map(extractTokens)
      ->Option.getOr([])
      ->Array.map(color => {
        variantName: color,
        isString: isAStringVariant(color),
      })

    TypeDeclaration({
      name: VariantsGeneratorConfig.typeName,
      type_: variants->Array.length > 0 ? PolyVariant(variants) : Unit,
    })
  }
}

module Colors = MakeVariantGenerator({
  let typeName = "colors"
  let getTokens = (tokens: Config.tokens) => tokens.colors
  let props = Properties.colors
})

module Spacing = MakeVariantGenerator({
  let typeName = "spacing"
  let getTokens = (tokens: Config.tokens) => tokens.spacing
  let props = Properties.spacing
})

module Fonts = MakeVariantGenerator({
  let typeName = "fonts"
  let getTokens = (tokens: Config.tokens) => tokens.fonts
  let props = Properties.fontFamily
})

module Sizes = MakeVariantGenerator({
  let typeName = "sizes"
  let getTokens = (tokens: Config.tokens) => tokens.sizes
  let props = Properties.sizes
})

module FontSizes = MakeVariantGenerator({
  let typeName = "fontSizes"
  let getTokens = (tokens: Config.tokens) => tokens.fontSizes
  let props = Properties.fontSizes
})

module FontWeights = MakeVariantGenerator({
  let typeName = "fontWeights"
  let getTokens = (tokens: Config.tokens) => tokens.fontWeights
  let props = Properties.fontWeights
})

module LetterSpacings = MakeVariantGenerator({
  let typeName = "letterSpacings"
  let getTokens = (tokens: Config.tokens) => tokens.letterSpacings
  let props = Properties.letterSpacings
})

module LineHeights = MakeVariantGenerator({
  let typeName = "lineHeights"
  let getTokens = (tokens: Config.tokens) => tokens.lineHeights
  let props = Properties.lineHeights
})

module Radii = MakeVariantGenerator({
  let typeName = "radii"
  let getTokens = (tokens: Config.tokens) => tokens.radii
  let props = Properties.radii
})

module Borders = MakeVariantGenerator({
  let typeName = "borders"
  let getTokens = (tokens: Config.tokens) => tokens.borders
  let props = Properties.borders
})

module BorderWidths = MakeVariantGenerator({
  let typeName = "borderWidths"
  let getTokens = (tokens: Config.tokens) => tokens.borderWidths
  let props = Properties.borderWidths
})

let make = (config: Config.t) => {
  let stylesDefinition = TypeDeclaration({
    name: styleSystemTypeName,
    type_: Record(
      [
        ...Colors.props,
        ...Spacing.props,
        ...Sizes.props,
        ...Fonts.props,
        ...FontWeights.props,
        ...FontSizes.props,
        ...LetterSpacings.props,
        ...LineHeights.props,
        ...Radii.props,
        ...Borders.props,
        ...BorderWidths.props,
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
      LetterSpacings.make(config),
      LineHeights.make(config),
      Radii.make(config),
      Borders.make(config),
      BorderWidths.make(config),
      stylesDefinition,
    ],
  )
}
