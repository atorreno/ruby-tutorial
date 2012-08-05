# features/user_registration.feature
Feature: New User Registration
	As a user
	I am able to sign up to the site
	So that I am able to access extended capability on the site

	@wip
	Scenario: Successful Registration
		Given I am an unregistered user
		And I am on the homepage
		And I am not logged in
		When I register
		Then the registration modal should be visible
		When I complete the registration form
		Then the registration should be complete
		And the registration modal should not be visible
		And I should be on the homepage
		And I should be logged in