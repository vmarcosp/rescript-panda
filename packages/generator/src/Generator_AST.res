type rec primitiveTypes =
  | String
  | Int
  | Unit
  | OpenObject
  | Option(primitiveTypes)
  | Function(array<primitiveTypes>, primitiveTypes)
  | Record(array<recordAttributes>)
  | UserDefinedType(string)
  | PolyVariant(array<polyVariantAttributes>)

and polyVariantAttributes = {
  variantName: string,
  arguments?: array<primitiveTypes>,
  isString?: bool,
}
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

type rec astNode =
  | ExternalDeclaration(externalDeclarationType, identifier, primitiveTypes, string)
  | TypeDeclaration(userDefinedType)
  | ModuleDeclaration(string, array<astNode>)
