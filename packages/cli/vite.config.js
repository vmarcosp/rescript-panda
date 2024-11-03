import { defineConfig } from 'vite';
import { resolve } from 'path';

export default defineConfig({
  build: {
    lib: {
      entry: resolve(__dirname, 'src/Run.res.mjs'),
      formats: ['es'],
      fileName: 'cli.js',
    },
    rollupOptions: {
      external: [
        // Only exclude node built-ins, NOT node_modules
        'path',
        'fs',
        'os',
        'util',
        // Add other node built-ins you're using
      ],
    },
    // This is important - it tells Vite to bundle all deps
    commonjsOptions: {
      include: [/node_modules/],
    },
    // Ensure we're building for Node
    target: 'node14',
    minify: true,
    sourcemap: false,
    // Important: don't empty outDir to keep the shebang
    emptyOutDir: false,
    // Bundle everything together
    ssr: {
      noExternal: true,
    }
  },
});
