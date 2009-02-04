Feature: Retrospective
  In order to publicly document dojo sessions
  As an administrator
  I want to create, edit and show retrospectives
  
  Scenario: Show past dojos with empty retrospectives
    Given I am logged in
    And there are 3 past dojos
    And I am on the root page
    Then I should see a dojo 1 days past
    And I should see "add_retrospective_1st"
    And I should see a dojo 2 days past
    And I should see "add_retrospective_2nd"
    And I should see a dojo 3 days past
    And I should see "add_retrospective_3rd"

  Scenario: Show past dojos with retrospectives
    Given I am logged in
    And there are 2 past dojos
    And the dojo 1 days past has a retrospective
    And I am on the root page
    Then I should see a dojo 1 days past with retrospective
    And I should not see "add_retrospective_1st"
    And I should see a dojo 2 days past
    And I should see "add_retrospective_2nd"

  Scenario: Add a retrospective being logged in
    Given I am logged in
    And there are 1 past dojos
    And I am on the root page
    When I follow "add_retrospective_1st"
    And I fill in "Problem" with "Rubik's Cube"
    And I fill in "Code" with "http://hyperlink.to/code"
    And I fill in "Report" with "Loren ipsum dolor sit amet."
    And I fill in "Retrospective" with "Duis sed magna. Etiam vel nunc."
    And I fill in "Parking Lot" with "... is full"
    And I fill in "Dojo title" with "A searchable title"
    And I press "Save"
    Then I should not see "add_retrospective_1st"
    And I should see "edit_retrospective_1st"
    And I should see "A searchable title"

  Scenario: Can't add a retrospective not being logged in
    Given I am not logged in
    And there are 1 past dojos
    And I am on the root page
    Then I should not see "add_retrospective_1st"

  Scenario: Edit a retrospective being logged in
    Given I am logged in
    And there are 1 past dojos
    And the dojo 1 days past has a retrospective
    And I am on the root page
    When I follow "edit_retrospective_1st"
    And I fill in "Dojo title" with "A searchable title"
    And I press "Save"
    Then I should see "A searchable title"

  Scenario: Can't edit a retrospective not being logged in
    Given I am not logged in
    And there are 1 past dojos
    And the dojo 1 days past has a retrospective
    And I am on the root page
    Then I should not see "edit_retrospective_1st"
  
  Scenario: List all subscribed participants in retrospective edit page
    Given I am logged in
    And there are 1 past dojos
    And the dojo 1 days past has 3 participants
    And I am on the root page
    When I follow "add_retrospective_1st"
    Then I should see "Participant 1"
    Then I should see "Participant 2"
    Then I should see "Participant 3"
  
  Scenario: Subscribe new participants in retrospective edit page
    Given I am logged in
    And there are 1 past dojos
    And the dojo 1 days past has 3 participants
    And I am on the root page
    When I follow "add_retrospective_1st"
    And I fill in "participant_name" with "Plutarco"
    And I press "Add"
    Then I should see "Plutarco"
  
  Scenario: Confirm presence of subscribed participants in retrospective edit page
    Given I am logged in
    And there are 1 past dojos
    And the dojo 1 days past has 3 participants
    And I am on the root page
    When I follow "add_retrospective_1st"
    And I check "Participant 1"
    And I check "Participant 3"
    And I press "Save"
    Then I should see "Participant 1"
    And I should see "Participant 3"
    And I should not see "Participant 2"