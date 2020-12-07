Feature: Karate Java Integration

  Background:
    * def spartanUrl = 'http://54.88.69.77:8000'

    Scenario: Get a spartan with request header
      Given url spartanUrl
      And path 'api/spartans'
      And header Accept = 'application/json'
      When method get
      Then status 200


  Scenario: Create a new Spartan
      Given  url spartanUrl
      And path "api/spartans"
      And header Accept = 'application/json'
      And header Content-Type = 'application/json'
      And request
    """
    {
        "gender": "Female",
         "name": "Lorenza",
         "phone": 3123781237
    }
    """
      When method POST
      Then status 201
      And print response

  @wip
  Scenario: reading java methods
     #point the class that we want to run
     #Java.type --> used to connect to java class
    * def SDG = Java.type('utilities.SpartanDataGenerator')
    * def newSpartan = SDG.createSpartan()
     #run the static method in that class and capture the result
     #the return map object is represented as a json
    * print newSpartan

