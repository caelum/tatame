Feature: Manage dojos
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: Register new dojo
    Given I am on the new dojo page
    When I fill in "Title" with "My dojo title:string"
    And I fill in "Date:date" with "My dojo date:date"
    And I fill in "Time:time" with "My dojo time:time"
    And I press "Create"
    Then I should see "My dojo title:string"
    And I should see "My dojo date:date"
    And I should see "My dojo time:time"

  Scenario: Delete dojo
    Given there are 4 dojos
    When I delete the first dojo
    Then there should be 3 dojos left
    
  More Examples:
    | initial | after |
    | 100     | 99    |
    | 1       | 0     |