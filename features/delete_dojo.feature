Feature: Delete a dojo session
  In order avoid the world to see that i have miscreated dojo
  As an administrator
  I want be able to delete a dojo WITHOUT review

Scenario: Delete the only future dojo
  Given I am on the root page
  When I follow "delete"
  And I follow "OK"
	Then I should see "No scheduled dojos"


  
