import { defineConfig } from 'vitest/config';

export default defineConfig({
  test: {
    include: ['**/*Tests.res.mjs'], // Specifies the pattern for test files
  },
});
