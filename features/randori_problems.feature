Feature: Suggest problems for randoris
  In order to suggest randoris
  As a registered user
  I want to be able to suggest/remove a suggestion of randoris with title and description

Scenario: Add a suggestion when there are no suggestions yet
  Given I am on the root page
  When I follow "Randoris"
  And I follow "New"
  And I fill in "title" with "Rubik's Cube"
  And I fill in "description" with "The famous problem"
  And I press "Add"
  Then I should see "Rubik's Cube"

Scenario: Add a suggestion when there is already a suggestion
  Given I am on the root page
  And there is a randori suggested with title "Rubik's Cube"
  When I follow "Randoris"
  And I follow "New"
  And I fill in "title" with "Maze"
  And I fill in "description" with "Another famous problem"
  And I press "Add"
  Then I should see "Rubik's Cube"
  And I should see "Maze"

Scenario: Remove a suggestion when there is only one suggestion
  Given there is a randori suggested with title "Rubik's Cube"
  And I am on the randoris page
  When I follow "delete_1st"
  Then I should not see "Rubik's Cube"
  And I should see "No suggested randoris."

Scenario: Remove a suggestion when there are more suggestions
  Given there is a randori suggested with title "Rubik's Cube"
  And there is a randori suggested with title "Large Prime Factorization"
  And I am on the randoris page
  When I follow "delete_2nd"
  Then I should not see "Large Prime Factorization"
  And I should see "Rubik's Cube"

Scenario: Edit a suggestion
  Given there is a randori suggested with title "Rubik's Cube"
  And there is a randori suggested with title "Large Prime Factorization"
  And I am on the randoris page
  When I follow "edit_1st"
  And I fill in "title" with "Magic Cube"
  And I press "Save"
  Then I should see "Magic Cube"
  And I should see "Large Prime Factorization"
  And I should not see "Rubik's Cube"

Scenario: Show a suggestion with details
