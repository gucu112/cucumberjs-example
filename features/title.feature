Feature: Title functionality
    Background:
        Given base url

    Scenario: Google page
        When redirect to "http://www.google.pl/"
        Then title equals "Google"
    
    Scenario: Sadistic page
        When redirect to "http://www.sadistic.pl/"
        Then title contains "Sadistic"
    
    