Feature: Token Generation
    
    Scenario: Create Token
        Given url 'https://conduit.productionready.io/api/'
        Given path "users/login"
        And request {"user":{"email":"testuser@yopmail.com","password":"test"}}
        When method Post
        Then status 200
        * def authToken = response.user.token
