import merge from 'deepmerge'

export const extractAndMergeTheme = (theme) => {
  const { extend, ...themeFields }= theme

  return merge(extend, themeFields)
}

