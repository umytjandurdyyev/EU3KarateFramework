Feature: Parameters examples
  Background:
    * def baseUrl = 'https://api.exchangeratesapi.io'
    * def spartanUrl = 'http://54.88.69.77:8000'
    * def hrUrl = 'http://54.88.69.77:1000/ords/hr'

  Scenario: path parameters
    Given url baseUrl
    And path 'latest'
    When method GET
    Then status 200

  Scenario: path parameters
    Given url baseUrl
    And path '2010-01-12'
    When method GET
    Then status 200
  
  Scenario: get all spartans with path
    Given url spartanUrl
    And path 'api/spartans'
    When method get
    Then status 200
    And print response

  Scenario: get one spartans with path
    Given url spartanUrl
    And path 'api/spartans'
    And path '10'
    When method get
    Then status 200
    And print response
    And match response == {"gender": "Female", "phone": 3312820936, "name": "Lorenza", "id": 10}

  Scenario: get one spartans with path
    * def expectedSpartan =
  """
    {"gender": "Female", "phone": 3312820936, "name": "Lorenza", "id": 10}
    """
    Given url spartanUrl
    And path 'api/spartans'
    And path '10'
    When method get
    Then status 200
    And print response
    And match response == expectedSpartan

  Scenario: query parameters
    Given url spartanUrl
    And path 'api/spartans/search'
    And param nameContains = 'J'
    And param gender = 'Female'
    When method get
    Then status 200
    And match header Content-Type == 'application/json'
    And print response
    And match response.pageable.pageNumber == 0
    # verify each content has gender = Female
    And match each response.content contains {"gender":"Female"}
    # second way
    And match each response.content[*].gender == 'Female'
    And match response.content[0].name == 'Jaimie'
    And match each response.content[*].phone == '#number'


  Scenario: hr regions example
    Given url hrUrl
    And path 'regions'
    When method get
    Then status 200
    And print response
    And match response.limit == 25
    And print karate.jsonPath(response,"$..region_id")
