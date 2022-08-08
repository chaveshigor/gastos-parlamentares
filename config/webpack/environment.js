const { environment } = require('@rails/webpacker')
const webpacker = require('webpack')

environment.plugins.prepend(
  'Provide',
  new webpacker.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    jquery: 'jquery',
    'window.jQuery': 'jquery',
    Popper: ['popper.js', 'default'],
  })
)

module.exports = environment
