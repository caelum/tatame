Feature: Delete a dojo session
  In order hide dojos that will not happen anymore or that were mistakenly created
  As an editor
  I want be able to delete a dojo WITHOUT review

  Scenario: Delete the only future dojo
    Given I am logged in
    And there are 1 dojos scheduled starting in 1 days
    And I am on the root page
    When I follow "delete_next"
    Then I should see "No scheduled dojos"
    And I should see "Successfully deleted"

  Scenario: Delete the next dojo when I have more than one dojo
    Given I am logged in
    And there are 2 dojos scheduled starting in 1 days
    And I am on the root page
    When I follow "delete_next"
    Then the next dojo should be in 2 days
    And I should see an empty presence list
    And I should see "Successfully deleted"

  Scenario: Delete a scheduled dojo when I have more than one dojo
    Given I am logged in
    And there are 2 dojos scheduled starting in 1 days
    And I am on the root page
    When I follow "delete_1st"
    Then the next dojo should be in 1 days
    And I should see "Successfully deleted"

  Scenario: Delete a dojo with participants when authenticated
    Given I am logged in
    And there are 1 dojos scheduled starting in 1 days
    And I am on the root page
    And I fill in "participant_name" with "Caue"
    And I press "add_participant"
    When I follow "delete_next"
    Then I should see "No scheduled dojos"
    And I should not see "Caue"

  Scenario: Delete a past dojo
    Given I am logged in
    And there are 1 past dojos
    And I am on the root page
    When I follow "delete_past_1st"
    Then I should not see "delete_past_1st"

  Scenario: Can't delete dojo with review being logged in
    Given I am logged in
    And there are 1 past dojos
    And the dojo 1 days past has a retrospective
    And I am on the root page
    When I follow "delete_past_1st"
    Then I should see "delete_past_1st"
    And I should see "You cannot delete a dojo with a non-empty retrospective"

  Scenario: Can't see the dojo deletion link for future dojos if not logged in
    Given I am not logged in
    And there are 2 dojos scheduled starting in 1 days
    And I am on the root page
    Then I should not see "delete_next"
    Then I should not see "delete_1st"
 
   Scenario: Can't see the dojo deletion link for past dojos if not logged in
    Given I am not logged in
    And there are 2 past dojos scheduled
    And I am on the root page
    Then I should not see "delete_past_1st"
