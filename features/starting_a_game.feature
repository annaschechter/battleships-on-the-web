Feature: Starting the game
  In order to play battleships
  As a nostalgic player
  I want to start a new game

  Scenario: Clicking New Game
    Given I am on the homepage
    When I follow "New Game"
    Then I should see "What's your name?"

  Scenario: No name
    Given I am on the name page
    When I don't enter name
    And I click on "Submit"
    Then I return to the name page
  
  Scenario: No opponent
    Given I am on the name page 
    And there are no opponents
    When I fill in "name" with "text"
    And I click on "Submit"
    Then I go to the message page 

  Scenario: Opponent exists
    Given I am on the name page
    When I fill in "name" with "text"
    And I click on "Submit"
    Then I go to the place_ships page





