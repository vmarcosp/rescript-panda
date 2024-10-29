open Vitest
open UtilitiesTemplate

describe("StyleSystem_Utilities", () => {
  test(".rgb(...)", _ => {
    open Expect

    expect(rgb(255, 255, 255))->toMatchSnapshot
  })

  test(".rgba(...)", _ => {
    open Expect

    expect(rgba(255, 255, 255, 255))->toMatchSnapshot
  })
  

  test(".hsla(...)", _ => {
    open Expect

    expect(hsla(255, 255, 255, 255))->toMatchSnapshot
  })


  test(".hsl(...)", _ => {
    open Expect

    expect(hsl(255, 255, 255))->toMatchSnapshot
  })

})
