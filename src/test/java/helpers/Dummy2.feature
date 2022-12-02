Feature: Dummy2

Scenario: Dummy2
    * def DataGenerator = Java.type('helpers.DataGenerator')
    * def name = DataGenerator.generateRandomUsername();
    * print 'Call once before all feature -> ' + name
