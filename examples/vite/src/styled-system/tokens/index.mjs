const tokens = {
  "colors.warning": {
    "value": "red",
    "variable": "var(--colors-warning)"
  },
  "colors.primary.400": {
    "value": "#FFCDD2",
    "variable": "var(--colors-primary-400)"
  },
  "colors.secondary.dark.100": {
    "value": "#8E24AA",
    "variable": "var(--colors-secondary-dark-100)"
  },
  "colors.secondary.dark.200": {
    "value": "#5E35B1",
    "variable": "var(--colors-secondary-dark-200)"
  },
  "colors.secondary.dark.300": {
    "value": "#311B92",
    "variable": "var(--colors-secondary-dark-300)"
  },
  "colors.secondary.light.100": {
    "value": "#FFF59D",
    "variable": "var(--colors-secondary-light-100)"
  },
  "colors.secondary.light.200": {
    "value": "#FFF176",
    "variable": "var(--colors-secondary-light-200)"
  },
  "colors.secondary.light.300": {
    "value": "#FFEB3B",
    "variable": "var(--colors-secondary-light-300)"
  },
  "colors.gray": {
    "value": "#BDBDBD",
    "variable": "var(--colors-gray)"
  },
  "colors.colorPalette": {
    "value": "var(--colors-color-palette)",
    "variable": "var(--colors-color-palette)"
  },
  "colors.colorPalette.400": {
    "value": "var(--colors-color-palette-400)",
    "variable": "var(--colors-color-palette-400)"
  },
  "colors.colorPalette.dark.100": {
    "value": "var(--colors-color-palette-dark-100)",
    "variable": "var(--colors-color-palette-dark-100)"
  },
  "colors.colorPalette.100": {
    "value": "var(--colors-color-palette-100)",
    "variable": "var(--colors-color-palette-100)"
  },
  "colors.colorPalette.dark.200": {
    "value": "var(--colors-color-palette-dark-200)",
    "variable": "var(--colors-color-palette-dark-200)"
  },
  "colors.colorPalette.200": {
    "value": "var(--colors-color-palette-200)",
    "variable": "var(--colors-color-palette-200)"
  },
  "colors.colorPalette.dark.300": {
    "value": "var(--colors-color-palette-dark-300)",
    "variable": "var(--colors-color-palette-dark-300)"
  },
  "colors.colorPalette.300": {
    "value": "var(--colors-color-palette-300)",
    "variable": "var(--colors-color-palette-300)"
  },
  "colors.colorPalette.light.100": {
    "value": "var(--colors-color-palette-light-100)",
    "variable": "var(--colors-color-palette-light-100)"
  },
  "colors.colorPalette.light.200": {
    "value": "var(--colors-color-palette-light-200)",
    "variable": "var(--colors-color-palette-light-200)"
  },
  "colors.colorPalette.light.300": {
    "value": "var(--colors-color-palette-light-300)",
    "variable": "var(--colors-color-palette-light-300)"
  }
}

export function token(path, fallback) {
  return tokens[path]?.value || fallback
}

function tokenVar(path, fallback) {
  return tokens[path]?.variable || fallback
}

token.var = tokenVar