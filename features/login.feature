Feature: Login
  In order to restrict and track access and edition
  As an administrator
  I want to have control of login and edition of the system

  Scenario: Register an user
    Given I am logged in
    And I am on the root page
    When I follow "Register"
    And I fill in "user_email" with "my@email.com"
    And I fill in "user_password" with "pass"
    And I fill in "user_password_confirmation" with "pass"
    And I press "Register"
    Then I should see "Added user my@email.com"
    And there should exist an user with email "my@email.com"

  Scenario: Try to register an invalid user
    Given I am logged in
    And I am on the root page
    When I follow "Register"
    And I fill in "user_email" with ""
    And I fill in "user_password" with ""
    And I fill in "user_password_confirmation" with ""
    And I press "Register"
    Then I should see "Email is too short"
    And I should see "Password is too short"
    And I should not see "Added user"

  Scenario: Try to register an user that already exists
    Given I am logged in
    And I am on the root page
    And there is an user registered as "my@email.com"
    When I follow "Register"
    And I fill in "user_email" with "my@email.com"
    And I fill in "user_password" with "Password"
    And I fill in "user_password_confirmation" with "Password"
    And I press "Register"
    Then I should see "There is an user already registered with this email"

  Scenario: Login as an registered user
    Given I am not logged in
    And there is an user registered as "my@email.com"
    And I am on the root page
    When I fill in "user_session_email" with "my@email.com"
    And I fill in "user_session_password" with "1234"
    And I press "Login"
    Then I should see "Welcome, my@email.com"
    And I should be logged in as "my@email.com"

  Scenario: Try to login as an invalid user
    Given I am not logged in
    And I am on the root page
    When I fill in "user_session_email" with "notavaliduser@test.com"
    When I fill in "user_session_password" with "obviouslyincorrectpassword"
    And I press "Login"
    Then I should see "Login failed"

  Scenario: Try to login as an existing user with the incorrect password
    Given I am not logged in
    And there is an user registered as "my@email.com"
    And I am on the root page
    When I fill in "user_session_email" with "my@email.com"
    When I fill in "user_session_password" with "obviouslyincorrectpassword"
    And I press "Login"
    Then I should see "Login failed"
  
  Scenario: Logout when logged in
  	Given I am logged in
  	And I am on the root page
  	When I follow "Logout"
  	Then I should see "user_session_email"
  	And I should see "user_session_password"
  
  Scenario: Can't logout if not logged in
  	Given I am not logged in
  	And I am on the root page
  	Then I should not see "Logout"
