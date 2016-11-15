exports.config = {

  baseUrl: 'http://localhost:3000',
  
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
    profile: 'default',
    tags: false
  },

  specs: [
    'features/**/*.feature'
  ],

  params: {},

  onPrepare: function () {
    var chai = require('chai');

    // Load Chai assertions
    global.expect = chai.expect;
    global.assert = chai.assert;
    chai.should();

    // Initialize Chai plugins
    chai.use(require('chai-as-promised'));
    chai.use(require('chai-things'));

    // Setup protractor variables
    global.By = protractor.By
    global.Key = protractor.Key
    global.EC = protractor.ExpectedConditions
  }

};