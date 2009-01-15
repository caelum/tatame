Feature: Schedule a dojo session
  In order to inform participants when will be the next session
  As an administrator
  I want to be able to create a session
 	And choose an hour
	And choose a date

Scenario: Create first dojo
  Given I am on the root page
  When I follow "New"
	And I select the "date" 1 days from now
	And I fill in "comment" with "A comment"
  And I press "Create"
	Then the next dojo should be in 1 days
	And the next dojo comment should be "A comment"
  And I should see an empty presence list

Scenario: Create next dojos
  Given I am on the new dojo page
	And there are 1 dojos scheduled starting in 1 days
  When I select the "date" 2 days from now
  And I press "Create"
	Then the next dojo should be in 1 days
  And I should see a dojo in 2 days inside the schedule tag

Scenario: No dojo created
  Given There is no scheduled dojo
  When I am on the root page
  Then I should see "No scheduled dojos"

Scenario: Create dojo before today
