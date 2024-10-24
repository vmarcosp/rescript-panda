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

  test("buildIntType", _ => {
    open Expect
    open ReScriptAST

    expect(String->ReScriptCodegen.generatePrimitiveType)->toBe("string")
    expect(Int->ReScriptCodegen.generatePrimitiveType)->toBe("int")
    expect(Unit->ReScriptCodegen.generatePrimitiveType)->toBe("unit")
    expect(Function([String, Int], Unit)->ReScriptCodegen.generatePrimitiveType)->toBe(
      "(string, int) => unit",
    )
    expect(Record([("name", String), ("age", Int)])->ReScriptCodegen.generatePrimitiveType)->toBe(
      "{ name: string, age: int }",
    )
    expect(UserDefinedType("person")->ReScriptCodegen.generatePrimitiveType)->toBe("person")
  })

  test("userDefinedType", _ => {
    open Expect
    open ReScriptAST

    let person = {
      name: "person",
      type_: Record([
        ("name", String),
        ("age", Int),
        ("customField", UserDefinedType("customField")),
      ]),
    }

    let recursivePerson = {
      name: "recursivePerson",
      recursive: true,
      type_: Record([("name", String), ("sister", UserDefinedType("recursivePerson"))]),
    }

    let customField = {
      name: "customField",
      type_: Int,
    }

    expect(customField->ReScriptCodegen.generateUserDefinedType)->toBe("type customField = int")
    expect(recursivePerson->ReScriptCodegen.generateUserDefinedType)->toBe(
      "type rec recursivePerson = { name: string, sister: recursivePerson }",
    )

    expect(person->ReScriptCodegen.generateUserDefinedType)->toBe(
      "type person = { name: string, age: int, customField: customField }",
    )
  })
})
