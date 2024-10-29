open Generator_AST

module Fs = NodeJs.Fs
module Path = NodeJs.Path

let make = () => {
  let utilitiesPath = Path.resolve([NodeJs.Global.dirname, "UtilitiesTemplate.res"])
  let content = Fs.readFileSync(utilitiesPath)

  let lines = content->NodeJs.Buffer.toString->String.split("\n")
  let isTypeColorsLine = line => line->String.endsWith("// type-colors")

  let content =
    lines
    ->Array.map(line => {
      if isTypeColorsLine(line) {
        Generator.generate([
          TypeDeclaration({
            name: "colors",
            type_: UserDefinedType(`Panda.${StyleSystem.colorsTypeName}`),
          }),
        ])
      } else {
        line
      }
    })
    ->Array.join("\n")

  RawDeclaration(content)
}
