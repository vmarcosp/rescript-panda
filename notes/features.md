## Features

- [ ] `css` 
- [ ] `patterns`
- [ ] `jsx`
- [ ] Shorthand properties
- [ ] Escape-hatches (e.g %hex, %rgb)
- [ ] Utilities (e.g transform)

## `css({...})`
- [x] `colors`
- [x] `spacing`
- [ ] `sizes`

Escape hatches
```rescript
css({
  // Spacing
  padding: #1,
  padding: %s(#1, #1), // "1 1"
  padding: %s(#1, #1, #1), // "1 1 1"
  padding: %s(#1, #1, #1, #2), // 
  // Colors
  color: #"red.50", // "red.50"
  color: %hex("#fafafa"), // "[#fafafa]"
  color: %rgb(255, 255, 255) // "[rgb(255,255,255)]"
  color: %rgba(255, 255, 255, 0) // "[rgb(255,255,255)]"
  color: %hsl(255, 255, 255) // "[hsl(255,255,255)]"
  color: %hsla(255, 255, 255, 0) // "[hsla(255,255,255,0)]"
  // Sizes
  width: %size("12px")
})
```

### CSS Properties

- Done ✅
  - [x] columnRuleColor
  - [x] backgroundColor
  - [x] borderBottomColor
  - [x] borderColor
  - [x] borderLeftColor
  - [x] borderRightColor
  - [x] borderTopColor
  - [x] color
  - [x] outlineColor
  - [x] textDecorationColor
  - [x] padding
  - [x] paddingBottom
  - [x] paddingLeft
  - [x] paddingRight
  - [x] paddingTop
  - [x] margin
  - [x] marginBottom
  - [x] marginLeft
  - [x] marginRight
  - [x] marginTop
  - [x] gap
  - [x] columnGap
  - [x] rowGap
  - [x] gridGap
  - [x] width
  - [x] minWidth
  - [x] maxwidth
  - [x] height
  - [x] minHeight
  - [x] maxHeight
