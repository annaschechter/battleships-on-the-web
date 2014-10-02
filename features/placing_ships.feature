Feature: Placing ships
  In order to start playing
  As a reasonable player
  I want to place my ships

Scenario: Seeing the board
  Given I am on the placing_ships page
  Then I should see "This is your board: * A B C D E F G H I J 1 # # # # # # # # # # 2 # # # # # # # # # # 3 # # # # # # # # # # 4 # # # # # # # # # # 5 # # # # # # # # # # 6 # # # # # # # # # # 7 # # # # # # # # # # 8 # # # # # # # # # # 9 # # # # # # # # # # 10 # # # # # # # # # #"
  And I should see "Start placing ships" link

Scenario: Placing first ship
  Given I am on the placing_ships page
  When I follow "Start placing ships" link
  Then I go to the ships page
  And I see "Choose coordinates for your patrol boat(size 5)"
