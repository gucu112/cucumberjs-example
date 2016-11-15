module.exports = () ->

    # Config goes here
    browser.ignoreSynchronization = false # true disable waiting for Angular
    @setDefaultTimeout 30 * 1000

    # instance static variables (TODO)

    # World goes here (isolated scope for each scenario)
    @World = () ->

        # instance variables
        @url = '/login' # current location
        @page = null # page object for current location
        @components = [] # array of page objects representing components

        return

    return