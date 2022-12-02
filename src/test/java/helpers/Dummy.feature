Feature: Dummy

    Scenario: Dummy
        * def DataGenerator = Java.type('helpers.DataGenerator')
        * def name = DataGenerator.generateRandomUsername();