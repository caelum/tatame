Feature: Suggest problems for randoris
  In order to suggest randoris
  As a registered user
  I want to be able to suggest/remove a suggestion of randoris with title and description

Scenario: Add a suggestion when there are no suggestions yet
  Given I am on the root page
  When I follow "Problems"
  And I fill in "title" with "Rubik's Cube"
  And I fill in "description" with "The famous problem"
  And I choose "randori"
  And I press "Add"
  Then I should see an empty kata list
  And I should see "Rubik's Cube"

Scenario: Add a suggestion when there is already a suggestion

Scenario: Remove a suggestion when there is only one suggestion

Scenario: Remove a suggestion when there are more suggestions

Scenario: Edit a suggestion
