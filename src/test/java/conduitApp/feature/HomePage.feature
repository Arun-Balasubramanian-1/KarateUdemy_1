@regression
Feature: Conduit Test - GET Tags and Articles

    Background: Define URL
        Given url apiUrl

    Scenario: GET all Tags
        Given path 'tags'
        When method Get
        Then status 200
        And match response.tags == "#array"
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
        And match response.articlesCount == 163
        