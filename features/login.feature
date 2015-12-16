Feature: Login
  In order to be able to use the features of the site
  As an editor
  I want to login to the site

#  Scenario: Register
#    Given I am not yet registered as "test.user@test.nl" with password "supersecret"
#    When I register as "test.user@test.nl" with password "supersecret"
#    Then I should be registered
#
#  Scenario: Register
#    Given I am not already registered as a user
#    When I register as "test.user@test.nl" with password "supersecret"
#    Then I should receive an error message "user already registered"

  Scenario: Login
    Given I am registered as "test.user@test.nl"
    When I login as "test.user@test.nl" with password "supersecret"
    Then I should get a login confirmation

  Scenario: Logout
    Given I login as "test.user@test.nl" with password "supersecret"
#    I am logged in as "test.user@test.nl"
    When I logout
    Then I should get a logout confirmation



