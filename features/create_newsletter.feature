Feature: Create a newsletter
  In order to publish to Word and App
  As a newsletter editor
  I want to create a newsletter with all attributes required

  Scenario Outline: Create a very simple newsletter
    Given I login as "test.user@test.nl" with password "supersecret"
    When I enter text on "<welcome>", date as <year>, "<month>", <day>, time1 as <hour1>, <minute1>, time2 as <hour2>, <minute2>, "<announcement>" and "<liturgy>"
    Then I want to see a confirmation message
    And I want to see the same data in the JSON page
    Examples:
      | welcome | year | month | day | hour1 | minute1 | hour2 | minute2 | announcement | liturgy  |
      | hallo   | 2015 | May   | 12  | 10    | 00      | 17    | 00      | mededeling   | liturgie |
    

  