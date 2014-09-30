Feature: Starting the game
  In order to play battleships
  As a nostalgic player
  I want to start a new game

  Scenario: Clicking New Game
    Given I am on the homepage
    When I follow "New Game"
    Then I should see "Player 1. What's your name?"
 
  Scenario: Entering Name
    Given I am on the name page
    When I fill in "name" with "Anna"
    And I click on "Submit"
    Then I see "Wellcome Anna"

  Scenario: No name
    Given I am on the name page
    When I don't enter name
    And I click on "Submit"
    Then I return to the name page
