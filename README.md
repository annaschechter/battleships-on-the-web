Battleships On The Web
======================
Batleships on the web is the week three project at Makers Academy. In this week we were introduced to Sinatra and Cucumber testing suite.
Specification
-------------
Batleships is a two player online game with the following functionality:
* players can join the game from different browsers
* each player has a 10 by 10 grid on which they can place 5 ships
* each ships has a different size
* once the ships are placed the players start shooting
* by default it is player1's go first and after each shot it will switch the turns 
* the game will terminate when there is a winner (i.e. the player who sank all of the opponent's ships)
* the winner of the game is announced

Languages and Tools
-------------------
* Ruby
* Sinatra
* RSpec
* Cucumber

How to use
----------
Clone the repository:
```
$ git clone git@github.com:annaschechter/battleships-on-the-web.git
```
Install the gems:
```
$ bundle install
```
Run RSpec to see the unit tests:
```
$ rspec
```
Run Cucumber to see the feature tests:
```
$ cucumber
```
Rackup:
```
$ rackup
```
In your browser visit http://localhost:9292/ to play!
