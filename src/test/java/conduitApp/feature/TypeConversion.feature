@sanity
Feature: TypeConversion

    Scenario: Number to String
        * def speed = 40
        * match speed+'' == "40"

    Scenario: String to Number
        * def speed = "100"
        * print speed
        * match speed*1 == 100
        * match parseInt(speed) == 100
        * print ~~parseInt(speed)
        * print speed