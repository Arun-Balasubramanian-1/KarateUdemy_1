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

    @sanity
    Scenario: Signup new user with faker data
        * def dataGenerator = Java.type('helpers.DataGenerator')
        Given path 'users'
        And def userName = dataGenerator.generateRandomUsername();
        And def userEmail = dataGenerator.generateRandomEmail();
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
        And print response
        And match response == 
        """
            {
                "user": {
                    "email": "#string",
                    "username": "#string",
                    "bio": null,
                    "image": "#string",
                    "token": "#string",
                }
            }
        """