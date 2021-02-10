Feature: Schema Validation

  Background:
    * url BASE_URL

    Scenario: Get All Employee Schema Validation

      * def employeeData = call read('classpath:base/GetAllEmployeeData.feature')
      * def arrayContent =
      """
        {
          "id": '#number',
          "employee_name": "#string",
          "employee_salary": '#number',
          "employee_age": '#number',
          "profile_image": "#string"
        }
      """
      * def responseContent =
      """
        {
            data: '#[] arrayContent',
            message: '#string',
            status: '#string'
        }
      """
      * match employeeData.response contains responseContent

    Scenario Outline: Get Single Employee Schema Validation

      * def singleEmployee = call read('classpath:base/GetSingleEmployeeData.feature') {id: <id>, status: 200}
      * def responseContent =
      """
        {
          "status": "#string",
          "data": {
              "id": '#number',
              "employee_name": "#string",
              "employee_salary": '#number',
              "employee_age": '#number',
              "profile_image": "#string"
          },
          "message": "#string"
        }
      """
      * match singleEmployee.response contains responseContent

      Examples:
      |id|
      |1 |
      |2 |
      |3 |

    Scenario Outline: Create Employee Schema Validation

      * def createEmployee = call read('classpath:base/CreateEmployeeRecord.feature') {name: '<name>', salary: <salary>, age: <age>, status: 200}
      * def responseContent =
      """
      {
        "status": "#string",
        "data": {
            "employee_name": "#string",
            "employee_salary": "#number",
            "employee_age": "#number",
            "id": '#number'
        },
        "message": "#string"
      }
      """
      * match createEmployee.response contains responseContent

      Examples:
        |name |salary|age|
        |John |50000 |25 |
        |Billy|23000 |30 |
        |Phil |20000 |40 |

    Scenario Outline: Update Employee Data Schema Validation

      * def updateEmployee = call read('classpath:base/UpdateEmployeeRecord.feature') {id: <id>, name: '<name>', salary: <salary>, age: <age>, status: 200}
      * def responseContent =
      """
        {
          "status": "#string",
          "data": {
              "employee_name": "#string",
              "employee_salary": "#number",
              "employee_age": "#number"
          },
          "message": "#string"
        }
      """
      * match updateEmployee.response contains responseContent

      Examples:
      |id|name        |salary|age|
      |21|Henry Cavill|100000|42 |
      |22|Rhonda Rhyme|250000|19 |
      |23|Dairy Mainly|90000 |33 |


    Scenario Outline: Delete Employee Schema Validation

      * def createEmployee = call read('classpath:base/CreateEmployeeRecord.feature') {name: '<name>', salary: <salary>, age: <age>, status: 200}
      * def employeeId = createEmployee.response.data.id
      * def deleteEmployee = call read('classpath:base/DeleteEmployeeRecord.feature') {id: employeeId, status: 200}
      * def responseContent =
      """
        {
            "status": "#string",
            "data": "#string",
            "message": "#string"
        }
      """
      * match deleteEmployee.response contains responseContent

      Examples:
      |name       |salary|age|
      |Donald Jump|450000|75 |
      |Tony Park  |100000|30 |
      |Johnny Mavo|324399|45 |
