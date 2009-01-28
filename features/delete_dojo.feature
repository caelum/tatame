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

Scenario: Can't delete the next dojo when not authenticated
  Given I am not logged in
  And there are 1 dojos scheduled starting in 1 days
  And I am on the root page
  When I follow "delete_next"
  Then I should see "delete_next"
  And I should see "You must be logged in to do this"

Scenario: Can't delete a dojo when not authenticated
  Given I am not logged in
  And there are 2 dojos scheduled starting in 1 days
  And I am on the root page
  When I follow "delete_1st"
  Then I should see "delete_next"
  And I should see "delete_1st"
  And I should see "You must be logged in to do this"


Scenario: Delete a past dojo

