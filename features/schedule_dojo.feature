Feature: Schedule a dojo session
  In order to inform participants when will be the next session
  As an administrator
  I want to be able to create a session
 	And choose an hour
	And choose a date

Scenario: Create first dojo
  Given I am on the new dojo page
  When I select tomorrow as the date
  And I select "22:00" as the "time" time
  And I press "Create"
	Then the next dojo date should be tomorrow
	And the next dojo time should be "22:00"
  And I should see an empty presence list

Scenario: Create next dojos
  Given I am on the new dojo page
	And there is a dojo scheduled for tomorrow
  When I select day after tomorrow as the date
  And I select "22:00" as the "time" time
  And I press "Create"
	Then the next dojo date should be tomorrow
  And I should see a dojo scheduled to the day after tomorrow
