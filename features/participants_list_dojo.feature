Feature: Participants list for next dojo session
  In order to know how many people will come
  As an administrator
  I want to have a list where people can mark whether they come or not, without registration
  
Scenario: Add two names
	Given there are 1 dojos scheduled starting in 1 days
	And I am on the root page
	When I fill in "name" with "Caue"
	And I press "Add"
	And I fill in "name" with "Pedro"
	And I press "Add"
	Then I should see "Caue"
	And I should see "Pedro"

Scenario: Add with no name
  Given there are 1 dojos scheduled starting in 1 days
	And I am on the root page
	And I press "Add"
  And I should see an empty presence list

	Scenario: Add with no dojo_id
	  Given there are 1 dojos scheduled starting in 1 days
		And I am on the root page
		And I create a participant with no dojo_id
	  And I should see an empty presence list

Scenario: Remove a name
  Given there are 1 dojos scheduled starting in 1 days
	And I am on the root page
	And I fill in "name" with "Caue"
	And I press "Add"
  When I follow "remove_Caue"
  Then I should not see "Caue"