'use strict'

do ->

    BasePage = require './base.page'

    class LoginPage extends BasePage

        constructor: ->
            @form = element By.id 'loginForm'
            @form.email = @form.element By.model 'ctrl.user.email'
            @form.email.parent = @form.email.element By.xpath '..'
            @form.email.feedback = @form.email.parent.element By.className 'form-control-feedback'
            @form.password = @form.element By.model 'ctrl.user.password'
            @form.password.parent = @form.password.element By.xpath '..'
            @form.password.feedback = @form.password.parent.element By.className 'form-control-feedback'
            @form.buttons = @form.all By.css '.form-buttons > button'
            @form.errors = @form.all By.className 'help-block'
            super
                'login form': @form
                'input for email': @form.email
                'input for password': @form.password
                'buttons': @form.buttons
                'submit button': @form.buttons.get 0
                'reset button': @form.buttons.get 1
                'errors': @form.errors
                'email required error': @form.errors.get 0
                'email email error': @form.errors.get 1
                'email unregistered error': @form.errors.get 2
                'password required error': @form.errors.get 3
                'password invalid': @form.errors.get 4

        login: (data, submit = true) ->
            for property of data
                element = @form[property]
                if data.hasOwnProperty(property) and element and typeof element.sendKeys is 'function'
                    element.sendKeys data[property]
            if submit then @form.submit.click() else null

    module.exports = new LoginPage
    return