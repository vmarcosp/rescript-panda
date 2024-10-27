open Vitest

describe("StyleSystem", () => {
  test(".extractAndMerge(...)", _ => {
    open Expect 

    let theme: Config.theme = %raw(`{
      extend: {
        colors: {
          primary: { 300: { value: '#c3c3c3' } },
          secondary: { dark: { 100: { value: '#cecece'} }, light: { value: '#fefefe' } }
        }
      },
      colors: {
        primary: { 100: { value: '#fafafa' }, 200: { value: '#000000' } },
        secondary: { 100: { value: '#fc3666' }, dark: { 200: { value: '#d3d3d3' } } }
      }
    }`)

    expect(StyleSystem.extractAndMergeTheme(theme))->toMatchSnapshot
  })
})
