Feature: Starting the game
  In order to play battleships
  As a nostalgic player
  I want to start a new game

  Scenario: Clicking New Game
    Given I am on the homepage
    When I follow "New Game"
    Then I should see "What's your name?"
 
  Scenario: Entering Name
    Given I am on the name page
    When I fill in "name" with "Anna"
    And I click on "Submit"
    Then I see "Wellcome Anna "
