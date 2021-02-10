# LEAPDevAutoExercise

This is a karate automation framework for API automation. 

This framework has been selected for its efficiency and sophistication without being overly complex. 
The advantages of this framework include: 
- Parallel execution of test cases - this will run test cases in parallel unless specified otherwise in order to save time in execution. 
- Basic programming skills required to add to the framework and to understand it.
- Integrates easily with Java and JS to add extra functions which are not native to the framework.
- Powerful and straightforward assertion capabilities. Easy to include in any test. 

This framework uses Maven to run in the command line. This can be done using the follow commands:
- To run the test file for test execution -> mvn test -Dtest=TestRunner 
- To clean the results from the project -> mvn clean

The only file which needs to be run is the TestRunner using the above command line function. This will execute all the test cases in parallel. 

The results can be read from a html report build into the karate framework. These can be found target/surefire-reports/src.test.apiTest.TestRunner.html

NOTE: I have included Schema Validation in the SchemaValidation.feature separate from the other tests. This has been done intentionally in order to test separately and therefore is not dependant on the other test passing to get the results. The base folder contains the api calls in one place so they will not need to be updated in multiple places in the future if they do change. These feature files are called upon when they need to used and are read directly. This creates a simplistic and easy to understand framework. 

Secondly, as a disclaimer the apis which have been used in this exercise have a habit of reaching a 429 Response meaning too many requests. A retry function has been used to retry the api call at most 10 times in 2 second interval if this response is given. Unfortunately in some tests this could not be enough. 
