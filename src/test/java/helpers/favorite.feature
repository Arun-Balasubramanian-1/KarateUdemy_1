Feature: Favorite an article

    Background:
        Given url apiUrl

    Scenario: Favorite an article
        Given path 'articles', article.slug, 'favorite'
        And request {}
        And method Post
        Then status 200
        * def resultFavoriteCount = response.article.favoritesCount


