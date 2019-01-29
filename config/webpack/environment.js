const { environment } = require('@rails/webpacker')
const VueLoaderPlugin = require('vue-loader/lib/plugin')
const vue =  require('./loaders/vue')

environment.config.merge({  resolve: {
    alias: {
      'vue$': 'vue/dist/vue.esm.js'
    }
  }
})
environment.loaders.append('vue', vue)
environment.plugins.append('VueLoaderPlugin', new VueLoaderPlugin())
module.exports = environment
