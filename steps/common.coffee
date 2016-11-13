module.exports = () ->

    @When /^it just pass$/, (cb) ->
        cb()
    
    @Then /^world example variable should be present$/, () ->
        expect(@example).to.equal('example world')

    @Then /^protractor example param should be present$/, () ->
        expect(browser.params.example).to.equal('example param')

    return