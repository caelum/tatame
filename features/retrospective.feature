Feature: Retrospective
  In order to publicly document dojo sessions
  As an administrator
  I want to create, edit and show retrospectives
  
  Scenario: Show past dojos
    Given there are 3 past dojos
    And I am on the root page
    Then I should see a dojo 1 days past
    And I should see a dojo 2 days past
    And I should see a dojo 3 days past