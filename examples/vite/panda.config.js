import { defineConfig } from "@pandacss/dev"

export default defineConfig({
  preflight: true,
  importMap: '@styled',
  include: ["./src/**/*.{js,jsx,ts,tsx}"],
  exclude: [],
  theme: {
    extend: {}
  },
  outdir: "./src/styled-system",
})
