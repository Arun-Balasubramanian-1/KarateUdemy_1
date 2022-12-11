@parallel=false
Feature: Articles CRUD

    Background: Define URL
        Given url apiUrl
        * def now = function(){ return java.lang.System.currentTimeMillis() }
        * def articlesRequestBody = read('classpath:helpers/json/articles.json')
        * def DataGenerator = Java.type('helpers.DataGenerator')
        * def newArticle = DataGenerator.getArticlesBody()
        * set articlesRequestBody.article.title = newArticle.title;
        * set articlesRequestBody.article.description = newArticle.description;
        * set articlesRequestBody.article.body = newArticle.body;
    
    Scenario: Create new Article
        Given path 'articles'
        And request articlesRequestBody
        When method Post
        Then status 200
        And print response
        And match response.article.title == newArticle.title
        And match response.article.description == newArticle.description
        And match response.article.body == newArticle.body

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
