@regression
Feature: Articles CRUD

    Background: Define URL
        Given url 'https://conduit.productionready.io/api/'
        * def now = function(){ return java.lang.System.currentTimeMillis() }
        * def tokenGeneration = callonce read('classpath:helpers/createToken.feature') {"email":"testuser@yopmail.com","password":"test"}
        * def token = tokenGeneration.authToken
    
    @debug
    Scenario: Create new Article
        Given header Authorization = "Token " + token
        Given path 'articles'
        * def articleTitle = "myarticle - " + now()
        And request {"article":{"tagList":["test"],"title": #(articleTitle),"description":"nothing","body":"Hello"}}
        When method Post
        Then status 200
        Then match response.article.title == articleTitle

    @debug
    Scenario: Create and Delete Article
        Given header Authorization = "Token " + token
        Given path 'articles'
        * def articleTitle = "myarticle - " + now()
        And request {"article":{"tagList":["test"],"title": #(articleTitle),"description":"nothing","body":"Hello"}}
        When method Post
        Then status 200
        * def slug = response.article.slug

        Given path 'articles', slug
        When method Get
        Then status 200
        
        Given header Authorization = "Token " + token
        Given path 'articles', slug
        When method Delete
        Then status 204

        Given path 'articles', slug
        When method Get
        Then status 404
