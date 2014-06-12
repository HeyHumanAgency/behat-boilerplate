Feature: Global elements

Scenario: Site is accessible
	Given I am on the homepage
	Then the response status code should be 200
	And print current URL

Scenario: There are no errors or warnings
	Given I am on the homepage
	Then I should not see "error"
	And I should not see "warning"

Scenario: Header
	Given I am on the homepage
	Then I should see a "header" element

Scenario: Footer
	Given I am on the homepage
	Then I should see a "footer" element