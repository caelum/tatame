Feature: Schedule a dojo session
  In order to inform participants when will be the next session
  As an administrator
  I want to be able to create a session
 	And choose an hour
	And choose a date

Scenario: Create presence list
  Given I am on the new dojo page
	When I fill in "Title" with "My dojo"
  And I select "10/01/2008" as the "date" date
  And I select "22:00" as the "time" time
  And I press "Create"
	Then "My dojo" should be the next dojo
  And I should see an empty presence list
