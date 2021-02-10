@ignore
Feature: Get All Employee Data

  Background:
    * url BASE_URL

    Scenario: Get All Employee Data

      Given path 'employees'
      And retry until responseStatus == 200
      When method get
      Then status 200