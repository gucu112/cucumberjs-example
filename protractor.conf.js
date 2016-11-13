exports.config = {

  baseUrl: 'http://localhost:3000/',
  
  capabilities: {
    'browserName': 'chrome'
  },

  framework: 'custom',
  frameworkPath: require.resolve('protractor-cucumber-framework'),

  cucumberOpts: {
    require: [
      'support/*.{js,coffee}',
      'steps/**/*.{js,coffee}'
    ],
    format: 'pretty', // or 'progress'
    profile: false,
    tags: false
  },

  specs: [
    'features/**/*.feature'
  ],

  params: {
    example: 'example param'
  },

  onPrepare: function () {
    var chai = require('chai');

    // Load Chai assertions
    global.expect = chai.expect;
    global.assert = chai.assert;
    chai.should();

    // Initialize Chai plugins
    chai.use(require('chai-as-promised'));
    chai.use(require('chai-things'));
  }

};