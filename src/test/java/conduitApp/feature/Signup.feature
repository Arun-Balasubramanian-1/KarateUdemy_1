@ignore
Feature: Signup

    Background:
        Given url apiUrl
        * def now = function(){ return java.lang.System.currentTimeMillis() }

    Scenario: Signup new user
        Given path 'users'
        And def userName = `hello${now()}`
        And def userEmail = `hello${now()}@yopmail.com`
        And request
        """
            {
                "user": {
                    "email": #(userEmail),
                    "username": #(userName),
                    "password": #(userPassword)
                }
            }
        """
        When method Post
        Then status 200