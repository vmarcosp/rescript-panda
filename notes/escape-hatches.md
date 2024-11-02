Panda has some limitations because of its zero-runtime design. This prevents us from wrapping functions like `css` or using utilities such as `unbox` to handle polyvariants. 
As a result, we can't directly support both `color: #red.50` and `color: #hex("#fafafa")`.
To address this for ReScript support, we’ll implement escape hatches using PPX, enabling zero-runtime code generation while maintaining Panda’s intended functionality.

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
