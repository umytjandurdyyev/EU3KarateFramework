Feature: Karate Java Integration

  Background:
    * def spartanUrl = 'http://54.88.69.77:8000'

  @wip
    Scenario: Get a spartan with request header
      Given url spartanUrl
    And path 'api/spartans'
    And header Accept = 'application/json'
    When method get
    Then status 200


    Scenario: Create a new Spartan
