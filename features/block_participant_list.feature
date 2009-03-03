In order to oblige people to confirm presence some time before the dojo starts
As a dojo administrator
I want to block the participants list some time before the dojo starts

  Scenario: Schedule a dojo with the list blocking 1 day before
    Given I am logged in
    And I am on the new dojo page
    When I select 2 days from now as the date and time for "Date"
    And I select 1 days from now as the date and time for "Block List Date"
    And I press "Create"
    Then the next dojo should be in 2 days
    And I should see an empty presence list
    And I should see a box to put my name
    And I should see "Successfully created"

  Scenario: Schedule a dojo with the list already blocked
    Given I am logged in
    And I am on the new dojo page
    When I select 1 days from now as the date and time for "Date"
    And I select -1 days from now as the date and time for "Block List Date"
    And I press "Create"
    Then the next dojo should be in 1 days
    And I should see an empty presence list
    And I should not see a box to put my name
    And I should see "Successfully created"
    And I should see "The participant list for the next Dojo is blocked"
