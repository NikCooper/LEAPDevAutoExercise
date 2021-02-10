@ignore
Feature: Get a Single Employees Data

  Background:
    * url BASE_URL

    Scenario: Get Single Employee Data
      * def id = __arg.id
      * def status = __arg.status

      Given path 'employee', id
      And retry until responseStatus == status
      When method get
      Then assert responseStatus == status
