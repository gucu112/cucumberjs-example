module.exports = () ->

    @After (scenario) ->
        browser.restart() if scenario.failed
    
    return