open Vitest
open StyleSystem_Utilities

describe("StyleSystem_Utilities", () => {
  test(".rgb(...)", _ => {
    open Expect

    expect(rgb(255, 255, 255))->toBe("[rgb(255, 255, 255)]")
  })

  test(".rgba(...)", _ => {
    open Expect

    expect(rgba(255, 255, 255, 255))->toBe("[rgba(255, 255, 255, 255)]")
  })
})
