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

Scenario: Try to register an user that already exists

Scenario: Login as an registered user

Scenario: Try to login as an invalid user
