Feature: User Sign Up
  As a new user
  I want to sign up for an account
  So that I can log in and use the application

  Scenario: Signup successful with correct email and password format
    Given I am on the sign up page
    When I fill in valid sign up details with "st123456@ait.ac.th" and "password"
    And I click the "Sign Up" button
    Then I should see "Welcome! You have signed up successfully."

  Scenario: Signup failed for ait.asia and ait.ac.th with invalid email format
    Given I am on the sign up page
    When I fill in invalid email format "invalid_email@invalid.com" and a valid password
    And I click the "Sign Up" button
    Then I should see the error "Email must follow AIT format"

  Scenario: Signup failed for ait.asia and ait.ac.th with invalid password format
    Given I am on the sign up page
    When I fill in valid email "st123456@ait.ac.th" and an invalid password "123"
    And I click the "Sign Up" button
    Then I should see the error "Password is too short (minimum is 6 characters)"

  Scenario: Signup failed for ait.asia and ait.ac.th with blank password
    Given I am on the sign up page
    When I fill in valid email "st123456@ait.asia" and a blank password
    And I click the "Sign Up" button
    Then I should see the error "Password can't be blank"

  Scenario: Signup failed for ait.asia and ait.ac.th with mismatched password confirmation
    Given I am on the sign up page
    When I fill in valid email "st123456@ait.ac.th", password "password", and mismatched confirmation "notpassword"
    And I click the "Sign Up" button
    Then I should see the error "Password confirmation doesn't match Password"