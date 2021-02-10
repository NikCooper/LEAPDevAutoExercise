@ignore
Feature: Delete Employee Record

  Background:
    * url BASE_URL

    Scenario: Delete Employee Record
      * def id = __arg.id
      * def status = __arg.status

      Given path 'delete', id
      And retry until responseStatus == status
      When method delete
      Then assert responseStatus == status