In order to oblige people to confirm presence some time before the dojo starts
As a dojo administrator
I want to block the participants list some time before the dojo starts

  Scenario: Schedule a dojo with the list blocking 1 day before
    Given I am on the root page
    And I am logged in
    When I follow "New"
    And I select 2 days from now as the date and time for "Date"
    And I select 1 days from now as the date and time for "Block List Date"
    And I press "Create"
    Then the next dojo should be in 2 days
    And I should see an empty presence list
    And I should see a box to put my name
    And I should see "Successfully created"
