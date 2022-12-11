
Feature: Hooks testing

    Background:
        # * def dummy = callonce read('classpath:helpers/Dummy.feature')
        # * print dummy.name

        * configure afterScenario = function() { karate.call('classpath:helpers/Dummy.feature'); }
        * configure afterFeature = 
        """
            function() {
                karate.log('end............');
            }
        """
    Scenario: First scenario
        * print 'hi from first scenario'

    Scenario: Second Scenario
        * print 'hi from second scenario'