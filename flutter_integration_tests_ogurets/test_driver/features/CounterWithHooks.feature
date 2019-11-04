Feature: Demo counter with a hook

  @set_counter_to_1
  Scenario: Use hook to set counter to 1 and then increase to 10
    Given I expect the counter to be "1"
    When I tap the plus button 10 times
    Then I expect the counter to be "11"

