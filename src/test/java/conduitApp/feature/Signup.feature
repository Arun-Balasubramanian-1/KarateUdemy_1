Feature: Signup

    Background:
        Given url apiUrl
        * def now = function(){ return java.lang.System.currentTimeMillis() }
        * def dataGenerator = Java.type('helpers.DataGenerator')
        * def randomUsername = dataGenerator.generateRandomUsername();
        * def randomEmail = dataGenerator.generateRandomEmail();

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

    Scenario: Signup new user with faker data
        Given path 'users'
        And request
        """
            {
                "user": {
                    "email": #(randomEmail),
                    "username": #(randomUsername),
                    "password": #(userPassword)
                }
            }
        """
        When method Post
        Then status 200
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
    
    @sanity
    Scenario Outline:  Sign up data driven testing
        * def max_string = dataGenerator.getAlphaNumericString(1000);
        * def min_string = dataGenerator.getAlphaNumericString(3);
        Given path 'users'
        And request
        """
            {
                "user": {
                    "email": "<email>",
                    "username": "<username>",
                    "password": #(userPassword)
                }
            }
        """
        When method Post
        Then status 422
        And match response == <errorResponse>

        Examples:
        |       username        |          email        |                       errorResponse                           |
        |     #(userName)       |     #(randomEmail)    |       {"errors":{"username":["has already been taken"]}}      |
        |   #(randomUsername)   |     #(userEmail)      |       {"errors":{"email":["has already been taken"]}}         |
        |                       |     #(randomEmail)    |       {"errors":{"username":["can't be blank"]}}              |
        |   #(randomUsername)   |                       |       {"errors":{"email":["can't be blank"]}}                 |
