// ⚠️ Generated by rescript-panda. Only edit this file if you want to stop using rescript-panda codegen.
module StyleSystem = {
  type colors = [
    | #"primary.100"
    | #"slate.50"
    | #"slate.100"
    | #"slate.200"
    | #"slate.300"
    | #"slate.400"
    | #"slate.500"
    | #"slate.600"
    | #"slate.700"
    | #"slate.800"
    | #"slate.900"
    | #"slate.950"
    | #"gray.50"
    | #"gray.100"
    | #"gray.200"
    | #"gray.300"
    | #"gray.400"
    | #"gray.500"
    | #"gray.600"
    | #"gray.700"
    | #"gray.800"
    | #"gray.900"
    | #"gray.950"
    | #"zinc.50"
    | #"zinc.100"
    | #"zinc.200"
    | #"zinc.300"
    | #"zinc.400"
    | #"zinc.500"
    | #"zinc.600"
    | #"zinc.700"
    | #"zinc.800"
    | #"zinc.900"
    | #"zinc.950"
    | #"stone.50"
    | #"stone.100"
    | #"stone.200"
    | #"stone.300"
    | #"stone.400"
    | #"stone.500"
    | #"stone.600"
    | #"stone.700"
    | #"stone.800"
    | #"stone.900"
    | #"stone.950"
    | #"neutral.50"
    | #"neutral.100"
    | #"neutral.200"
    | #"neutral.300"
    | #"neutral.400"
    | #"neutral.500"
    | #"neutral.600"
    | #"neutral.700"
    | #"neutral.800"
    | #"neutral.900"
    | #"neutral.950"
    | #"red.50"
    | #"red.100"
    | #"red.200"
    | #"red.300"
    | #"red.400"
    | #"red.500"
    | #"red.600"
    | #"red.700"
    | #"red.800"
    | #"red.900"
    | #"red.950"
    | #"orange.50"
    | #"orange.100"
    | #"orange.200"
    | #"orange.300"
    | #"orange.400"
    | #"orange.500"
    | #"orange.600"
    | #"orange.700"
    | #"orange.800"
    | #"orange.900"
    | #"orange.950"
    | #"amber.50"
    | #"amber.100"
    | #"amber.200"
    | #"amber.300"
    | #"amber.400"
    | #"amber.500"
    | #"amber.600"
    | #"amber.700"
    | #"amber.800"
    | #"amber.900"
    | #"amber.950"
    | #"yellow.50"
    | #"yellow.100"
    | #"yellow.200"
    | #"yellow.300"
    | #"yellow.400"
    | #"yellow.500"
    | #"yellow.600"
    | #"yellow.700"
    | #"yellow.800"
    | #"yellow.900"
    | #"yellow.950"
    | #"lime.50"
    | #"lime.100"
    | #"lime.200"
    | #"lime.300"
    | #"lime.400"
    | #"lime.500"
    | #"lime.600"
    | #"lime.700"
    | #"lime.800"
    | #"lime.900"
    | #"lime.950"
    | #"green.50"
    | #"green.100"
    | #"green.200"
    | #"green.300"
    | #"green.400"
    | #"green.500"
    | #"green.600"
    | #"green.700"
    | #"green.800"
    | #"green.900"
    | #"green.950"
    | #"emerald.50"
    | #"emerald.100"
    | #"emerald.200"
    | #"emerald.300"
    | #"emerald.400"
    | #"emerald.500"
    | #"emerald.600"
    | #"emerald.700"
    | #"emerald.800"
    | #"emerald.900"
    | #"emerald.950"
    | #"teal.50"
    | #"teal.100"
    | #"teal.200"
    | #"teal.300"
    | #"teal.400"
    | #"teal.500"
    | #"teal.600"
    | #"teal.700"
    | #"teal.800"
    | #"teal.900"
    | #"teal.950"
    | #"cyan.50"
    | #"cyan.100"
    | #"cyan.200"
    | #"cyan.300"
    | #"cyan.400"
    | #"cyan.500"
    | #"cyan.600"
    | #"cyan.700"
    | #"cyan.800"
    | #"cyan.900"
    | #"cyan.950"
    | #"sky.50"
    | #"sky.100"
    | #"sky.200"
    | #"sky.300"
    | #"sky.400"
    | #"sky.500"
    | #"sky.600"
    | #"sky.700"
    | #"sky.800"
    | #"sky.900"
    | #"sky.950"
    | #"blue.50"
    | #"blue.100"
    | #"blue.200"
    | #"blue.300"
    | #"blue.400"
    | #"blue.500"
    | #"blue.600"
    | #"blue.700"
    | #"blue.800"
    | #"blue.900"
    | #"blue.950"
    | #"indigo.50"
    | #"indigo.100"
    | #"indigo.200"
    | #"indigo.300"
    | #"indigo.400"
    | #"indigo.500"
    | #"indigo.600"
    | #"indigo.700"
    | #"indigo.800"
    | #"indigo.900"
    | #"indigo.950"
    | #"violet.50"
    | #"violet.100"
    | #"violet.200"
    | #"violet.300"
    | #"violet.400"
    | #"violet.500"
    | #"violet.600"
    | #"violet.700"
    | #"violet.800"
    | #"violet.900"
    | #"violet.950"
    | #"purple.50"
    | #"purple.100"
    | #"purple.200"
    | #"purple.300"
    | #"purple.400"
    | #"purple.500"
    | #"purple.600"
    | #"purple.700"
    | #"purple.800"
    | #"purple.900"
    | #"purple.950"
    | #"fuchsia.50"
    | #"fuchsia.100"
    | #"fuchsia.200"
    | #"fuchsia.300"
    | #"fuchsia.400"
    | #"fuchsia.500"
    | #"fuchsia.600"
    | #"fuchsia.700"
    | #"fuchsia.800"
    | #"fuchsia.900"
    | #"fuchsia.950"
    | #"pink.50"
    | #"pink.100"
    | #"pink.200"
    | #"pink.300"
    | #"pink.400"
    | #"pink.500"
    | #"pink.600"
    | #"pink.700"
    | #"pink.800"
    | #"pink.900"
    | #"pink.950"
    | #"rose.50"
    | #"rose.100"
    | #"rose.200"
    | #"rose.300"
    | #"rose.400"
    | #"rose.500"
    | #"rose.600"
    | #"rose.700"
    | #"rose.800"
    | #"rose.900"
    | #"rose.950"
    | #current
    | #black
    | #white
    | #transparent
  ]
  type spacing = [
    | #0
    | #1
    | #2
    | #3
    | #4
    | #5
    | #6
    | #7
    | #8
    | #9
    | #10
    | #11
    | #12
    | #14
    | #16
    | #20
    | #24
    | #28
    | #32
    | #36
    | #40
    | #44
    | #48
    | #52
    | #56
    | #60
    | #64
    | #72
    | #80
    | #96
    | #"0.5"
    | #"1.5"
    | #"2.5"
    | #"3.5"
  ]
  type sizes = [
    | #0
    | #1
    | #2
    | #3
    | #4
    | #5
    | #6
    | #7
    | #8
    | #9
    | #10
    | #11
    | #12
    | #14
    | #16
    | #20
    | #24
    | #28
    | #32
    | #36
    | #40
    | #44
    | #48
    | #52
    | #56
    | #60
    | #64
    | #72
    | #80
    | #96
    | #"0.5"
    | #"1.5"
    | #"2.5"
    | #"3.5"
    | #xs
    | #sm
    | #md
    | #lg
    | #xl
    | #"2xl"
    | #"3xl"
    | #"4xl"
    | #"5xl"
    | #"6xl"
    | #"7xl"
    | #"8xl"
    | #prose
    | #full
    | #min
    | #max
    | #fit
  ]
  type fonts = [#sans | #serif | #mono]
  type fontSizes = [
    | #"2xs"
    | #xs
    | #sm
    | #md
    | #lg
    | #xl
    | #"2xl"
    | #"3xl"
    | #"4xl"
    | #"5xl"
    | #"6xl"
    | #"7xl"
    | #"8xl"
    | #"9xl"
  ]
  type fontWeights = [
    | #thin
    | #extralight
    | #light
    | #normal
    | #medium
    | #semibold
    | #bold
    | #extrabold
    | #black
  ]
  type letterSpacings = [#tighter | #tight | #normal | #wide | #wider | #widest]
  type lineHeights = [#none | #tight | #snug | #normal | #relaxed | #loose]
  type radii = [#xs | #sm | #md | #lg | #xl | #"2xl" | #"3xl" | #"4xl" | #full]
  type borders = [#none]
  type borderWidths = unit
  type shadows = [#xs | #sm | #md | #lg | #xl | #"2xl" | #inner]
  type easings = [#default | #linear | #"in" | #out | #"in-out"]
  type opacity = unit
  type zIndex = unit
  type durations = [#fastest | #faster | #fast | #normal | #slow | #slower | #slowest]
  type assets = unit
  type animations = [#spin | #ping | #pulse | #bounce]
  type display = [
    | #block
    | #inline
    | #"run-in"
    | #flow
    | #"flow-root"
    | #table
    | #flex
    | #grid
    | #ruby
    | #"list-item"
    | #contents
    | #none
    | #"inline-block"
    | #"inline-table"
    | #"inline-flex"
    | #"inline-grid"
    | #"table-row-group"
    | #"table-header-group"
    | #"table-footer-group"
    | #"table-row"
    | #"table-cell"
    | #"table-column-group"
    | #"table-column"
    | #"table-caption"
    | #"ruby-base"
    | #"ruby-text"
    | #"ruby-base-container"
    | #"ruby-text-container"
    | #inherit
    | #initial
    | #revert
    | #"revert-layer"
    | #unset
  ]
  type alignContent = [
    | #normal
    | #center
    | #start
    | #end
    | #"flex-start"
    | #"flex-end"
    | #baseline
    | #"first baseline"
    | #"last baseline"
    | #"space-between"
    | #"space-around"
    | #"space-evenly"
    | #stretch
    | #inherit
    | #initial
    | #unset
  ]
  type alignItems = [
    | #normal
    | #stretch
    | #center
    | #start
    | #end
    | #"flex-start"
    | #"flex-end"
    | #baseline
    | #"first baseline"
    | #"last baseline"
    | #inherit
    | #initial
    | #unset
  ]
  type alignSelf = [
    | #auto
    | #normal
    | #center
    | #start
    | #end
    | #"self-start"
    | #"self-end"
    | #"flex-start"
    | #"flex-end"
    | #baseline
    | #"first baseline"
    | #"last baseline"
    | #stretch
    | #inherit
    | #initial
    | #unset
  ]
  type all = [#initial | #inherit | #unset | #revert | #"revert-layer"]
  type animationComposition = [#replace | #add | #accumulate]
  type animationDirection = [#normal | #reverse | #alternate | #"alternate-reverse"]
  type animationFillMode = [#none | #forwards | #backwards | #both]
  type appearance = [
    | #none
    | #auto
    | #button
    | #textfield
    | #searchfield
    | #textarea
    | #"push-button"
    | #"slider-horizontal"
    | #checkbox
    | #radio
    | #"square-button"
    | #menulist
    | #"menulist-button"
    | #listbox
    | #meter
    | #"progress-bar"
  ]
  type backfaceVisibility = [#visible | #hidden]
  type backgroundAttachment = [#scroll | #fixed | #local | #inherit]
  type backgroundClip = [#"border-box" | #"padding-box" | #"content-box" | #text]
  type borderCollapse = [#collapse | #separate | #inherit]
  type borderStyle = [
    | #none
    | #hidden
    | #dotted
    | #dashed
    | #solid
    | #double
    | #groove
    | #ridge
    | #inset
    | #outset
  ]
  type boxDecorationBreak = [#slice | #clone]
  type boxSizing = [#"content-box" | #"border-box"]
  type break = [
    | #auto
    | #avoid
    | #always
    | #all
    | #"avoid-page"
    | #page
    | #left
    | #right
    | #recto
    | #verso
    | #"avoid-column"
    | #column
    | #"avoid-region"
    | #region
  ]
  type captionSide = [#top | #bottom | #inherit]
  type clear = [#none | #left | #right | #both | #inherit]
  type columnFill = [#auto | #balance | #"balance-all"]
  type columnRuleStyle = [
    | #none
    | #hidden
    | #dotted
    | #dashed
    | #solid
    | #double
    | #groove
    | #ridge
    | #inset
    | #outset
  ]
  type contentVisibility = [#visible | #hidden | #auto]
  type direction = [#ltr | #rtl | #inherit]
  type emptyCells = [#show | #hide | #inherit]
  type flexDirection = [#row | #"row-reverse" | #column | #"column-reverse"]
  type flexWrap = [#nowrap | #wrap | #"wrap-reverse"]
  type float_ = [#left | #right | #none | #"inline-start" | #"inline-end" | #inherit]
  type fontKerning = [#auto | #normal | #none]
  type forcedColorAdjust = [#auto | #none]
  type isolation = [#auto | #isolate]
  type lineBreak = [#auto | #loose | #normal | #strict | #anywhere]
  type mixBlendMode = [
    | #normal
    | #multiply
    | #screen
    | #overlay
    | #darken
    | #lighten
    | #"color-dodge"
    | #"color-burn"
    | #"hard-light"
    | #"soft-light"
    | #difference
    | #exclusion
    | #hue
    | #saturation
    | #color
    | #luminosity
  ]
  type objectFit = [#fill | #contain | #cover | #none | #"scale-down"]
  type outlineStyle = [
    | #auto
    | #none
    | #dotted
    | #dashed
    | #solid
    | #double
    | #groove
    | #ridge
    | #inset
    | #outset
  ]
  type overflow = [#visible | #hidden | #scroll | #auto | #clip]
  type overflowWrap = [#normal | #"break-word" | #anywhere]
  type pointerEvents = [
    | #auto
    | #none
    | #visiblePainted
    | #visibleFill
    | #visibleStroke
    | #visible
    | #painted
    | #fill
    | #stroke
    | #all
  ]
  type position = [#static | #relative | #absolute | #fixed | #sticky]
  type resize = [#none | #both | #horizontal | #vertical | #block | #inline]
  type scrollBehavior = [#auto | #smooth]
  type touchAction = [
    | #auto
    | #none
    | #"pan-x"
    | #"pan-left"
    | #"pan-right"
    | #"pan-y"
    | #"pan-up"
    | #"pan-down"
    | #"pinch-zoom"
    | #manipulation
  ]
  type transformBox = [#"content-box" | #"border-box" | #"fill-box" | #"stroke-box" | #"view-box"]
  type transformStyle = [#flat | #"preserve-3d"]
  type userSelect = [#none | #auto | #text | #contain | #all]
  type visibility = [#visible | #hidden | #collapse]
  type wordBreak = [#normal | #"break-all" | #"keep-all" | #"break-word"]
  type writingMode = [#"horizontal-tb" | #"vertical-rl" | #"vertical-lr"]
  type t = {
    bg?: colors,
    bgColor?: colors,
    backgroundColor?: colors,
    borderColor?: colors,
    borderTopColor?: colors,
    borderLeftColor?: colors,
    borderRightColor?: colors,
    borderBottomColor?: colors,
    borderStartColor?: colors,
    borderInlineStartColor?: colors,
    borderEndColor?: colors,
    borderInlineEndColor?: colors,
    borderXColor?: colors,
    borderInlineColor?: colors,
    borderYColor?: colors,
    borderBlockColor?: colors,
    color?: colors,
    columnRuleColor?: colors,
    outlineColor?: colors,
    textDecorationColor?: colors,
    gap?: spacing,
    columnGap?: spacing,
    rowGap?: spacing,
    gridGap?: spacing,
    margin?: spacing,
    mt?: spacing,
    mb?: spacing,
    ml?: spacing,
    mr?: spacing,
    mx?: spacing,
    my?: spacing,
    marginTop?: spacing,
    marginBottom?: spacing,
    marginLeft?: spacing,
    marginRight?: spacing,
    padding?: spacing,
    p?: spacing,
    px?: spacing,
    py?: spacing,
    pt?: spacing,
    pb?: spacing,
    pl?: spacing,
    pr?: spacing,
    paddingTop?: spacing,
    paddingBottom?: spacing,
    paddingLeft?: spacing,
    paddingRight?: spacing,
    width?: sizes,
    maxWidth?: sizes,
    minWidth?: sizes,
    height?: sizes,
    maxHeight?: sizes,
    minHeight?: sizes,
    fontFamily?: fonts,
    fontWeight?: fontWeights,
    fontSize?: fontSizes,
    letterSpacings?: letterSpacings,
    lineHeights?: lineHeights,
    rounded?: radii,
    roundedTopLeft?: radii,
    roundedTopRight?: radii,
    roundedBottomRight?: radii,
    roundedBottomLeft?: radii,
    roundedTop?: radii,
    roundedRight?: radii,
    roundedBottom?: radii,
    roundedLeft?: radii,
    borderRadius?: radii,
    borderTopLeftRadius?: radii,
    borderTopRightRadius?: radii,
    borderBottomRightRadius?: radii,
    borderBottomLeftRadius?: radii,
    borderTopRadius?: radii,
    borderRightRadius?: radii,
    borderBottomRadius?: radii,
    borderLeftRadius?: radii,
    roundedStartStart?: radii,
    roundedStartEnd?: radii,
    roundedStart?: radii,
    roundedEndStart?: radii,
    roundedEndEnd?: radii,
    roundedEnd?: radii,
    borderStartStartRadius?: radii,
    borderStartEndRadius?: radii,
    borderStartRadius?: radii,
    borderEndStartRadius?: radii,
    borderEndEndRadius?: radii,
    borderEndRadius?: radii,
    border?: borders,
    borderTop?: borders,
    borderRight?: borders,
    borderBottom?: borders,
    borderLeft?: borders,
    outline?: borders,
    borderX?: borders,
    borderInline?: borders,
    borderY?: borders,
    borderBlock?: borders,
    borderStart?: borders,
    borderInlineStart?: borders,
    borderEnd?: borders,
    borderInlineEnd?: borders,
    borderWidth?: borderWidths,
    borderTopWidth?: borderWidths,
    borderLeftWidth?: borderWidths,
    borderRightWidth?: borderWidths,
    borderBottomWidth?: borderWidths,
    borderXWidth?: borderWidths,
    borderInlineWidth?: borderWidths,
    borderYWidth?: borderWidths,
    borderBlockWidth?: borderWidths,
    borderStartWidth?: borderWidths,
    borderInlineStartWidth?: borderWidths,
    borderEndWidth?: borderWidths,
    borderInlineEndWidth?: borderWidths,
    boxShadow?: shadows,
    transitionTimingFunction?: easings,
    opacity?: opacity,
    zIndex?: zIndex,
    transitionDuration?: durations,
    animationDuration?: durations,
    backgroundImage?: assets,
    animation?: animations,
    display?: display,
    alignContent?: alignContent,
    alignItems?: alignItems,
    alignSelf?: alignSelf,
    all?: all,
    animationComposition?: animationComposition,
    animationDirection?: animationDirection,
    animationFillMode?: animationFillMode,
    appearance?: appearance,
    backfaceVisibility?: backfaceVisibility,
    backgroundAttachment?: backgroundAttachment,
    backgroundClip?: backgroundClip,
    borderCollapse?: borderCollapse,
    borderBlockEndStyle?: borderStyle,
    borderBlockStartStyle?: borderStyle,
    borderBlockStyle?: borderStyle,
    borderBottomStyle?: borderStyle,
    borderInlineEndStyle?: borderStyle,
    borderInlineStartStyle?: borderStyle,
    borderInlineStyle?: borderStyle,
    borderLeftStyle?: borderStyle,
    borderRightStyle?: borderStyle,
    borderTopStyle?: borderStyle,
    boxDecorationBreak?: boxDecorationBreak,
    boxSizing?: boxSizing,
    breakAfter?: break,
    breakBefore?: break,
    breakInside?: break,
    captionSide?: captionSide,
    clear?: clear,
    columnFill?: columnFill,
    columnRuleStyle?: columnRuleStyle,
    contentVisibility?: contentVisibility,
    direction?: direction,
    emptyCells?: emptyCells,
    flexDirection?: flexDirection,
    flexWrap?: flexWrap,
    float_?: float_,
    fontKerning?: fontKerning,
    forcedColorAdjust?: forcedColorAdjust,
    isolation?: isolation,
    lineBreak?: lineBreak,
    mixBlendMode?: mixBlendMode,
    objectFit?: objectFit,
    outlineStyle?: outlineStyle,
    overflow?: overflow,
    overflowX?: overflow,
    overflowY?: overflow,
    overflowBlock?: overflow,
    overflowInline?: overflow,
    overflowWrap?: overflowWrap,
    pointerEvents?: pointerEvents,
    position?: position,
    resize?: resize,
    scrollBehavior?: scrollBehavior,
    touchAction?: touchAction,
    transformBox?: transformBox,
    transformStyle?: transformStyle,
    userSelect?: userSelect,
    visibility?: visibility,
    wordBreak?: wordBreak,
    writingMode?: writingMode,
  }
}
@module("@styled/css") external css: StyleSystem.t => string = "css"
