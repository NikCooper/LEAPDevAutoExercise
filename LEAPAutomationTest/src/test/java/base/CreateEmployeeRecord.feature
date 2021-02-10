@ignore
Feature: Create New Employee Record

  Background:
    * url BASE_URL

    Scenario: Create New Employee Record
      * def name = __arg.name
      * def salary = __arg.salary
      * def age = __arg.age
      * def status = __arg.status

      Given path 'create'
      * json jsonBody = read('classpath:jsonTemplates/employee_record.json')
      * set jsonBody.employee_name = name
      * set jsonBody.employee_salary = salary
      * set jsonBody.employee_age = age
      And request jsonBody
      And retry until responseStatus == status
      When method post
      Then assert responseStatus == status