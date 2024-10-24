module AST = ReScriptAST

let rec generateNodeType = (value: AST.nodeType) =>
  switch value {
  | String => "string"
  | Unit => "unit"
  | OpenObject => "{..}"
  | Function(arguments, returnType) => {
      let parsedArgs = `(${arguments->Array.map(v => generateNodeType(v))->Array.join(",")})`
      `${parsedArgs} => ${returnType->generateNodeType}`
    }
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
      `${declarationType->generateExternalDeclarationType} external ${identifier->generateIdentifier}: ${signature->generateNodeType} = "${externalNameValue}"`
    }
  )
  ->Array.join("\n")
