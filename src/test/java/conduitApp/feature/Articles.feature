@regression
Feature: Articles CRUD

    Background: Define URL
        Given url apiUrl
        * def now = function(){ return java.lang.System.currentTimeMillis() }
    
    Scenario: Create new Article
        Given path 'articles'
        * def articleTitle = "myarticle - " + now()
        And request {"article":{"tagList":["test"],"title": #(articleTitle),"description":"nothing","body":"Hello"}}
        When method Post
        Then status 200
        Then match response.article.title == articleTitle

    @debug
    Scenario: Create and Delete Article
        Given path 'articles'
        * def articleTitle = "myarticle - " + now()
        And request {"article":{"tagList":["test"],"title": #(articleTitle),"description":"nothing","body":"Hello"}}
        When method Post
        Then status 200
        * def slug = response.article.slug

        Given path 'articles', slug
        When method Get
        Then status 200
        
        Given path 'articles', slug
        When method Delete
        Then status 204

        Given path 'articles', slug
        When method Get
        Then status 404
