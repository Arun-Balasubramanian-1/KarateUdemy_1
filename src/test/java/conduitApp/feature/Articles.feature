Feature: Articles CRUD

    Background: Define URL
        Given url 'https://conduit.productionready.io/api/'
        * def now = function(){ return java.lang.System.currentTimeMillis() }
        Given path "users/login"
        And request {"user":{"email":"testuser@yopmail.com","password":"test"}}
        When method Post
        Then status 200
        * def token = response.user.token
    
    @ignore
    Scenario: Create new Article
        Given header Authorization = "Token " + token
        Given path 'articles'
        * def articleTitle = "myarticle - " + now()
        And request {"article":{"tagList":["test"],"title": #(articleTitle),"description":"nothing","body":"Hello"}}
        When method Post
        Then status 200
        Then match response.article.title == articleTitle
