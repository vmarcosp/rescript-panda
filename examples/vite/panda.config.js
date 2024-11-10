import { defineConfig } from "@pandacss/dev"

export default defineConfig({
  preflight: true,
  include: ["./src/**/*.{js,jsx,ts,tsx}"],
  importMap: '@styled',
  strictTokens: true,
  strictPropertyValues: true,
  theme: {
    extend: {
      tokens: {
        colors: {
          primary: {
            100: { value: '#363636' }
          }
        }
      }
    }
  },
  exclude: [],
  outdir: "./src/styled-system",
})
