/* eslint-disable */
export type Token = "colors.warning" | "colors.primary.400" | "colors.secondary.dark.100" | "colors.secondary.dark.200" | "colors.secondary.dark.300" | "colors.secondary.light.100" | "colors.secondary.light.200" | "colors.secondary.light.300" | "colors.gray" | "colors.colorPalette" | "colors.colorPalette.400" | "colors.colorPalette.dark.100" | "colors.colorPalette.100" | "colors.colorPalette.dark.200" | "colors.colorPalette.200" | "colors.colorPalette.dark.300" | "colors.colorPalette.300" | "colors.colorPalette.light.100" | "colors.colorPalette.light.200" | "colors.colorPalette.light.300"

export type ColorPalette = "warning" | "primary" | "secondary" | "secondary.dark" | "secondary.light" | "gray"

export type ColorToken = "warning" | "primary.400" | "secondary.dark.100" | "secondary.dark.200" | "secondary.dark.300" | "secondary.light.100" | "secondary.light.200" | "secondary.light.300" | "gray" | "colorPalette" | "colorPalette.400" | "colorPalette.dark.100" | "colorPalette.100" | "colorPalette.dark.200" | "colorPalette.200" | "colorPalette.dark.300" | "colorPalette.300" | "colorPalette.light.100" | "colorPalette.light.200" | "colorPalette.light.300"

export type Tokens = {
		colors: ColorToken
} & { [token: string]: never }

export type TokenCategory = "aspectRatios" | "zIndex" | "opacity" | "colors" | "fonts" | "fontSizes" | "fontWeights" | "lineHeights" | "letterSpacings" | "sizes" | "cursor" | "shadows" | "spacing" | "radii" | "borders" | "borderWidths" | "durations" | "easings" | "animations" | "blurs" | "gradients" | "breakpoints" | "assets"