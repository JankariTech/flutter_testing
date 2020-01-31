Feature: welcome screen

  As a user
  I want to use the app
  So that I can learn python

  As a user
  I want to login
  So that I can record my learning progress

  Scenario: welcome screen when user is logged out
    Given the user has logged out
    When the user starts the app
    Then the user should see programiz logo
    And the user should see welcome artwork
    And the user should see get started button

  Scenario: welcome screen when user is logged in
    Given the user has logged in
    When the user starts the app
    Then the user should see these tabs:
      | home     |
      | examples |
      | compiler |
      | saved    |