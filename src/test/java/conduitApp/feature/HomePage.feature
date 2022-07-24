Feature: Conduit Test - GET Tags and Articles

    Scenario: GET all Tags
        Given url 'https://conduit.productionready.io/api/tags'
        When method Get
        Then status 200

    Scenario: GET 10 articles - 1st approach - params in Url
        Given url 'https://conduit.productionready.io/api/articles?limit=10&offset=0'
        When method Get
        Then status 200

    Scenario: GET 10 articles - 2nd approach - separate params with param keyword
        Given url 'https://conduit.productionready.io/api/articles'
        Given param limit = 10
        Given param offset = 0
        When method Get
        Then status 200

    Scenario: GET 10 articles - 3rd approach - separate params with params keyword
        Given url 'https://conduit.productionready.io/api/articles'
        Given params { limit: 10, offset: 0}
        When method Get
        Then status 200