module.exports = () ->

    # disable waiting for Angular
    browser.ignoreSynchronization = true

    @By = protractor.By
    @Key = protractor.Key
    @EC = protractor.ExpectedConditions

    @setDefaultTimeout 60 * 1000

    # isolated scope for each scenario
    @World = () ->

        @example = 'example world'

        return

    return