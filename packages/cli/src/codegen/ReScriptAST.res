type rec nodeType =
  | String
  | Unit
  | Function(array<nodeType>, nodeType)
  | OpenObject

type externalDeclarationType =
  | Val
  | Module(string)

type identifier = Identifier(string)

type astNode = ExternalDeclaration(externalDeclarationType, identifier, nodeType, string)
