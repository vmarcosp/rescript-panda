module AST = Generator_AST

let rec generatePrimitiveType = (value: AST.primitiveTypes) =>
  switch value {
  | String => "string"
  | Unit => "unit"
  | Int => "int"
  | OpenObject => "{..}"
  | Option(type_) => `option<${type_->generatePrimitiveType}>`
  | Record(keysAndValues) => {
      let fields = keysAndValues->Array.reduceWithIndex("", (content, attributes, index) => {
        let separator = index === 0 ? "" : ", "
        let optionalOperator = switch attributes.isOptional {
        | None
        | Some(false) => ""
        | Some(true) => "?"
        }
        `${content}${separator}${attributes.name}${optionalOperator}: ${attributes.type_->generatePrimitiveType}`
      })
      `{ ${fields} }`
    }
  | Function(arguments, returnType) => {
      let parsedArgs = `(${arguments->Array.map(v => generatePrimitiveType(v))->Array.join(", ")})`
      `${parsedArgs} => ${returnType->generatePrimitiveType}`
    }
  | UserDefinedType(name) => name
  | PolyVariant(values) => {
      open AST

      let generateArguments = arguments => {
        let parsedTypes = arguments->Array.reduceWithIndex("", (acc, type_, index) => {
          let separator = index === 0 ? "" : ", "

          `${acc}${separator}${type_->generatePrimitiveType}`
        })

        `(${parsedTypes})`
      }

      let generateVariant = (~name, ~arguments=?, ~isString=?) => {
        let prefix = "#"
        let arguments = arguments->Option.map(generateArguments)->Option.getOr("")
        switch isString {
        | None
        | Some(false) =>
          `${prefix}${name}${arguments}`
        | Some(true) => `${prefix}"${name}"${arguments}`
        }
      }

      let generateVariants = (variants, attributes, index) => {
        let separator = index === 0 ? "" : " | "
        let variant = generateVariant(
          ~name=attributes.variantName,
          ~arguments=?attributes.arguments,
          ~isString=?attributes.isString,
        )
        `${variants}${separator}${variant}`
      }

      `[ ${values->Array.reduceWithIndex("", generateVariants)} ]`
    }
  }

let generateUserDefinedType = (value: AST.userDefinedType) => {
  let recursiveFlag = value.recursive === Some(true) ? "rec " : ""
  `type ${recursiveFlag}${value.name} = ${value.type_->generatePrimitiveType}`
}

let generateExternalDeclarationType = (value: AST.externalDeclarationType) =>
  switch value {
  | Val => "@val"
  | Module(moduleName) => `@module("${moduleName}")`
  }

let generateIdentifier = (value: AST.identifier) =>
  switch value {
  | Identifier(name) => name
  }

let generate = (nodes: array<AST.astNode>) =>
  nodes
  ->Array.map(node =>
    switch node {
    | ExternalDeclaration(declarationType, identifier, signature, externalNameValue) =>
      `${declarationType->generateExternalDeclarationType} external ${identifier->generateIdentifier}: ${signature->generatePrimitiveType} = "${externalNameValue}"`
    | TypeDeclaration(value) => generateUserDefinedType(value)
    }
  )
  ->Array.join("\n")
