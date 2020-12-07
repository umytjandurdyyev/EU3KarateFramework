Feature: welcome to karate
  
  Scenario: how to print
    Given print "Hello Wolrd"
    When print 'another print'
    Then print 'then print'
    
    
  Scenario: more printing
    Given print 'some more words to print'
    * print 'My name is','Karate Kid'
    # , --> concat two String +1 white space
    * print 2+2
    

  Scenario: variables
    * def randomName = 'Mike'
    * print 'my name is ' + randomName
    * def age = 20
    * print randomName,'is',age,'year old'


  Scenario: difficult parameters : json object
    * def student = {'name':'sam','owes_tuition':'false'}
    * print student
    * print student.name
    * print student.owes_tuition



  Scenario: json object 2
    * def student =
    """
    {"firstName":"Steven",
    "lastName":"King",
    "salary":"2099"
    }
    """
    * print student.salary
    * print student.firstName
    * print student.lastName


    Scenario: Spartan Variable
      * def spartan =
      """
      {
    "id": 10,
    "name": "Lorenza",
    "gender": "Female",
    "phone": 3312820936
}
      """
      * print spartan

  Scenario: json array object
    * def student =
      """
      [
      {'name':'sam',
      'owes_tuition':'false'},
      {'name':'mike',
      'owes_tuition':'true'}
      ]
      """
    * print student
    * print student[1].name
    * print student[0].owes_tuition