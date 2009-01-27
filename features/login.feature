Feature: Login
  In order to restrict and track access and edition
  As an administrator
  I want to have control of login and edition of the system

  Scenario: Register an user
    Given I am on the root page
    When I follow "Register"
    And I fill in "email" with "my@email.com"
    And I fill in "password" with "pass"
    And I press "Register"
    Then I should see "Welcome, my@email.com"
    And there should exist an user with email "my@email.com"

  Scenario: Try to register an invalid user
    Given I am on the root page
    When I follow "Register"
    And I fill in "email" with ""
    And I fill in "password" with ""
    And I press "Register"
    Then I should see "Email can't be blank"
    And I should see "Password can't be blank"

  Scenario: Try to register an user that already exists
    Given I am on the root page
    And there is an user registered as "my@email.com"
    When I follow "Register"
    And I fill in "email" with "my@email.com"
    And I fill in "password" with "password"
    And I press "Register"
    Then I should see "There is an user already registered with this email"

  Scenario: Login as an registered user
    Given I am not logged in
    And there is an user registered as "my@email.com"
    And I am on the root page
    When I fill in "email" with "my@email.com"
    And I fill in "password" with "1234"
    And I press "Login"
    Then I should see "Welcome, my@email.com"
    And I should be logged in as "my@email.com"

  Scenario: Try to login as an invalid user
