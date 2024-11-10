module Array = {
  let uniq = items => {
    let items = Set.fromArray(items)
    items->Set.toArray
  }
}
