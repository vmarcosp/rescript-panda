import { defineConfig, definePreset } from "@pandacss/dev";
import pandaPreset from '@pandacss/preset-panda'

export const myPreset = definePreset({
  name: 'my-preset',
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
})

export default defineConfig({
  presets: [pandaPreset, myPreset],
  preflight: true,
  include: ["./src/**/*.{js,jsx,ts,tsx}", "./pages/**/*.{js,jsx,ts,tsx}"],
  exclude: [],
  strictPropertyValues: true,
  outdir: "styled-system",
});
