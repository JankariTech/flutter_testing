Feature: Start

  Scenario: Counter at the start of the app
    When I restart the app
    Then I expect the "counter" to be "0"