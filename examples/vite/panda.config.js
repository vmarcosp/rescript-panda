import { defineConfig } from "@pandacss/dev"

export default defineConfig({
  preflight: true,
  importMap: '@styled',
  include: ["./src/**/*.{js,jsx,ts,tsx}"],
  exclude: [],
  theme: {
    extend: {
      tokens: {
        colors: {
          primary: { value: '#fc36' },
          secondary: { value: '#fc36' },
          gray: { value: '#fc36' }
        }
      }
    }
  },
  outdir: "./src/styled-system",
})
