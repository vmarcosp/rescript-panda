module AST = ReScriptAST

let rec generatePrimitiveType = (value: AST.primitiveTypes) =>
  switch value {
  | String => "string"
  | Unit => "unit"
  | Int => "int"
  | OpenObject => "{..}"
  | Record(keysAndValues) => {
      let fields = keysAndValues->Array.reduceWithIndex("", (content, (key, value), index) => {
        let separator = index === 0 ? "" : ", "
        `${content}${separator}${key}: ${value->generatePrimitiveType}`
      })
      `{ ${fields} }`
    }
  | Function(arguments, returnType) => {
      let parsedArgs = `(${arguments->Array.map(v => generatePrimitiveType(v))->Array.join(", ")})`
      `${parsedArgs} => ${returnType->generatePrimitiveType}`
    }
  | UserDefinedType(name) => name
  }

let generateUserDefinedType = (value: AST.userDefinedType) => {
  let recursiveFlag = value.recursive === Some(true) ? "rec ": ""
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