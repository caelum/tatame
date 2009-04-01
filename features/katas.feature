Feature: Prepared katas
  In order to people to know someone has prepared a kata
  As a registered user
  I want to be able to add/remove a prepared kata with title, language and description

  Scenario: Add a kata when there are no katas yet
    Given I am on the root page
    And I am logged in 
    When I follow "Katas"
    And I follow "New"
    And I fill in "title" with "Rubik's Cube"
    And I fill in "description" with "The famous problem"
    And I fill in "language" with "Haskell"
    And I press "Add"
    Then I should see the kata "Rubik's Cube" by "me" in "Haskell"

  Scenario: Add a kata when there is already a kata
    Given I am on the root page
    And I am logged in 
    And there is a kata created by "me@myself.com" with title "Large Prime Factorization" in the language "LISP"
    When I follow "Katas"
    And I follow "New"
    And I fill in "title" with "Rubik's Cube"
    And I fill in "description" with "The famous problem"
    And I fill in "language" with "Haskell"
    And I press "Add"
    Then I should see the kata "Rubik's Cube" by "me" in "Haskell"
    And I should see the kata "Large Prime Factorization" by "me@myself.com" in "LISP"

  Scenario: Remove a kata when there is only one kata

  Scenario: Remove a kata when there are more katas

  Scenario: Edit a kata

  Scenario: Create a kata without title

  Scenario: Create a kata without language

  Scenario: Remove the title of an existing kata

  Scenario: Try to add a prepared kata not being logged in

  Scenario: Try to delete a kata not being logged in
  
  Scenario: Try to edit a kata not being logged in
