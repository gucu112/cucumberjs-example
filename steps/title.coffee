module.exports = () ->

    @Given /^base url$/, () ->
        browser.get browser.baseUrl
    
    @When /^redirect to "([^"]*)"$/, {timeout: 60 * 1000}, (url) ->
        browser.get url

    @Then /^title equals "([^"]*)"$/, (title) ->
        browser.getTitle()
            .should.eventually.equal title

    @Then /^title contains "([^"]*)"$/, (title) ->
        browser.getTitle()
            .should.eventually.contains title

    return