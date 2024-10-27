import merge from 'deepmerge'
import presetPanda from '@pandacss/preset-panda'

function getPresetPanda(theme) {
  const pandaTheme = presetPanda.theme

  if ('tokens' in theme) {
    delete pandaTheme['tokens']
  }

  return pandaTheme
}

export const extractAndMerge = (theme, presets) => {
  const { extend, ...themeFields } = theme

  const pandaTheme = getPresetPanda(themeFields)

  const valuesToMerge = presets === undefined ? [pandaTheme] : presets.map(preset => preset.theme)

  return merge.all([
    ...valuesToMerge,
    extend,
    themeFields,
  ])
}
