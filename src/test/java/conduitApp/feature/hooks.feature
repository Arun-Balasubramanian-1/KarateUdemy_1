@sanity
Feature: Hooks testing

    Background:
        * def dummy = callonce read('classpath:helpers/Dummy.feature')
        * print dummy.name

    Scenario: First scenario
        * print 'hi from first scenario'

    Scenario: Second Scenario
        * print 'hi from second scenario'