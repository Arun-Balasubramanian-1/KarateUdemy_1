@regression
Feature: Conduit Test - GET Tags and Articles

    Background: Define URL
        Given url apiUrl

    @ignore
    Scenario: GET all Tags
        Given path 'tags'
        When method Get
        Then status 200
        And match response.tags == "#array"

        And match response.tags contains "welcome"
        #And match response.tags contains "thank you"

        And match response.tags !contains "arun"
        #And match response.tags !contains "introduction"

        And match response.tags contains ["welcome", "introduction"]
        #And match response.tags contains ["welcome", "arun"]

        And match response.tags contains any ["arun", "welcome"]
        #And match response.tags contains any ["arun", "qa"]

        #And match response.tags contains only ["welcome", "introduction"]

        And match each response.tags == "#string"
        And match response.tags contains "welcome"
        And match response.tags contains ["welcome", "introduction"]

    @sanity
    Scenario: GET 10 articles
        Given path 'articles'
        Given params { limit: 10, offset: 0}
        When method Get
        Then status 200
        And match response.articles == "#[10]"
        And print response

        And match response.articlesCount == 215
        #And match response.articlesCount == 300

        And match response.articlesCount != 500
        #And match response.articlesCount != 215

        And match response == { "articles": "#array", "articlesCount": "#number"}
        #And match response == { "articles": "#array", "articlesCount": "#string"}

        And match response.articles[0].createdAt contains "2022"
        #And match response.articles[0].createdAt contains "1997"

        And match response.articles[*].favoritesCount contains 0
        #And match response.articles[*].favoritesCount contains 10

        And match response..bio contains null
        #And match response..bio contains "SDET"

        And match each response..username == 'testuserkarate'
        #And match each response..username == 'arun'

        And match each response..username == "#string"
        And match each response..bio == "##string"
        
        