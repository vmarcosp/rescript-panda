/* eslint-disable */
export type Token = "colors.primary.100" | "colors.primary.200" | "colors.primary.300" | "colors.secondary.dark.100" | "colors.secondary.dark.200" | "colors.secondary.dark.300" | "colors.secondary.light.100" | "colors.secondary.light.200" | "colors.secondary.light.300" | "colors.gray" | "breakpoints.sm" | "breakpoints.md" | "breakpoints.lg" | "breakpoints.xl" | "breakpoints.2xl" | "sizes.breakpoint-sm" | "sizes.breakpoint-md" | "sizes.breakpoint-lg" | "sizes.breakpoint-xl" | "sizes.breakpoint-2xl" | "colors.colorPalette.100" | "colors.colorPalette.200" | "colors.colorPalette.300" | "colors.colorPalette.dark.100" | "colors.colorPalette.dark.200" | "colors.colorPalette.dark.300" | "colors.colorPalette.light.100" | "colors.colorPalette.light.200" | "colors.colorPalette.light.300" | "colors.colorPalette"

export type ColorPalette = "primary" | "secondary" | "secondary.dark" | "secondary.light" | "gray"

export type ColorToken = "primary.100" | "primary.200" | "primary.300" | "secondary.dark.100" | "secondary.dark.200" | "secondary.dark.300" | "secondary.light.100" | "secondary.light.200" | "secondary.light.300" | "gray" | "colorPalette.100" | "colorPalette.200" | "colorPalette.300" | "colorPalette.dark.100" | "colorPalette.dark.200" | "colorPalette.dark.300" | "colorPalette.light.100" | "colorPalette.light.200" | "colorPalette.light.300" | "colorPalette"

export type BreakpointToken = "sm" | "md" | "lg" | "xl" | "2xl"

export type SizeToken = "breakpoint-sm" | "breakpoint-md" | "breakpoint-lg" | "breakpoint-xl" | "breakpoint-2xl"

export type Tokens = {
		colors: ColorToken
		breakpoints: BreakpointToken
		sizes: SizeToken
} & { [token: string]: never }

export type TokenCategory = "aspectRatios" | "zIndex" | "opacity" | "colors" | "fonts" | "fontSizes" | "fontWeights" | "lineHeights" | "letterSpacings" | "sizes" | "cursor" | "shadows" | "spacing" | "radii" | "borders" | "borderWidths" | "durations" | "easings" | "animations" | "blurs" | "gradients" | "breakpoints" | "assets"