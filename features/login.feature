@login @modal
Feature: Login functionality
    In order to be logged into site as user
    As an anonymous guest
    I want be able to log into site with proper credentials

    Background:
        Given redirect to the current url
        And load "login" page object model
        And wait for "login form" to be visible
    
    Scenario: Login form should include correct inputs and buttons with correct attributes
        Then page should include "login form" with the attribute "id" that equal "loginForm"
        And page should include "input for email" with the following attributes:
            | attribute | value |
            | name      | email |
            | type      | email |
        And page should include "input for password" with the following attributes:
            | attribute | value    |
            | name      | password |
            | type      | password |
        And page should include "submit button" with the attribute "type" that equal "submit"
        And page should include "reset button" with the attribute "ng-click" that contain "reset"

    Scenario: Buttons should be disabled and errors should not be visible at the begining
        When "buttons" will be visible
        Then "buttons" should be disabled
        And "errors" should not be visible

    Scenario: Reset button should clear form when clicked
        When I input user credentials using email "abc" and password "xyz"
        #And I click "submit button"
        And I click "reset button"
        Then "input for email" should be empty
        And "input for password" should be empty
        And "buttons" should be disabled
        And "errors" should not be visible

    Scenario: Login form should be able to log in example user and after that redirect him to profile page
        When I input user credentials as example user
        And I click "submit button"
        And "modal window" will be visible
        And I click "modal window close button"
        Then "navigation greeting" should contain example user name
        And current location should equal "profile"
    
    Scenario: Success modal window should be visible after successful log in
        When I input user credentials as example user
        And I click "submit button"
        Then "modal window" should be visible
        And "modal window" attribute "class" should contain "success"

    Scenario: User should be able to log out after successful log in
        When When I input user credentials as example user
        And I click "submit button"
        And "modal window" will be visible
        And I click "modal window close button" #???

    Scenario Outline: Login form should indicate correct errors
        When I input user credentials using email "<email>" and password "<password>"
        And I click "submit button"
        Then "<errors>" should be visible

        Examples:
            | email | password | errors |
            |       |          |        |