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
    Given I am logged in
    And there is a kata created by "me" with title "Rubik's Cube" in the language "Haskell"
    And I am on the katas page
    When I follow "delete_1st"
    Then I should see "No prepared katas"

  Scenario: Remove a kata when there are more katas
    Given I am logged in
    And there is a kata created by "me" with title "Rubik's Cube" in the language "Haskell"
    And there is a kata created by "me@myself.com" with title "Large Prime Factorization" in the language "LISP"
    And I am on the katas page
    When I follow "delete_2nd"
    Then I should see "Rubik's Cube"
    And I should not see "Large Prime Factorization"

  Scenario: Edit a kata created by me
    Given I am logged in
    And there is a kata created by "me" with title "Rubik's Cube" in the language "Haskell"
    And I am on the katas page
    When I follow "edit_1st"
    And I fill in "language" with "Prolog"
    And I press "Save"
    Then I should see the kata "Rubik's Cube" by "me" in "Prolog"
    And I should not see "Haskell"

  Scenario: Create a kata without title
    Given I am logged in 
    And I am on the katas page
    When I follow "New"
    And I fill in "description" with "The famous problem"
    And I fill in "language" with "Haskell"
    And I press "Add"
    Then I should see "Title can't be blank"

  Scenario: Create a kata without language
    Given I am logged in 
    And I am on the katas page
    When I follow "New"
    And I fill in "title" with "Rubik's Cube"
    And I fill in "description" with "The famous problem"
    And I press "Add"
    Then I should see "Language can't be blank"

  Scenario: Remove the title of an existing kata
    Given I am logged in
    And there is a kata created by "me" with title "Rubik's Cube" in the language "Haskell"
    And I am on the katas page
    When I follow "edit_1st"
    And I fill in "title" with ""
    And I press "Save"
    Then I should see "Title can't be blank"

  Scenario: Remove the language of an existing kata
    Given I am logged in
    And there is a kata created by "me" with title "Rubik's Cube" in the language "Haskell"
    And I am on the katas page
    When I follow "edit_1st"
    And I fill in "language" with ""
    And I press "Save"
    Then I should see "Language can't be blank"

  Scenario: Try to add a prepared kata not being logged in
    Given I am not logged in
    And I am on the katas page
    When I follow "New"
    Then I should see "You must be logged in to do this"

  Scenario: Try to delete a kata not being logged in
    Given I am not logged in
    And there is a kata created by "me@myself.com" with title "Rubik's Cube" in the language "Haskell"
    And I am on the katas page
    When I follow "delete_1st"
    Then I should see "You must be logged in to do this"
  
  Scenario: Try to edit a kata not being logged in
    Given I am not logged in
    And there is a kata created by "me@myself.com" with title "Rubik's Cube" in the language "Haskell"
    And I am on the katas page
    When I follow "edit_1st"
    Then I should see "You must be logged in to do this"

