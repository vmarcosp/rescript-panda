import merge from 'deepmerge'

export const extractAndMerge = (theme, presets)  => {
  const { extend, ...themeFields }= theme
  const themesFromPreset = presets.map(preset => preset.theme)

  return merge.all([
    ...themesFromPreset,
    extend, 
    themeFields,
  ])
}

