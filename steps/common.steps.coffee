module.exports = () ->

    # Step definisions for common use goes here
    @Given /^redirect to the current url$/, () ->
        browser.get "#{browser.baseUrl}#{@url}"

    @Given /^load "([^"]*)" page object model$/, (page_name) ->
        new Promise (resolve, reject) =>
            try
                @page = require "../pages/#{page_name}.page"
                resolve()
            catch error
                reject error
            return

    @Given /^wait for "([^"]*)" to be visible$/, (element_name) ->
        element = @page.findElement element_name
        browser.wait EC.visibilityOf element

    @Then /^page should include "([^"]*)" with the attribute "([^"]*)" that equal "([^"]*)"$/, (element_name, attribute, value) ->
        element = @page.findElement element_name
        element.getTagName().then (tag_name) -> element_name.should.contain tag_name
        element.getAttribute(attribute).should.eventually.equal value

    @Then /^page should include "([^"]*)" with the attribute "([^"]*)" that contain "([^"]*)"$/, (element_name, attribute, value) ->
        element = @page.findElement element_name
        element.getTagName().then (tag_name) -> element_name.should.contain tag_name
        element.getAttribute(attribute).should.eventually.contain value

    @Then /^page should include "([^"]*)" with the following attributes:$/, (element_name, table) ->
        element = @page.findElement element_name
        element.getTagName().then (tag_name) -> element_name.should.contain tag_name
        table.hashes().forEach (data) ->
            element.getAttribute(data.attribute).should.eventually.equal data.value

    return