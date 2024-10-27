import { defineConfig } from "@pandacss/dev"

export default defineConfig({
  presets: [{
    name: 'preset-1',
    presets: [{
      name: 'nested-preset-1',
      theme: {
        tokens: {
          colors: {
            error: { value: 'red' }
          }
        }
      }
    }],
    theme: {
      tokens: {
        colors: {
          warning: { value: 'red' }
        }
      }
    }
  }],
  preflight: true,
  include: ["./src/**/*.{js,jsx,ts,tsx}"],
  strictTokens: true,
  theme: {
    extend: {
      tokens: {
        colors: {
          primary: {
            400: { value: '#FFCDD2' }, // light pink
          },
          secondary: {
            dark: {
              100: { value: '#8E24AA' }, // dark purple
              200: { value: '#5E35B1' }, // medium purple
              300: { value: '#311B92' }  // deep indigo
            },
            light: {
              100: { value: '#FFF59D' }, // light yellow
              200: { value: '#FFF176' }, // medium yellow
              300: { value: '#FFEB3B' }  // bright yellow
            },
          },
          gray: { value: '#BDBDBD' } // medium gray
        }
      }
    }
  },
  exclude: [],
  outdir: "./src/styled-system",
})
