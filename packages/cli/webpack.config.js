const path = require('path');
const webpack = require('webpack');

module.exports = {
  entry: './src/Run.res.mjs',
  target: 'node',
  mode: 'production',
  resolve: {
    extensions: ['.js', '.json'],
  },
  output: {
    filename: 'cli.js',
    path: path.resolve(__dirname, 'dist'),
  },
  optimization: {
    minimize: true // Set to false if you want to debug the output
  },
  plugins: [
    new webpack.BannerPlugin({ banner: '#!/usr/bin/env node', raw: true }),
  ],
  externals: {
    fsevents: "require('fsevents')",
  }
};
