type rec primitiveTypes =
  | String
  | Int
  | Unit
  | OpenObject
  | Function(array<primitiveTypes>, primitiveTypes)
  | Record(array<(string, primitiveTypes)>)
  | UserDefinedType(string)
  
type userDefinedType = {
  name: string,
  recursive?: bool,
  type_: primitiveTypes,
}

type externalDeclarationType =
  | Val
  | Module(string)

type identifier = Identifier(string)

type astNode = 
| ExternalDeclaration(externalDeclarationType, identifier, primitiveTypes, string)
| TypeDeclaration(userDefinedType)
