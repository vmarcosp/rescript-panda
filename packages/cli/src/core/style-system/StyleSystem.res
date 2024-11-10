open Generator_AST
module Properties = StyleSystem_Constants.Properties

let styleSystemTypeName = "t"
let moduleName = "StyleSystem"
let moduleTypeName = `${moduleName}.${styleSystemTypeName}`

let reservedKeywords = ["float", "int", "in"]

let shouldWrapWithQuotes = value => {
  if Js.Re.test_(%re("/^[0-9]/"), value) {
    true
  } else if Js.String.startsWith("-", value) {
    true
  } else if Js.String.includes(" ", value) {
    true
  } else if Js.Re.test_(%re("/^[a-zA-Z]+[.-][a-zA-Z0-9-]+$/"), value) {
    true
  } else if Js.Array.includes(value, reservedKeywords) {
    true
  } else {
    false
  }
}

let extractTokens = (dict: Js.Json.t) =>
  switch dict {
  | Object(tokens) => TokenExtractor.extract(tokens, [])
  | _ => []
  }

module VariantsOfTokenGenerator = {
  module type Interface = {
    let getTokens: Config.tokens => option<Js.Json.t>
    let typeName: string
    let props: array<string>
  }

  module Make = (GeneratorConfig: Interface) => {
    let typeName = GeneratorConfig.typeName
    let globalTypeName = `${moduleName}.${GeneratorConfig.typeName}`
    let t = UserDefinedType(typeName)
    let props = GeneratorConfig.props->Array.map(name => {
      name,
      type_: t,
      isOptional: true,
    })

    let make = (config: Config.t) => {
      let variants =
        config.theme
        ->Option.flatMap(t => t.tokens)
        ->Option.flatMap(GeneratorConfig.getTokens)
        ->Option.map(extractTokens)
        ->Option.getOr([])
        ->Array.map(color => {
          variantName: color,
          isString: shouldWrapWithQuotes(color),
        })

      TypeDeclaration({
        name: GeneratorConfig.typeName,
        type_: variants->Array.length > 0 ? PolyVariant(variants) : Unit,
      })
    }
  }
}

module Colors = VariantsOfTokenGenerator.Make({
  let typeName = "colors"
  let getTokens = (tokens: Config.tokens) => tokens.colors
  let props = Properties.colors
})

module Spacing = VariantsOfTokenGenerator.Make({
  let typeName = "spacing"
  let getTokens = (tokens: Config.tokens) => tokens.spacing
  let props = Properties.spacing
})

module Fonts = VariantsOfTokenGenerator.Make({
  let typeName = "fonts"
  let getTokens = (tokens: Config.tokens) => tokens.fonts
  let props = Properties.fontFamily
})

module Sizes = VariantsOfTokenGenerator.Make({
  let typeName = "sizes"
  let getTokens = (tokens: Config.tokens) => tokens.sizes
  let props = Properties.sizes
})

module FontSizes = VariantsOfTokenGenerator.Make({
  let typeName = "fontSizes"
  let getTokens = (tokens: Config.tokens) => tokens.fontSizes
  let props = Properties.fontSizes
})

module FontWeights = VariantsOfTokenGenerator.Make({
  let typeName = "fontWeights"
  let getTokens = (tokens: Config.tokens) => tokens.fontWeights
  let props = Properties.fontWeights
})

module LetterSpacings = VariantsOfTokenGenerator.Make({
  let typeName = "letterSpacings"
  let getTokens = (tokens: Config.tokens) => tokens.letterSpacings
  let props = Properties.letterSpacings
})

module LineHeights = VariantsOfTokenGenerator.Make({
  let typeName = "lineHeights"
  let getTokens = (tokens: Config.tokens) => tokens.lineHeights
  let props = Properties.lineHeights
})

module Radii = VariantsOfTokenGenerator.Make({
  let typeName = "radii"
  let getTokens = (tokens: Config.tokens) => tokens.radii
  let props = Properties.radii
})

module Borders = VariantsOfTokenGenerator.Make({
  let typeName = "borders"
  let getTokens = (tokens: Config.tokens) => tokens.borders
  let props = Properties.borders
})

module BorderWidths = VariantsOfTokenGenerator.Make({
  let typeName = "borderWidths"
  let getTokens = (tokens: Config.tokens) => tokens.borderWidths
  let props = Properties.borderWidths
})

module Shadows = VariantsOfTokenGenerator.Make({
  let typeName = "shadows"
  let getTokens = (tokens: Config.tokens) => tokens.shadows
  let props = Properties.shadows
})

module Easings = VariantsOfTokenGenerator.Make({
  let typeName = "easings"
  let getTokens = (tokens: Config.tokens) => tokens.easings
  let props = Properties.easings
})

module Opacity = VariantsOfTokenGenerator.Make({
  let typeName = "opacity"
  let getTokens = (tokens: Config.tokens) => tokens.opacity
  let props = Properties.opacity
})

module ZIndex = VariantsOfTokenGenerator.Make({
  let typeName = "zIndex"
  let getTokens = (tokens: Config.tokens) => tokens.zIndex
  let props = Properties.zIndex
})

module Durations = VariantsOfTokenGenerator.Make({
  let typeName = "durations"
  let getTokens = (tokens: Config.tokens) => tokens.durations
  let props = Properties.durations
})

module Assets = VariantsOfTokenGenerator.Make({
  let typeName = "assets"
  let getTokens = (tokens: Config.tokens) => tokens.assets
  let props = Properties.assets
})

module Animations = VariantsOfTokenGenerator.Make({
  let typeName = "animations"
  let getTokens = (tokens: Config.tokens) => tokens.animations
  let props = Properties.animations
})

module AspectRatios = VariantsOfTokenGenerator.Make({
  let typeName = "aspectRatios"
  let getTokens = (tokens: Config.tokens) => tokens.aspectRatios
  let props = []
})

let generateCommonProperties = () => {
  let attributes = Properties.Commons.allProperties->Array.map(prop => {
    let variants = prop.values->Array.map(color => {
      variantName: color,
      isString: shouldWrapWithQuotes(color),
    })

    let props = prop.keys->Array.map(name => {
      name,
      type_: UserDefinedType(prop.typeName),
      isOptional: true,
    })

    let declaration = TypeDeclaration({
      name: prop.typeName,
      type_: variants->Array.length > 0 ? PolyVariant(variants) : Unit,
    })

    (props, declaration)
  })

  (
    attributes->Array.map(((props, _)) => props),
    attributes->Array.map(((_, declaration)) => declaration),
  )
}

module Flex = {
  let make = (config: Config.t) => {
    let valuesFromUtilities =
      config.utilities
      ->Option.flatMap(u => u.flex)
      ->Option.flatMap(flex => flex.values)
      ->Option.map(v =>
        switch v {
        | String(value) => [value]
        | Object(dict) => dict->Dict.keysToArray
        | _ => []
        }
      )
      ->Option.getOr([])

    let values = switch config.strictTokens {
    | Some(false)
    | None =>
      [...valuesFromUtilities, ...StyleSystem_Constants.Flex.values]
    | Some(true) => valuesFromUtilities
    }

    let typeName = "flex"

    let props = StyleSystem_Constants.Flex.values->Array.map(name => {
      name,
      type_: UserDefinedType(typeName),
      isOptional: true,
    })

    let parsedVariants =
      values
      ->Utils.Array.uniq
      ->Array.map(value => {
        variantName: value,
        isString: shouldWrapWithQuotes(value),
      })

    let declaration = TypeDeclaration({
      name: typeName,
      type_: parsedVariants->Array.length > 0 ? PolyVariant(parsedVariants) : Unit,
    })

    (props, declaration)
  }
}

let make = (config: Config.t) => {
  let (properties, declarations) = generateCommonProperties()
  let (flexProps, flexDeclaration) = Flex.make(config)

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
        ...Shadows.props,
        ...Easings.props,
        ...Opacity.props,
        ...ZIndex.props,
        ...Durations.props,
        ...Assets.props,
        ...Animations.props,
        ...flexProps,
      ]->Array.concatMany(properties),
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
      Shadows.make(config),
      Easings.make(config),
      Opacity.make(config),
      ZIndex.make(config),
      Durations.make(config),
      Assets.make(config),
      Animations.make(config),
      flexDeclaration,
      ...declarations,
      stylesDefinition,
    ],
  )
}
