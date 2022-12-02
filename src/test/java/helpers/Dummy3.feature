Feature: Dummy3

Scenario: Dummy3
    * def DataGenerator = Java.type('helpers.DataGenerator')
    * def name = DataGenerator.generateRandomUsername();
    * print 'Call before each scenario -> ' + name
