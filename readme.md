# Behat boilerplate

Behat is an open source behavior-driven development framework for PHP. It uses the [Gherkin language](https://github.com/cucumber/cucumber/wiki/Gherkin) which lets you describe software behaviour without detailing how that behaviour is implemented.

```gherkin
Feature: Global elements

Scenario: Site is accessible
	Given I am on the homepage
	Then the response status code should be 200

Scenario: There are no errors or warnings
	Given I am on the homepage
	Then I should not see "error"
	And I should not see "warning"
```

This runs two Scenarios (tests) within a Feature (group). It uses the bundled assertions and conditions that are included with [Mink](http://mink.behat.org/) - an acceptance test framework that is part of Behat.

You can also define your own conditions, actions and assertions by simply writing a test that Behat does not recognise it will generate the boilerplate code required to implement it, like so:

```gherkin
Scenario: My custom test
	Given I am on the homepage
	And I complete the "test" form
	Then I should see "Thanks for entering"
```

Would output the following boilerplate to use after running the test:

```php
/**
 * @Given /^I complete the "([^"]*)" form$/
 */
public function iCompleteTheForm($arg1)
{
    throw new PendingException();
}
```

## Project structure

```
.
├── behat.yml
├── composer.json
└── features
    ├── bootstrap
    │   └── FeatureContext.php
    └── global.feature
```

- `behat.yml` - The project configuration file, contains things like the URLs to run tests against and browser driver options.
- `composer.json` - Declares the Behat dependencies as development dependencies along with Mink and the [Goutte browser](https://github.com/fabpot/goutte) driver.
- `features/` - Contains all the project tests
- `features/bootstrap/` - Contains PHP files that define custom conditions, actions and assertions used to write tests.
- `features/bootstrap/FeatureContext.php` - Loads the Mink context for tests, custom tests can be added as methods on the `FeatureContext` class.
- `features/global.feature` - An example feature written in the Gherkin language that should be applicable to any site.


## Mink steps

The default conditions, actions and assertions provided by Mink that can be used to write tests.

```
Given /^(?:|I )am on (?:|the )homepage$/
When /^(?:|I )go to (?:|the )homepage$/
Given /^(?:|I )am on "(?P<page>[^"]+)"$/
When /^(?:|I )go to "(?P<page>[^"]+)"$/
When /^(?:|I )reload the page$/
When /^(?:|I )move backward one page$/
When /^(?:|I )move forward one page$/
When /^(?:|I )press "(?P<button>(?:[^"]|\\")*)"$/
When /^(?:|I )follow "(?P<link>(?:[^"]|\\")*)"$/
When /^(?:|I )fill in "(?P<field>(?:[^"]|\\")*)" with "(?P<value>(?:[^"]|\\")*)"$/
When /^(?:|I )fill in "(?P<field>(?:[^"]|\\")*)" with:$/
When /^(?:|I )fill in "(?P<value>(?:[^"]|\\")*)" for "(?P<field>(?:[^"]|\\")*)"$/
When /^(?:|I )fill in the following:$/
When /^(?:|I )select "(?P<option>(?:[^"]|\\")*)" from "(?P<select>(?:[^"]|\\")*)"$/
When /^(?:|I )additionally select "(?P<option>(?:[^"]|\\")*)" from "(?P<select>(?:[^"]|\\")*)"$/
When /^(?:|I )check "(?P<option>(?:[^"]|\\")*)"$/
When /^(?:|I )uncheck "(?P<option>(?:[^"]|\\")*)"$/
When /^(?:|I )attach the file "(?P[^"]*)" to "(?P<field>(?:[^"]|\\")*)"$/
Then /^(?:|I )should be on "(?P<page>[^"]+)"$/
Then /^(?:|I )should be on (?:|the )homepage$/
Then /^the (?i)url(?-i) should match (?P<pattern>"([^"]|\\")*")$/
Then /^the response status code should be (?P<code>\d+)$/
Then /^the response status code should not be (?P<code>\d+)$/
Then /^(?:|I )should see "(?P<text>(?:[^"]|\\")*)"$/
Then /^(?:|I )should not see "(?P<text>(?:[^"]|\\")*)"$/
Then /^(?:|I )should see text matching (?P<pattern>"(?:[^"]|\\")*")$/
Then /^(?:|I )should not see text matching (?P<pattern>"(?:[^"]|\\")*")$/
Then /^the response should contain "(?P<text>(?:[^"]|\\")*)"$/
Then /^the response should not contain "(?P<text>(?:[^"]|\\")*)"$/
Then /^(?:|I )should see "(?P<text>(?:[^"]|\\")*)" in the "(?P<element>[^"]*)" element$/
Then /^(?:|I )should not see "(?P<text>(?:[^"]|\\")*)" in the "(?P<element>[^"]*)" element$/
Then /^the "(?P<element>[^"]*)" element should contain "(?P<value>(?:[^"]|\\")*)"$/
Then /^the "(?P<element>[^"]*)" element should not contain "(?P<value>(?:[^"]|\\")*)"$/
Then /^(?:|I )should see an? "(?P<element>[^"]*)" element$/
Then /^(?:|I )should not see an? "(?P<element>[^"]*)" element$/
Then /^the "(?P<field>(?:[^"]|\\")*)" field should contain "(?P<value>(?:[^"]|\\")*)"$/
Then /^the "(?P<field>(?:[^"]|\\")*)" field should not contain "(?P<value>(?:[^"]|\\")*)"$/
Then /^the "(?P<checkbox>(?:[^"]|\\")*)" checkbox should be checked$/
Then /^the checkbox "(?P<checkbox>(?:[^"]|\\")*)" (?:is|should be) checked$/
Then /^the "(?P<checkbox>(?:[^"]|\\")*)" checkbox should not be checked$/
Then /^the checkbox "(?P<checkbox>(?:[^"]|\\")*)" should (?:be unchecked|not be checked)$/
Then /^the checkbox "(?P<checkbox>(?:[^"]|\\")*)" is (?:unchecked|not checked)$/
Then /^(?:|I )should see (?P<num>\d+) "(?P<element>[^"]*)" elements?$/
Then /^print current URL$/
Then /^print last response$/
Then /^show last response$/
```

## Documentation

- [Behat cheat sheet](http://blog.lepine.pro/images/2012-03-behat-cheat-sheet-en.pdf)
- [Writing Features - Gherkin Language](http://docs.behat.org/guides/1.gherkin.html)
- [Defining Reusable Actions - Step Definitions](http://docs.behat.org/guides/2.definitions.html)
- [Hooking into the Test Process - Hooks](http://docs.behat.org/guides/3.hooks.html)
- [Testing Features - FeatureContext Class](http://docs.behat.org/guides/4.context.html)
- [Closures as Definitions and Hooks](http://docs.behat.org/guides/5.closures.html)
- [Command Line Tool - `behat`](http://docs.behat.org/guides/6.cli.html)
- [Configuration - `behat.yml`](http://docs.behat.org/guides/7.config.html)

## License

Copyright © 2014 HeyHuman

This program is free software: you can redistribute it and/or modify it under the terms of the [GNU General Public License](license.md) as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.