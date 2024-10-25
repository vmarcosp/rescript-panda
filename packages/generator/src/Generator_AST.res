type rec primitiveTypes =
  | String
  | Int
  | Unit
  | OpenObject
  | Option(primitiveTypes)
  | Function(array<primitiveTypes>, primitiveTypes)
  | Record(array<recordAttributes>)
  | UserDefinedType(string)
  | PolyVariant(array<(string, option<array<primitiveTypes>>)>)
and recordAttributes = {
  name: string,
  type_: primitiveTypes,
  isOptional?: bool,
}

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
