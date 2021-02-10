@parallel=false
Feature: CRUD Employee Tests

  Background:
    * url BASE_URL

    @ignore
    Scenario Outline: Create, Read, Update, Delete (Expected Behaviour)

      # Create a new Employee Record
      * def createEmployee = call read('classpath:base/CreateEmployeeRecord.feature') {name: '<name>', salary: <salary>, age: <age>, status: 200}
      * match createEmployee.response.status == 'success'
      * match createEmployee.response.data.employee_name == '<name>'
      * match createEmployee.response.data.employee_salary == <salary>
      * match createEmployee.response.data.employee_age == <age>
      * match createEmployee.response.message == 'Successfully! Record has been added.'
      * def employeeId = createEmployee.response.data.id
      * print employeeId

      # Verify the Employee Record is available
      * def readEmployee = call read('classpath:base/GetSingleEmployeeData.feature') {id: '#(employeeId)', status: 200}
      * match readEmployee.response.status == 'success'
      * match readEmployee.response.data.id == employeeId
      * match readEmployee.response.data.employee_name == '<name>'
      * match readEmployee.response.data.employee_salary == <salary>
      * match readEmployee.response.data.employee_age == <age>
      * match readEmployee.response.message == 'Successfully! Record has been fetched.'

      # Update the Employee Record
      * def updateEmployee = call read('classpath:base/UpdateEmployeeRecord.feature') {id: '#(employeeId)', name: '<update_name>', salary: <update_salary>, age: <update_age>, status: 200}
      * match updateEmployee.response.status == 'success'
      * match updateEmployee.response.data.employee_name == '<update_name>'
      * match updateEmployee.response.data.employee_salary == <update_salary>
      * match updateEmployee.response.data.employee_age == <update_age>
      * match updateEmployee.response.message == 'Successfully! Record has been updated.'

      # Verify the Employee Record is updated
      * def readUpdatedEmployee = call read('classpath:base/GetSingleEmployeeData.feature') {id: '#(employeeId)', status: 200}
      * match readUpdatedEmployee.response.status == 'success'
      * match readUpdatedEmployee.response.data.id == employeeId
      * match readUpdatedEmployee.response.data.employee_name == '<update_name>'
      * match readUpdatedEmployee.response.data.employee_salary == <update_salary>
      * match readUpdatedEmployee.response.data.employee_age == <update_age>
      * match readUpdatedEmployee.response.message == 'Successfully! Record has been fetched.'

      # Delete Employee Record
      * def deleteEmployee = call read('classpath:base/DeleteEmployeeRecord.feature') {id: '#(employeeId)', status: 200}
      * match deleteEmployee.response.status == 'success'
      * match deleteEmployee.response.data == employeeId
      * match deleteEmployee.response.message == 'Successfully! Record has been deleted'

      #Verify Employee Record has been deleted
      * def checkEmployee = call read('classpath:base/GetSingleEmployeeData.feature') {id: '#(employeeId)', status: 200}
      * match checkEmployee.response.status == 'success'
      * match checkEmployee.response.data == null
      * match checkEmployee.response.message == 'Successfully! Record has been fetched.'

      Examples:
      |name|salary|age|update_name|update_salary|update_age|
      |Leslie Knope|500000|32 |Ron Swanson   |777888|38    |
      |Tim Wilde   |778880|34 |Jackie Nowator|88888 |44    |
      |George Tree |722332|38 |Harold Stop   |20000 |55    |


    Scenario Outline: Create, Read, Update, Delete (Observed Behaviour)

      # Create a new Employee Record
      * def createEmployee = call read('classpath:base/CreateEmployeeRecord.feature') {name: '<name>', salary: <salary>, age: <age>, status: 200}
      * match createEmployee.response.status == 'success'
      * match createEmployee.response.data.employee_name == '<name>'
      * match createEmployee.response.data.employee_salary == <salary>
      * match createEmployee.response.data.employee_age == <age>
      * match createEmployee.response.message == 'Successfully! Record has been added.'
      * def employeeId = createEmployee.response.data.id

      # Verify the Employee Record is available
      * def readEmployee = call read('classpath:base/GetSingleEmployeeData.feature') {id: '#(employeeId)' , status: 200}
      * match readEmployee.response.status == 'success'
      * match readEmployee.response.data == null
      * match readEmployee.response.message == 'Successfully! Record has been fetched.'

      # Update the Employee Record
      * def updateEmployee = call read('classpath:base/UpdateEmployeeRecord.feature') {id: '#(employeeId)', name: '<update_name>', salary: <update_salary>, age: <update_age>, status: 200}
      * match updateEmployee.response.status == 'success'
      * match updateEmployee.response.data.employee_name == '<update_name>'
      * match updateEmployee.response.data.employee_salary == <update_salary>
      * match updateEmployee.response.data.employee_age == <update_age>
      * match updateEmployee.response.message == 'Successfully! Record has been updated.'

        # Verify the Employee Record is updated
      * def readUpdatedEmployee = call read('classpath:base/GetSingleEmployeeData.feature') {id: '#(employeeId)' , status: 200}
      * match readUpdatedEmployee.response.status == 'success'
      * match readUpdatedEmployee.response.data == null
      * match readUpdatedEmployee.response.message == 'Successfully! Record has been fetched.'

      # Delete Employee Record
      * def deleteEmployee = call read('classpath:base/DeleteEmployeeRecord.feature') {id: '#(employeeId)', status: 200}
      * match deleteEmployee.response.status == 'success'
      * match deleteEmployee.response.data == employeeId
      * match deleteEmployee.response.message == 'Successfully! Record has been deleted'

      # Verify Employee Record has been deleted
      * def checkEmployee = call read('classpath:base/GetSingleEmployeeData.feature') {id: '#(employeeId)' , status: 200}
      * match checkEmployee.response.status == 'success'
      * match checkEmployee.response.data == null
      * match checkEmployee.response.message == 'Successfully! Record has been fetched.'

      Examples:
        |name|salary|age|update_name|update_salary|update_age|
        |John Smith|50000 |25 |Billy Ray|60000        |35    |
        |Donald Duck|10   |14 |Micky Mouse|14000000   |60    |
        |Ronald McDonald|123343|99|Hungry Jack|298289 |88    |
