open Vitest

describe("Generator", () => {
  test("externalDeclaration", _ => {
    open Expect

    let node = {
      open Generator_AST
      ExternalDeclaration(
        Module(`@styled/css`),
        Identifier("css"),
        Function([OpenObject], String),
        "css",
      )
    }

    let generatedCode = Generator.generate([node])
    expect(generatedCode)->toMatchSnapshot
  })

  test("buildIntType", _ => {
    open Expect
    open Generator_AST

    expect(String->Generator.generatePrimitiveType)->toBe("string")
    expect(Int->Generator.generatePrimitiveType)->toBe("int")
    expect(Unit->Generator.generatePrimitiveType)->toBe("unit")
    expect(Function([String, Int], Unit)->Generator.generatePrimitiveType)->toBe(
      "(string, int) => unit",
    )
    expect(Record([("name", String), ("age", Int)])->Generator.generatePrimitiveType)->toBe(
      "{ name: string, age: int }",
    )
    expect(UserDefinedType("person")->Generator.generatePrimitiveType)->toBe("person")
    expect(PolyVariant([("Admin", None)])->Generator.generatePrimitiveType)->toBe(
      "[ #Admin ]",
    )
    expect(
      PolyVariant([("Admin", Some([String, Int]))])->Generator.generatePrimitiveType,
    )->toBe("[ #Admin(string, int) ]")
  })

  test("userDefinedType", _ => {
    open Expect
    open Generator_AST

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

    expect(customField->Generator.generateUserDefinedType)->toBe("type customField = int")
    expect(recursivePerson->Generator.generateUserDefinedType)->toBe(
      "type rec recursivePerson = { name: string, sister: recursivePerson }",
    )

    expect(person->Generator.generateUserDefinedType)->toBe(
      "type person = { name: string, age: int, customField: customField }",
    )
  })
})
