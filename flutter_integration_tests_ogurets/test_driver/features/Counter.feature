Feature: Counter
  The counter should be incremented when the button is pressed.

  Scenario Outline: Counter increases when the button is pressed
    Given I expect the "counter" to be "0"
    When I tap the "increment" button 10 times
    Then I expect the "counter" to be "<expected>"

    Examples:
    |expected|
    | 10     |
    | 5      |