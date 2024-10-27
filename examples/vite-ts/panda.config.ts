import { defineConfig } from "@pandacss/dev"

export default defineConfig({
  preflight: true,
  importMap: '@styled',
  include: ["./src/**/*.{js,jsx,ts,tsx}"],
  strictTokens: true,
  theme: {
    tokens: {
      colors: {
        primary: {
          100: { value: '#FFCDD2' }, // light pink
          200: { value: '#E57373' }, // medium pink
          300: { value: '#D32F2F' }  // dark red
        },
      }
    },
    extend: {
      tokens: {
        colors: {
          primary: {
            400: { value: '#D32F2F' }  // dark red
          },
          mysecondary: {
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
