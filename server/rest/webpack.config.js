const path = require('path');

module.exports = {
  entry: './src/restnode.js',
  output: {
    filename: 'restnode.js',
    path: path.resolve(__dirname, 'dist')
  },
  target:'node',
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /(node_modules|bower_components)/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['@babel/preset-env']
          }
        }
      }
    ]
  }
};