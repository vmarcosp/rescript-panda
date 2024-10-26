let rec extract = (
  dict: Js.Dict.t<Js.Json.t>,
  tokens: array<string>,
  ~prefix: option<string>=?,
) => {
  let isTokenDefinition = dict =>
    dict->Dict.get("value")->Option.map(_ => true)->Option.getOr(false)
  if isTokenDefinition(dict) {
    tokens
  } else {
    let entries = dict->Js.Dict.entries
    let extractedTokens = entries->Array.reduce([], (acc, (key, value)) => {
      switch value {
      | Object(dict) =>
        if isTokenDefinition(dict) {
          let tokenName = prefix->Option.map(prefix => `${prefix}.${key}`)->Option.getOr(key)
          Array.concat(acc, [tokenName])
        } else {
          let prefix = prefix->Option.map(prefix => `${prefix}.${key}`)->Option.getOr(key)
          extract(dict, acc, ~prefix)
        }
      | _ => acc
      }
    })

    [...extractedTokens, ...tokens]
  }
}
