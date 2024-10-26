open Vitest

describe("Styles", () => {
  test("extractTokens", _ => {
    open Expect

    let simple = %raw(`
      {
        simple: {value:'#fafafa'},
      }
      `)

    let nested = %raw(`
      {
        simple: {value:'#fafafa'},
        primary:{100:{value:'#fafafa'}, 200: {value: '#fafafa'}},
        secondary:{another:{and:{value: '#fafafa'}}}
      }
      `)
    
    expect(Styles.extractTokens(simple, []))->toEqual(["simple"])
    expect(Styles.extractTokens(nested, []))->toEqual(["secondary.another.and", "primary.100",  "primary.200", "simple"])
  })
})
