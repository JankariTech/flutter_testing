Feature: Counter
  The counter should be incremented when the button is pressed.

  Scenario: Counter increases when the button is pressed
    When I tap the "increment" button 10 times
    Then I expect the "counter" to be "10"

  Scenario: Counter decreases when the delete button is pressed
    When I tap the "increment" button 5 times
    And I decrement the counter 2 times
    Then I expect the "counter" to be "3"

  Scenario: Counter at the start of the app
    When I restart the app
    Then I expect the "counter" to be "0"
    Then I'm happy