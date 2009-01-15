Feature: Delete a dojo session
  In order avoid the world to see that i have miscreated dojo
  As an administrator
  I want be able to delete a dojo WITHOUT review

Scenario: Delete the only future dojo
  Given there are 1 dojos scheduled starting in 0 days
	And I am on the root page
  When I follow "delete"
	Then I should see "No scheduled dojos"

Scenario: Delete the next dojo when I have more than one dojo
  Given there are 2 dojos scheduled starting in 0 days
  And I am on the root page
	When I follow "delete"
  Then the next dojo should be in 1 days

