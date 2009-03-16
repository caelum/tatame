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

  Scenario: Cannot remove participants from list when it's blocked
    Given I am logged in
    Given there are 1 dojos scheduled starting in 1 days
    And the participant "Luiz" has confirmed his/her presence to the next Dojo
    And the participant list is blocked
    And I am on the root page
    Then I should see "Luiz"
    And I should not see "remove_Luiz"
