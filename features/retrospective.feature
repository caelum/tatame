Feature: Retrospective
  In order to publicly document dojo sessions
  As an administrator
  I want to create, edit and show retrospectives
  
  Scenario: Show past dojos with empty retrospectives
    Given there are 3 past dojos
    And I am on the root page
    Then I should see a dojo 1 days past
    And I should see "add_retrospective_1st"
    And I should see a dojo 2 days past
    And I should see "add_retrospective_2nd"
    And I should see a dojo 3 days past
    And I should see "add_retrospective_3rd"

  Scenario: Show past dojos with retrospectives

  Scenario: Add a retrospective being logged in

  Scenario: Can't add a retrospective not being logged in

  Scenario: Edit a retrospective being logged in

  Scenario: Can't edit a retrospective not being logged in
