open Vitest

describe("ReScriptCodegen", () => {
  test("externalDeclaration", _ => {
    open Expect

    let node = {
      open ReScriptAST
      ExternalDeclaration(
        Module(`@styled/css`),
        Identifier("css"),
        Function([OpenObject], String),
        "css",
      )
    }

    let generatedCode = ReScriptCodegen.generate([node])
    expect(generatedCode)->toMatchSnapshot
  })
})
