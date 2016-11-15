'use strict';

do ->

    class BasePage

        constructor: (@elements = {}) ->
        
        findElement: (name) ->
            if @elements.hasOwnProperty(name) then @elements[name] else null

    module.exports = BasePage
    return