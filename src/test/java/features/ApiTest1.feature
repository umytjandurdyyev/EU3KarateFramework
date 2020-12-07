Feature: exchange rate api tests

  Scenario: basic test with status code validation
    Given url 'https://api.exchangeratesapi.io/latest'
    When method GET
    Then status 200

  Scenario: get rates for specific day
    Given url 'https://api.exchangeratesapi.io/2010-01-12'
    When  method get
    Then status 200

  Scenario: header verification
    Given url 'https://api.exchangeratesapi.io/2010-01-12'
    When  method get
    Then status 200
    And match header Content-Type == 'application/json'
    And match header Cache-Control == 'max-age=1800'
    # to verify headers we use header keyword then header name without double or single code
    # and == 'header value'
    And match header Date == '#present'


  Scenario: json body verification
    Given url 'https://api.exchangeratesapi.io/2010-01-12'
    When  method get
    Then status 200
    And match header Content-Type == 'application/json'
    #verify base is EUR
    And match response.base == 'EUR'
    And print response.base
    And match response.rates.USD == '#present'
    And print response.rates.USD
    

