Feature: Delete a dojo session
  In order avoid the world to see that i have miscreated dojo
  As an administrator
  I want be able to delete a dojo WITHOUT review

Scenario: Delete the only future dojo
  Given there are 1 dojos scheduled starting in 0 days
	And I am on the root page
  When I follow "delete_next"
	Then I should see "No scheduled dojos"

Scenario: Delete the next dojo when I have more than one dojo
  Given there are 2 dojos scheduled starting in 0 days
  And I am on the root page
	When I follow "delete_next"
  Then the next dojo should be in 1 days
	And I should see an empty presence list

Scenario: Delete a scheduled dojo when I have more than one dojo
  Given there are 2 dojos scheduled starting in 0 days
	And I am on the root page
  When I follow "delete_1st"
  Then the next dojo should be in 0 days

Scenario: Delete a past dojo