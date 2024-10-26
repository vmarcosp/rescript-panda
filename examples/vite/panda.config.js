import { defineConfig } from "@pandacss/dev"

export default defineConfig({
  preflight: true,
  importMap: '@styled',
  include: ["./src/**/*.{js,jsx,ts,tsx}"],
  strictTokens: true,
  theme: {
    extend: {
      tokens: {
        colors: {
          primary: {
            daciuk: { gosta: { de: { rola: { value: '#fafafa'}}}},
            100: { value: '#fc36' },
            200: { value: '#fc36' },
            300: { value: '#fc36' }
          },
          secondary: {
            dark: {
              100: { value: '#fc36' },
              200: { value: '#fc36' },
              300: { value: '#fc36' }
            },
            light: {
              100: { value: '#fc36' },
              200: { value: '#fc36' },
              300: { value: '#fc36' }
            },
          },
          gray: { value: '#fc36' }
        }
      }
    }
  },
  exclude: [],
  outdir: "./src/styled-system",
})
